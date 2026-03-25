# API Testing Decisions

## GET /auth/me — Invalid token returns 500 instead of 401

**Endpoint:** `GET /auth/me`
**Request:** `Authorization: Bearer <malformed token>`
**Expected:** `401 Unauthorized`
**Actual:** `500 Internal Server Error`

DummyJSON does not validate the token format before attempting to process it — a malformed JWT causes the server to throw an unhandled error rather than returning a proper auth rejection. The correct behaviour per HTTP semantics is 401 with an informative error message.

The test for this case (`GET /auth/me — invalid token`) has been updated to assert 500 with an inline comment marking it as an API bug, not a test issue.

## POST /products/add — Empty body returns 201 instead of 400

**Endpoint:** `POST /products/add`
**Request:** Empty JSON body (`{}`)
**Expected:** `400 Bad Request`
**Actual:** `201 Created` with a product object containing only a generated `id`

DummyJSON performs no field validation on product creation. Any body — including an empty one — is accepted and a new product is created with only the fields that were provided. Required fields like `title` and `price` are silently omitted from the response rather than rejected.

The test for this case (`POST add product — empty body`) has been updated to assert 201 with an inline comment noting this is an API design issue, not a test issue.

---

## Screenshots

Test result screenshots are stored in [`/docs/screenshots/`](./screenshots/).

To capture: run each folder (or the full collection) via the Postman Collection Runner, then screenshot the results panel.
