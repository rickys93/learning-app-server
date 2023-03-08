const Question = require("../models/Question");
const Answer = require("../models/Answer");

async function index(req, res) {
    try {
        const questions = await Question.getAll();

        // add the answers for each question
        for (q of questions) {
            const answers = await Answer.getByQuestionId(q.id);
            q.answers = answers;
        }

        res.status(200).json(questions);
    } catch (error) {
        res.status(500).json({ error: error.message });
    }
}

// this function gets a certain amount of questions from a certain category
async function getQuestionsByCategory(req, res) {
    try {
        // category id to search for
        const categoryId = parseInt(req.params.categoryId);
        // amount of questions to get
        const limit = parseInt(req.query.limit);
        const questions = await Question.getQuestionsByCategory(
            categoryId,
            limit
        );

        // add the answers for each question
        for (q of questions) {
            const answers = await Answer.getByQuestionId(q.id);
            q.answers = answers;
        }

        res.status(200).json(questions);
    } catch (error) {
        res.status(500).json({ error: error.message });
    }
}

async function show(req, res) {
    try {
        const id = parseInt(req.params.id);
        const question = await Question.getOneById(id);

        const answers = await Answer.getByQuestionId(question.id);
        question.answers = answers;

        res.status(200).json(snack);
    } catch (err) {
        res.status(404).json({ error: err.message });
    }
}

async function create(req, res) {
    try {
        const data = req.body;
        const newQuestion = await Question.create(data);

        res.status(201).json(newQuestion);
    } catch (err) {
        res.status(404).json({ error: err.message });
    }
}

async function destroy(req, res) {
    try {
        const id = parseInt(req.params.id);
        const question = await Question.getOneById(id);
        const result = await question.destroy();
        res.status(200).json(result);
    } catch (err) {
        res.status(404).json({ error: err.message });
    }
}

async function logAnswer(req, res) {
    try {
        res.sendStatus(501)
    } catch (err) {
        res.status(500).json({error: err.message})
    }
}

module.exports = {
    index,
    show,
    create,
    destroy,
    getQuestionsByCategory,
    logAnswer
};
