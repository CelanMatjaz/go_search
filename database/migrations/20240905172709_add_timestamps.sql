-- +goose Up
-- +goose StatementBegin
ALTER TABLE users
ADD COLUMN created_at TIMESTAMP NOT NULL DEFAULT (now() at time zone 'utc'),
ADD COLUMN updated_at TIMESTAMP NOT NULL DEFAULT (now() at time zone 'utc');

ALTER TABLE resumes
ADD COLUMN created_at TIMESTAMP NOT NULL DEFAULT (now() at time zone 'utc'),
ADD COLUMN updated_at TIMESTAMP NOT NULL DEFAULT (now() at time zone 'utc');

ALTER TABLE job_listings
ADD COLUMN created_at TIMESTAMP NOT NULL DEFAULT (now() at time zone 'utc'),
ADD COLUMN updated_at TIMESTAMP NOT NULL DEFAULT (now() at time zone 'utc');
-- +goose StatementEnd

-- +goose Down
-- +goose StatementBegin
-- +goose StatementEnd
