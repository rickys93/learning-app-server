const request = require("supertest");
const app = require("../../api");
const Category = require("../../models/Category");
const categoriesController = require("../../controllers/categories");

jest.mock("../../models/Category");

describe("Categories Controller", () => {
    afterEach(() => {
        jest.resetAllMocks();
    });

    describe("index", () => {
        test("should return 200 and an array of categories", async () => {
            const categories = [
                { id: 1, name: "Category 1" },
                { id: 2, name: "Category 2" },
            ];

            Category.getAll.mockResolvedValue(categories);

            const response = await request(app).get("/categories");

            expect(response.status).toBe(200);
            expect(response.body).toEqual(categories);
            expect(Category.getAll).toHaveBeenCalledTimes(1);
        });

        test("should return 500 and an error message when an error occurs", async () => {
            Category.getAll.mockRejectedValue(
                new Error("Internal server error")
            );

            const response = await request(app).get("/categories");

            expect(response.status).toBe(500);
            expect(response.body).toEqual({ error: "Internal server error" });
            expect(Category.getAll).toHaveBeenCalledTimes(1);
        });
    });

    describe("GET /categories/:id", () => {
        test("should return 200 and a category object", async () => {
            const id = 1;
            const category = { id, name: "Category 1" };

            Category.getOneById.mockResolvedValue(category);

            const response = await request(app).get(`/categories/${id}`);

            expect(response.status).toBe(200);
            expect(response.body).toEqual(category);
            expect(Category.getOneById).toHaveBeenCalledWith(id);
        });

        test("should return 404 and an error message when category is not found", async () => {
            const id = 999;

            Category.getOneById.mockResolvedValue(null);

            const response = await request(app).get(`/categories/${id}`);

            expect(response.status).toBe(404);
            expect(response.body).toEqual({
                error: `Category with id ${id} not found`,
            });
            expect(Category.getOneById).toHaveBeenCalledWith(id);
        });

        // test("should return 500 and an error message when an error occurs", async () => {
        //     const id = 1;

        //     Category.getOneById.mockRejectedValue(
        //         new Error("Internal server error")
        //     );

        //     const response = await request(app).get(`/categories/${id}`);

        //     expect(response.status).toBe(500);
        //     expect(response.body).toEqual({ error: "Internal server error" });
        //     expect(Category.getOneById).toHaveBeenCalledWith(id);
        // });
    });
});
