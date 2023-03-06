const bcrypt = require("bcrypt");

const User = require("../models/User");
const Token = require("../models/token");

async function register(req, res) {
    try {
        const data = req.body;
        const salt = await bcrypt.genSalt(10);
        const hashedPassword = await bcrypt.hash(data.password, salt);
        if (await User.usernameTaken(data.username)) {
            throw new Error("Username already taken.");
        }

        const result = await User.create({ ...data, password: hashedPassword });
        return res.status(201).json({ message: "Register successful!" });
    } catch (error) {
        res.status(400).json({ error: error.message });
    }
}

async function login(req, res) {
    try {
        const data = req.body;
        const user = await User.getOneByUsername(data.username);

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
            const token = await Token.create(user["id"]);
            res.status(200).json({ authenticated: true, token: token.token });
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
        res.json({ username: user.username });
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
