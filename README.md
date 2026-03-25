# QA Assessment — DummyJSON API

Postman-based API test suite for [DummyJSON](https://dummyjson.com), covering authentication, products CRUD, search, and error handling.

---

## What This Project Is

This is a QA assessment project that tests the DummyJSON public REST API using Postman collections. It validates core API behaviors including authentication flows, product lifecycle operations, search functionality, and expected error responses.

**Base URL:** `https://dummyjson.com`

---

## Importing the Postman Collection

1. Open Postman.
2. Click **Import** (top left).
3. Select the collection file from `/collections/`.
4. The collection and its environment will be imported automatically.

### Setting Up the Environment

1. In Postman, go to **Environments** and select the imported environment (e.g., `DummyJSON`).
2. Confirm the following variables are set:

| Variable    | Value                       |
|-------------|-----------------------------|
| `base_url`  | `https://dummyjson.com`     |
| `token`     | *(auto-populated on login)* |

3. Select the environment from the dropdown before running any requests.

> **Note:** The collection includes a pre-request script that sets `base_url` to `https://dummyjson.com` automatically if the variable is missing from the active environment.

---

## What's Covered

### Auth — 8 requests · 35 tests
Login and token-based authentication flows against `POST /auth/login` and `GET /auth/me`.

- Valid login — saves `accessToken` to `{{token}}` environment variable
- Wrong password, non-existent user, missing username, missing password
- `GET /auth/me` with valid token, invalid token, no token

### Products — 7 requests · 41 tests
Full CRUD operations against the `/products` endpoint.

- GET all products (with pagination field validation)
- GET single product by ID, GET non-existent ID
- POST create, PUT full update, PATCH partial update, DELETE

### Search & Filtering — 7 requests · 37 tests
Product search by query string, category filtering, and offset-based pagination.

- Search with results, no results, and empty query string
- GET all categories, GET products by category (result membership validated)
- Page 1 and page 2 with limit/skip (cross-page ID overlap check)

### Error Handling — 7 requests · 29 tests
Invalid inputs, non-existent resources, and malformed requests.

- Invalid product ID (0), negative ID (-1), string ID (abc)
- POST with empty body, POST with invalid JSON
- GET non-existent user, DELETE non-existent product

**Total: 29 requests · 142 tests**

---

## Running the Tests

### Prerequisites

Install [Newman](https://learning.postman.com/docs/collections/using-newman-cli/installing-running-newman/) and the HTML reporter globally:

```bash
npm install -g newman newman-reporter-htmlextra
```

### Run the collection

```bash
./run-tests.sh
```

This runs all 29 requests against `https://dummyjson.com`, prints results to the terminal, and generates an HTML report.

### View the report

Open the report in your browser after the run:

```bash
open docs/screenshots/report.html        # macOS
xdg-open docs/screenshots/report.html   # Linux
start docs/screenshots/report.html      # Windows
```

The report is saved to `docs/screenshots/report.html` and **overwritten on every run**.

---

## Docs

See [`/docs/API_DECISIONS.md`](./docs/API_DECISIONS.md) for notes on testing decisions and observations made during this assessment.
