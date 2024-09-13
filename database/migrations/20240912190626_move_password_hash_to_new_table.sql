-- +goose Up
-- +goose StatementBegin
CREATE TABLE password_hashes (
    user_id INT UNIQUE NOT NULL,
    password_hash CHARACTER(60) NOT NULL,

    CONSTRAINT password_hash_has_user 
    FOREIGN KEY (user_id) REFERENCES users(id) ON DELETE CASCADE
);

ALTER TABLE users
DROP COLUMN IF EXISTS password_hash;
-- +goose StatementEnd

-- +goose Down
-- +goose StatementBegin
-- +goose StatementEnd
