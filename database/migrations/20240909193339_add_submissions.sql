-- +goose Up
-- +goose StatementBegin
CREATE TABLE IF NOT EXISTS job_submission (
    id SERIAL PRIMARY KEY,
    label VARCHAR(64) NOT NULL,
    created_at TIMESTAMP NOT NULL DEFAULT (now() at time zone 'utc'),
    updated_at TIMESTAMP NOT NULL DEFAULT (now() at time zone 'utc')
);

CREATE TABLE IF NOT EXISTS submission_text (
    id SERIAL PRIMARY KEY,
    label VARCHAR(64) NOT NULL,
    created_at TIMESTAMP NOT NULL DEFAULT (now() at time zone 'utc'),
    updated_at TIMESTAMP NOT NULL DEFAULT (now() at time zone 'utc')
);

CREATE TABLE IF NOT EXISTS submission_sections (
    id SERIAL PRIMARY KEY,
    label VARCHAR(64) NOT NULL,
    text BPCHAR NOT NULL DEFAULT '',
    created_at TIMESTAMP NOT NULL DEFAULT (now() at time zone 'utc'),
    updated_at TIMESTAMP NOT NULL DEFAULT (now() at time zone 'utc')
);

CREATE TABLE IF NOT EXISTS mtm_submission_text_sections(
    sub_text_id INT NOT NULL,
    sub_sect_id INT NOT NULL,

    CONSTRAINT mtm_submission_text_sections_has_text
    FOREIGN KEY (sub_text_id) REFERENCES submission_text(id),

    CONSTRAINT mtm_submission_text_sections_has_sects
    FOREIGN KEY (sub_sect_id) REFERENCES submission_sections(id)
);
-- +goose StatementEnd

-- +goose Down
-- +goose StatementBegin
DROP TABLE IF EXISTS mtm_submission_text_sections;
DROP TABLE IF EXISTS submission_text;
DROP TABLE IF EXISTS submission_sections;
-- +goose StatementEnd
