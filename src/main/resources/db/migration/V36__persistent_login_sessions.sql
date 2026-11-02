CREATE TABLE auth_sessions (
    token_hash BINARY(32) PRIMARY KEY,
    user_id INT NOT NULL,
    id_cede INT NOT NULL,
    token_version INT NOT NULL,
    expires_at TIMESTAMP NOT NULL,
    created_at TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP,
    revoked_at TIMESTAMP NULL,
    INDEX idx_auth_sessions_user (user_id),
    INDEX idx_auth_sessions_expiry (expires_at)
);
