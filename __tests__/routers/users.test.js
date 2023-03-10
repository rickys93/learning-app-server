const request = require("supertest");
const app = require("../../api");

// Mock the users controller
jest.mock("../../controllers/users", () => ({
    authorize: jest.fn((req, res) => {
        res.sendStatus(201);
    }),
    register: jest.fn((req, res) => {
        res.sendStatus(200);
    }),
    login: jest.fn((req, res) => {
        res.sendStatus(200);
    }),
    logout: jest.fn((req, res) => {
        res.sendStatus(204);
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
        expect(questionsController.authorize).toHaveBeenCalled();
    });
});
