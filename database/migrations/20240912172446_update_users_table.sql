-- +goose Up
-- +goose StatementBegin
ALTER TABLE users
RENAME COLUMN first_name TO display_name;

ALTER TABLE users
DROP COLUMN last_name;

ALTER TABLE users
ADD COLUMN is_oauth BOOLEAN NOT NULL DEFAULT FALSE;
-- +goose StatementEnd

-- +goose Down
-- +goose StatementBegin
-- +goose StatementEnd
