const db = require("../database/connect");

class Answer {
    constructor({ id, question_id, answer, correct }) {
        this.id = id;
        this.question_id = question_id;
        this.answer = answer;
        this.correct = correct;
    }

    static async getAll() {
        const response = await db.query("SELECT * FROM answers;");
        return response.rows.map((g) => new Answer(g));
    }

    static async create({ id, question_id, answer, correct }) {
        const response = await db.query(
            "INSERT INTO answers (id, question_id, answer, correct) VALUES ($1, $2, $3, $4) RETURNING *",
            [id, question_id, answer, correct]
        );
        const newId = response.rows[0].id;
        const newAnswer = await Answer.getOneById(newId);
        return newAnswer;
    }

    static async getOneById(id) {
        const response = await db.query("SELECT * FROM answers WHERE id = $1", [
            id,
        ]);
        if (response.rows.length != 1) {
            throw new Error("Unable to locate answers.");
        } else {
            return new Answer(response.rows[0]);
        }
    }

    static async getByQuestionId(question_id) {
        const response = await db.query(
            "SELECT * FROM answers WHERE question_id = $1",
            [question_id]
        );
        if (response.rows.length < 1) {
            throw new Error("Unable to locate answers.");
        } else {
            return response.rows.map((g) => new Answer(g));
        }
    }

    async destroy() {
        let response = await db.query(
            "DELETE FROM answers WHERE id = $1 RETURNING *;",
            [this.id]
        );

        return new Answer(response.rows[0]);
    }
}

module.exports = Answer;
