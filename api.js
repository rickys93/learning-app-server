const express = require("express");
const cors = require("cors");

const logRoutes = require("./middleware/logger");
const userRouter = require("./routers/users");
const categoriesRouter = require("./routers/categories");

const api = express();

api.use(cors());
api.use(express.json());
api.use(logRoutes);

api.get("/", (req, res) => {
    res.json({
        description: "Welcome to the learning app API!",
    });
});

api.use("/users", userRouter);
api.use("/categories", categoriesRouter);

module.exports = api;
