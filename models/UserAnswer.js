const db = require("../database/connect");

class UserAnswer {
    constructor({ user_id, question_id, correct }) {
        this.user_id = user_id;
        this.question_id = question_id;
        this.correct = correct;
    }

    static async create({ user_id, question_id, correct }) {
        const response = await db.query(
            "INSERT INTO user_answers (user_id, question_id, correct, timestamp) VALUES ($1, $2, $3, CURRENT_TIMESTAMP) RETURNING *",
            [user_id, question_id, correct]
        );

        return response.rows[0];
    }

    static async getByUserId(id) {
        const response = await db.query("SELECT * FROM user_answers WHERE user_id = $1", [
            id,
        ]);
        if (response.rows.length < 1) {
            throw new Error("Unable to locate matching user answers.");
        } else {
            return response.rows.map((g) => new UserAnswer(g));
        }
    }

    static async getByQuestionId(question_id) {
        const response = await db.query(
            "SELECT * FROM user_answers WHERE question_id = $1",
            [question_id]
        );
        if (response.rows.length < 1) {
            throw new Error("Unable to locate matching user answers.");
        } else {
            return response.rows.map((g) => new UserAnswer(g));
        }
    }
}

module.exports = UserAnswer;
