const request = require("supertest");
const app = require("../../api");

// Mock the categories controller
jest.mock("../../controllers/categories", () => ({
    create: jest.fn((req, res) => {
        res.status(201).json({ id: 1 });
    }),
    index: jest.fn((req, res) => {
        res.status(200).json([1, 2]);
    }),
}));

describe("Categories Router", () => {
    let api;

    beforeAll(() => {
        api = app.listen(5000, () => {
            console.log("Test server running on port 5000");
        });
    });

    afterAll((done) => {
        console.log("Gracefully stopping test server");
        api.close(done);
    });

    test("POST /categories should return 201", async () => {
        const res = await request(app).post("/categories").send({
            name: "Test Category",
            description: "This is a test category",
        });
        expect(res.statusCode).toBe(201);
        expect(res.body).toHaveProperty("id");
    });

    test("GET /categories should return 200", async () => {
        const res = await request(app).get("/categories");
        expect(res.statusCode).toBe(200);
        expect(res.body).toStrictEqual([1, 2]);
    });
});
