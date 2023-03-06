const request = require("supertest");
const app = require("../../api");

// Mock the users controller
jest.mock("../../controllers/users", () => ({
    authorize: jest.fn((req, res) => {
        res.status(201).json({ id: 1 });
    }),
    register: jest.fn((req, res) => {
        res.status(200).json([1, 2]);
    }),
    login: jest.fn((req, res) => {
        res.status(200).json([1, 2]);
    }),
    logout: jest.fn((req, res) => {
        res.status(204).json([1]);
    }),
    authenticator: jest.fn((req, res, next) => {
        next();
    }),
}));

describe("Users Router", () => {
    let api;

    beforeAll(() => {
        api = app.listen(5003, () => {
            console.log("Test server running on port 5000");
        });
    });

    afterAll((done) => {
        console.log("Gracefully stopping test server");
        api.close(done);
    });

    xtest("GET /users/authorize should return 201", async () => {
        const res = await request(app).get("/users/authorize");
        expect(res.statusCode).toBe(201);
        expect(res.body).toHaveProperty("id");
    });
});
