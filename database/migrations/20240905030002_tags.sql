-- +goose Up
-- +goose StatementBegin
CREATE TABLE IF NOT EXISTS tags (
    id SERIAL PRIMARY KEY,
    label VARCHAR(64)
);
-- +goose StatementEnd

-- +goose Down
-- +goose StatementBegin
DROP TABLE IF EXISTS tags;
-- +goose StatementEnd
