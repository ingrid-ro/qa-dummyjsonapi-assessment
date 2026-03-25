# API Testing Decisions

## GET /auth/me — Invalid token returns 500 instead of 401

**Endpoint:** `GET /auth/me`
**Request:** `Authorization: Bearer <malformed token>`
**Expected:** `401 Unauthorized`
**Actual:** `500 Internal Server Error`

DummyJSON does not validate the token format before attempting to process it — a malformed JWT causes the server to throw an unhandled error rather than returning a proper auth rejection. The correct behaviour per HTTP semantics is 401 with an informative error message.

The test for this case (`GET /auth/me — invalid token`) has been updated to assert 500 with an inline comment marking it as an API bug, not a test issue.
