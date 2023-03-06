const { Router } = require("express");

const userController = require("../controllers/users");
const authenticator = require("../middleware/authenticator");

const userRouter = Router();

userRouter.get("/authorize", authenticator, userController.authorize);
userRouter.post("/register", userController.register);
userRouter.post("/login", userController.login);
userRouter.post("/logout", authenticator, userController.logout);

module.exports = userRouter;
