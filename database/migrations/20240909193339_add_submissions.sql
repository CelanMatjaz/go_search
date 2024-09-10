-- +goose Up
-- +goose StatementBegin
CREATE TABLE IF NOT EXISTS job_applications (
    id SERIAL PRIMARY KEY,
    user_id INT NOT NULL,
    label VARCHAR(64) NOT NULL,
    text BPCHAR NOT NULL DEFAULT '',
    created_at TIMESTAMP NOT NULL DEFAULT (now() at time zone 'utc'),
    updated_at TIMESTAMP NOT NULL DEFAULT (now() at time zone 'utc'),

    CONSTRAINT job_application_has_user
    FOREIGN KEY (user_id) REFERENCES users(id)
);

CREATE TABLE IF NOT EXISTS job_application_text (
    id SERIAL PRIMARY KEY,
    user_id INT NOT NULL,
    label VARCHAR(64) NOT NULL,
    created_at TIMESTAMP NOT NULL DEFAULT (now() at time zone 'utc'),
    updated_at TIMESTAMP NOT NULL DEFAULT (now() at time zone 'utc'),

    CONSTRAINT job_application_text_has_user
    FOREIGN KEY (user_id) REFERENCES users(id)
);

CREATE TABLE IF NOT EXISTS job_application_sections (
    id SERIAL PRIMARY KEY,
    user_id INT NOT NULL,
    label VARCHAR(64) NOT NULL,
    text BPCHAR NOT NULL DEFAULT '',
    created_at TIMESTAMP NOT NULL DEFAULT (now() at time zone 'utc'),
    updated_at TIMESTAMP NOT NULL DEFAULT (now() at time zone 'utc'),

    CONSTRAINT job_application_text_has_user
    FOREIGN KEY (user_id) REFERENCES users(id)
);

CREATE TABLE IF NOT EXISTS mtm_application_text_sections(
    user_id INT NOT NULL,
    sub_text_id INT NOT NULL,
    sub_sect_id INT NOT NULL,

    CONSTRAINT mtm_application_text_sections_has_user
    FOREIGN KEY (user_id) REFERENCES users(id),

    CONSTRAINT mtm_application_text_sections_has_text
    FOREIGN KEY (sub_text_id) REFERENCES job_application_text(id),

    CONSTRAINT mtm_application_text_sections_has_sects
    FOREIGN KEY (sub_sect_id) REFERENCES job_application_sections(id)
);
-- +goose StatementEnd

-- +goose Down
-- +goose StatementBegin
DROP TABLE IF EXISTS mtm_application_text_sections;
DROP TABLE IF EXISTS job_application_sections;
DROP TABLE IF EXISTS job_application_text;
DROP TABLE IF EXISTS job_applications;
-- +goose StatementEnd
