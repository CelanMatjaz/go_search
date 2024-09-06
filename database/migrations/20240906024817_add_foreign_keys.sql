-- +goose Up
-- +goose StatementBegin
ALTER TABLE resumes
ADD COLUMN user_id INT,
ADD CONSTRAINT user_has_resumes FOREIGN KEY (user_id) REFERENCES users(id) ON DELETE CASCADE;

ALTER TABLE resume_tags
ADD COLUMN resume_id INT,
ADD CONSTRAINT resume_has_tags FOREIGN KEY (resume_id) REFERENCES resumes(id) ON DELETE CASCADE;
-- +goose StatementEnd

-- +goose Down
-- +goose StatementBegin

-- +goose StatementEnd
