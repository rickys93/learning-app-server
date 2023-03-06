const request = require("supertest");
const app = require("../../api");

const questionsController = require("../../controllers/questions");

// Mock the questions controller
jest.mock("../../controllers/questions", () => ({
    getQuestionsByCategory: jest.fn((req, res) => {
        res.sendStatus(200);
    }),
    create: jest.fn((req, res) => {
        res.sendStatus(201);
    }),
    index: jest.fn((req, res) => {
        res.sendStatus(200);
    }),
    show: jest.fn((req, res) => {
        res.sendStatus(200);
    }),
    destroy: jest.fn((req, res) => {
        res.sendStatus(204);
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
        const res = await request(app).get("/questions/categories/2");
        expect(questionsController.getQuestionsByCategory).toHaveBeenCalled();
    });

    test("POST /questions should return 201", async () => {
        const res = await request(app).post("/questions").send({
            name: "Test Category",
            description: "This is a test category",
        });
        expect(questionsController.create).toHaveBeenCalled();
    });

    test("DELETE /questions/:id should return 204", async () => {
        const res = await request(app).delete("/questions/1");
        expect(questionsController.destroy).toHaveBeenCalled();
    });

    test("GET /questions/:id should return 200", async () => {
        const res = await request(app).get("/questions/2");
        expect(questionsController.show).toHaveBeenCalled();
    });
});
