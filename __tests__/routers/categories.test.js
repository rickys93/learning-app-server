const request = require("supertest");
const app = require("../../api");

const categoriesController = require("../../controllers/categories");

// Mock the categories controller
jest.mock("../../controllers/categories", () => ({
    create: jest.fn((req, res) => {
        res.sendStatus(201);
    }),
    index: jest.fn((req, res) => {
        res.sendStatus(200);
    }),
    show: jest.fn((req, res) => {
        res.sendStatus(200);
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

    test("POST /categories should call create function", async () => {
        await request(app).post("/categories").send({
            name: "Test Category",
            description: "This is a test category",
        });

        expect(categoriesController.create).toHaveBeenCalledTimes(1);
    });

    test("GET /categories should call index function", async () => {
        await request(app).get("/categories");

        expect(categoriesController.index).toHaveBeenCalledTimes(1);
    });
});
