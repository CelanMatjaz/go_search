-- +goose Up
-- +goose StatementBegin
CREATE TABLE IF NOT EXISTS resumes (
    id SERIAL PRIMARY KEY,
    name VARCHAR(64) NOT NULL,
    note BPCHAR NOT NULL DEFAULT ''
);
-- +goose StatementEnd

-- +goose Down
-- +goose StatementBegin
DROP TABLE IF EXISTS resumes;
-- +goose StatementEnd
