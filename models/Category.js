const db = require("../database/connect");

class Category {
    constructor({ id, name, description }) {
        this.id = id;
        this.name = name;
        this.description = description;
    }

    static async getAll() {
        const response = await db.query(
            "SELECT * FROM categories ORDER BY name;"
        );
        return response.rows.map((g) => new Category(g));
    }

    static async getOneById(id) {
        const response = await db.query(
            "SELECT * FROM categories WHERE id = $1;",
            [id]
        );
        if (response.rows.length != 1) {
            throw new Error("Unable to locate categories.");
        }
        return new Category(response.rows[0]);
    }

    static async create(data) {
        const { name, description } = data;
        const response = await db.query(
            "INSERT INTO categories (name, description) VALUES ($1, $2) RETURNING *;",
            [name, description]
        );

        return response.rows.map((w) => new Category(w));
    }
}

module.exports = Category;
