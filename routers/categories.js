const { Router } = require("express");

const categoriesController = require("../controllers/categories");

const categoriesRouter = Router();

categoriesRouter.get("/", categoriesController.index);
categoriesRouter.get("/:id", categoriesController.show);
categoriesRouter.delete("/:id", categoriesController.destroy);
categoriesRouter.post("/", categoriesController.create);

module.exports = categoriesRouter;
