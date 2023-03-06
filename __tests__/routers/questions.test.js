const request = require("supertest");
const app = require("../../api");

// Mock the questions controller
jest.mock("../../controllers/questions", () => ({
    getQuestionsByCategory: jest.fn((req, res) => {
        res.status(200).json([1, 2, 3]);
    }),
    create: jest.fn((req, res) => {
        res.status(201).json({ id: 1 });
    }),
    index: jest.fn((req, res) => {
        res.status(200).json([1, 2]);
    }),
    show: jest.fn((req, res) => {
        res.status(200).json([1, 2]);
    }),
    destroy: jest.fn((req, res) => {
        res.status(204).json([1]);
    }),
}));

describe("Questions Router", () => {
    let api;

    beforeAll(() => {
        api = app.listen(5001, () => {
            console.log("Test server running on port 5000");
        });
    });

    afterAll((done) => {
        console.log("Gracefully stopping test server");
        api.close(done);
    });

    test("GET /questions/new/:categoryId should return 200", async () => {
        const res = await request(app).get("/questions/new/2");
        expect(res.statusCode).toBe(200);
        expect(res.body).toStrictEqual([1, 2, 3]);
    });

    test("POST /questions should return 201", async () => {
        const res = await request(app).post("/questions").send({
            name: "Test Category",
            description: "This is a test category",
        });
        expect(res.statusCode).toBe(201);
        expect(res.body).toHaveProperty("id");
    });

    test("DELETE /questions/:id should return 204", async () => {
        const res = await request(app).delete("/questions/1");
        expect(res.statusCode).toBe(204);
    });

    test("GET /questions/:id should return 200", async () => {
        const res = await request(app).get("/questions/2");
        expect(res.statusCode).toBe(200);
        expect(res.body).toStrictEqual([1, 2]);
    });
});
