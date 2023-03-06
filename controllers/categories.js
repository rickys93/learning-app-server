const Category = require("../models/Category");

async function index(req, res) {
    try {
        const categories = await Category.getAll();

        res.status(200).json(categories);
    } catch (error) {
        res.status(500).json({ error: error.message });
    }
}

async function show(req, res) {
    try {
        const id = parseInt(req.params.id);
        const category = await Category.getOneById(id);
        if (!category) {
            throw new Error(`Category with id ${id} not found`);
        }
        res.status(200).json(category);
    } catch (err) {
        res.status(404).json({ error: err.message });
    }
}

async function create(req, res) {
    try {
        const data = req.body;
        const newCategory = await Category.create(data);

        res.status(201).json(newCategory);
    } catch (err) {
        res.status(404).json({ error: err.message });
    }
}

module.exports = {
    index,
    show,
    create,
};
