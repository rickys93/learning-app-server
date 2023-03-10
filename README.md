# Crammer UK Server
Crammer UK is a quiz and flashcard app designed to help users learn about different subjects. The app allows users to create and study sets of flashcards, as well as take quizzes to test their knowledge. With a user-friendly interface and customizable options, Crammer UK is a great tool for students and anyone interested in expanding their knowledge.

The server is built using Node.js and Express, a popular framework for building web applications. The server communicates with a PostgreSQL database, where all quiz and user data is stored.

## Installing Required Libraries
To install the required libraries, follow these steps:

1. Open a terminal.
2. Navigate to the `<project-directory>` directory.
3. Type `npm install`.

## Setting Up The Environment
In the `<project-directory>` directory, create a file named .env.
Add the following lines to the file:
```bash
PORT=3000
DB_URL=postgres://<db-username>:<db-password>@<hostname>/<db-name>
```
Replace the placeholders of DB_URL with the appropriate values.

## Setting Up The Database
To set up the database, follow these steps:
1. Open a terminal.
2. Navigate to the `<project-directory>` directory.
3. Type `npm run setup-db`.

Once completed, the terminal should read: `Set-up complete.`

## Running the Server
To run the server, follow these steps:

1. Open a terminal.
2. Navigate to the `<project-directory>` directory.
3. Type `npm start`.

## Interacting with the API

API URL base: `http://localhost:3000/`

The API has the following routes and functionalities:

Endpoints
API URL base: http://localhost:3000/

### /categories
- / GET Returns a JSON object containing all categories.
- /:id GET Returns a JSON object representing a single category from the collection, selected by :id.
- / POST Accepts a JSON object and creates a new category.
- /:id DELETE Deletes a specific category, selected by :id.
### /questions
- /categories/:categoryId GET Returns a JSON object containing all questions associated with a specific category, selected by :categoryId.
- / GET Returns a JSON object containing all questions.
- / POST Accepts a JSON object and creates a new question.
- /:id GET Returns a JSON object representing a single question from the collection, selected by :id.
- /:id DELETE Deletes a specific question, selected by :id.
- /answerlog POST Accepts a JSON object and logs the user's answer to a question.
### /users
- /authorize GET Returns a JSON object containing the user's authorization status.
- /register POST Accepts a JSON object and creates a new user.
- /login POST Accepts a JSON object containing the user's credentials and logs the user in.
- /logout POST Logs the user out.

Use an API testing platform such as Hoppscotch to test the API.

## Known Bugs
Please note that there may be some bugs in the project, including the following:

1. More error handling may be needed.