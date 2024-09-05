-- +goose Up
-- +goose StatementBegin
CREATE TABLE IF NOT EXISTS resume_tags (
    id SERIAL PRIMARY KEY,
    label VARCHAR(64)
);
-- +goose StatementEnd

-- +goose Down
-- +goose StatementBegin
DROP TABLE IF EXISTS resume_tags;
-- +goose StatementEnd
