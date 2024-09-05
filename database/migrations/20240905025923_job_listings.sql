-- +goose Up
-- +goose StatementBegin
CREATE TABLE IF NOT EXISTS job_listing (
    id SERIAL PRIMARY KEY,
    url VARCHAR(512) NOT NULL,
    company VARCHAR(64) NOT NULL
);
-- +goose StatementEnd

-- +goose Down
-- +goose StatementBegin
DROP TABLE IF EXISTS job_listing;
-- +goose StatementEnd
