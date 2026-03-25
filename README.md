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

---

## What's Covered

### Auth
- Login with valid credentials
- Login with invalid credentials (error handling)
- Token persistence across requests

### Products CRUD
- GET all products
- GET single product by ID
- POST create a product
- PUT update a product
- DELETE a product

### Search
- Search products by query string
- Validate search results match query

### Error Handling
- 404 for non-existent resources
- 400 / 401 for bad or missing auth
- Response structure validation on errors

---

## Docs

See [`/docs/API_DECISIONS.md`](./docs/API_DECISIONS.md) for notes on testing decisions and observations made during this assessment.
