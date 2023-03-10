const db = require("../database/connect");
const Answer = require("../models/Answer");

class Question {
    constructor({ id, category_id, question }) {
        this.id = id;
        this.category_id = category_id;
        this.question = question;
    }

    static async getAll() {
        const response = await db.query("SELECT * FROM questions;");
        return response.rows.map((g) => new Question(g));
    }

    static async create({ category_id, question }) {
        const response = await db.query(
            "INSERT INTO questions (category_id, question) VALUES ($1, $2) RETURNING *",
            [category_id, question]
        );
        const newId = response.rows[0].id;
        const newQuestion = await Question.getOneById(newId);
        return newQuestion;
    }

    static async getOneById(id) {
        const response = await db.query(
            "SELECT * FROM questions WHERE id = $1",
            [id]
        );
        if (response.rows.length != 1) {
            throw new Error("Unable to locate questions.");
        } else {
            return new Question(response.rows[0]);
        }
    }

    static async getQuestionsByCategory(categoryId, limit) {
        const response = await db.query(
            "SELECT * FROM questions WHERE category_id = $1 LIMIT $2",
            [categoryId, limit]
        );
        if (response.rows.length === 0) {
            throw new Error("Unable to locate questions.");
        } else {
            return response.rows.map((g) => new Question(g));
        }
    }

    async destroy() {
        let response = await db.query(
            "DELETE FROM questions WHERE id = $1 RETURNING *;",
            [this.id]
        );

        return new Question(response.rows[0]);
    }

    static async destroyAllInCategory(id) {
        const response = await db.query(
            "SELECT * FROM questions WHERE category_id = $1;",
            [id]
        );
        const questions = response.rows.map((g) => new Question(g));
        for (let q of questions) {
            const response = await db.query(
                "DELETE FROM answers WHERE question_id = $1 RETURNING *;",
                [q.id]
            );
            q.destroy();
        }
        return response.rows.map((g) => new Question(g));
    }
}

module.exports = Question;
