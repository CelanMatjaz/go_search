-- +goose Up
-- +goose StatementBegin
CREATE TABLE IF NOT EXISTS oauth_clients (
    id SERIAL PRIMARY KEY,
    name BPCHAR NOT NULL,
    client_id BPCHAR NOT NULL UNIQUE,
    client_secret BPCHAR NOT NULL UNIQUE,
    scopes BPCHAR NOT NULL,
    code_endpoint BPCHAR NOT NULL,
    token_endpoint BPCHAR NOT NULL,
    user_data_endpoint BPCHAR NOT NULL
);

CREATE TABLE IF NOT EXISTS account_oauth_data (
    id SERIAL PRIMARY KEY,
    user_id INT,
    oauth_client_id INT,
    access_token VARCHAR(2048) NOT NULL,
    refresh_token VARCHAR(512) NOT NULL,

    CONSTRAINT account_oauth_data_has_user
    FOREIGN KEY (user_id) REFERENCES users(id) ON DELETE CASCADE,

    CONSTRAINT account_oauth_data_has_oauth_client
    FOREIGN KEY (oauth_client_id) REFERENCES oauth_clients(id) ON DELETE CASCADE
);

CREATE INDEX IF NOT EXISTS oauth_client_name_index
ON oauth_clients(name);
-- +goose StatementEnd

-- +goose Down
-- +goose StatementBegin
DROP INDEX IF EXISTS oauth_client_index;
DROP TABLE IF EXISTS account_oauth_data;
DROP TABLE IF EXISTS oauth_clients;
-- +goose StatementEnd
