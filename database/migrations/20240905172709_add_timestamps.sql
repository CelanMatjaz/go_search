-- +goose Up
-- +goose StatementBegin
ALTER TABLE users
ADD COLUMN created_at TIMESTAMP NOT NULL DEFAULT NOW(),
ADD COLUMN updated_at TIMESTAMP NOT NULL DEFAULT NOW();

ALTER TABLE resumes
ADD COLUMN created_at TIMESTAMP NOT NULL DEFAULT NOW(),
ADD COLUMN updated_at TIMESTAMP NOT NULL DEFAULT NOW();

ALTER TABLE job_listings
ADD COLUMN created_at TIMESTAMP NOT NULL DEFAULT NOW(),
ADD COLUMN updated_at TIMESTAMP NOT NULL DEFAULT NOW();
-- +goose StatementEnd

-- +goose Down
-- +goose StatementBegin
-- +goose StatementEnd
