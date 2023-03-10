const { Router } = require("express");

const questionsController = require("../controllers/questions");

const questionsRouter = Router();

questionsRouter.get(
    "/categories/:categoryId",
    questionsController.getQuestionsByCategory
);
questionsRouter.get("/", questionsController.index);
questionsRouter.post("/", questionsController.create);
questionsRouter.get("/:id", questionsController.show);
questionsRouter.delete("/:id", questionsController.destroy);

questionsRouter.post("/answerlog", questionsController.logAnswer);

module.exports = questionsRouter;
