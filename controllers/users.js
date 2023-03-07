const bcrypt = require("bcrypt");

const User = require("../models/User");
const Token = require("../models/token");

async function register(req, res) {
    try {
        const data = req.body;
        const salt = await bcrypt.genSalt(10);
        const hashedPassword = await bcrypt.hash(data.password, salt);
        if (
            !"first_name" in data ||
            !"last_name" in data ||
            !"email" in data ||
            !"password" in data
        ) {
            throw new Error("Please include all fields.");
        }
        if (await User.emailInUse(data.email)) {
            throw new Error("Email already in use.");
        }

        const user = await User.create({ ...data, password: hashedPassword });
        const token = await Token.create(user.id);
        delete user.password;
        user.token = token.token;
        return res.status(201).json({ authenticated: true, user });
    } catch (error) {
        res.status(400).json({ error: error.message });
    }
}

async function login(req, res) {
    try {
        const data = req.body;
        const user = await User.getOneByEmail(data.email);

        if (!user) {
            return res.status(404).json({
                message: "User not found!",
            });
        }
        const authenticated = await bcrypt.compare(
            data.password,
            user.password
        );
        if (!authenticated) {
            throw new Error("Incorrect credentials");
        } else {
            const token = await Token.create(user.id);
            delete user.password;
            user.token = token.token;
            return res.status(200).json({ authenticated: true, user });
        }
    } catch (error) {
        res.status(403).json({ error: error.message });
    }
}

async function logout(req, res) {
    try {
        const userToken = req.headers["authorization"];

        const validToken = await Token.getOneByToken(userToken);

        if (!validToken) {
            return res.status(404);
        }

        validToken.destroy();

        return res.status(204).json({
            message: "User signed out.",
        });
    } catch (error) {
        res.status(403).json({ error: error.message });
    }
}

async function authorize(req, res) {
    try {
        const userToken = req.headers["authorization"];

        if (userToken === "null") {
            return res.status(403).json({ error: "User not authenticated!" });
        }

        const validToken = await Token.getOneByToken(userToken);

        if (!validToken) {
            return res.status(404);
        }

        const user = await User.getOneById(validToken.user_id);
        return res.status(200).json({ authenticated: true, user });
    } catch (error) {
        res.status(404).json({
            error: error.message,
        });
    }
}

module.exports = {
    register,
    login,
    logout,
    authorize,
};
