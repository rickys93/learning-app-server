const { Router } = require("express");

const questionsController = require("../controllers/questions");

const questionsRouter = Router();

questionsRouter.get("/:categoryId", questionsController.getQuestionsByCategory);
questionsRouter.get("/", questionsController.index);
questionsRouter.post("/", questionsController.create);
questionsRouter.get("/:id", questionsController.show);
questionsRouter.delete("/:id", questionsController.destroy);

module.exports = questionsRouter;
