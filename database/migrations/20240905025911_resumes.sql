-- +goose Up
-- +goose StatementBegin
CREATE TABLE IF NOT EXISTS resumes (
    id SERIAL PRIMARY KEY,
    user_id INT,
    name VARCHAR(64) NOT NULL,
    note BPCHAR NOT NULL DEFAULT '',

    CONSTRAINT job_application_text_has_user
    FOREIGN KEY (user_id) REFERENCES users(id)
);
-- +goose StatementEnd

-- +goose Down
-- +goose StatementBegin
DROP TABLE IF EXISTS resumes;
-- +goose StatementEnd
