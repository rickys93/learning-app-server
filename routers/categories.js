const { Router } = require("express");

const categoriesController = require("../controllers/categories");

const categoriesRouter = Router();

categoriesRouter.get("/", categoriesController.index);
categoriesRouter.post("/", categoriesController.create);

module.exports = categoriesRouter;
