CREATE TABLE chat_push_devices (
 id CHAR(36) PRIMARY KEY,
 user_id INT NOT NULL,
 id_cede INT NOT NULL,
 token_version INT NOT NULL,
 kind VARCHAR(8) NOT NULL,
 token_hash CHAR(64) NOT NULL UNIQUE,
 subscription TEXT NOT NULL,
 active BOOLEAN NOT NULL DEFAULT TRUE,
 updated_at TIMESTAMP(6) NOT NULL DEFAULT CURRENT_TIMESTAMP(6) ON UPDATE CURRENT_TIMESTAMP(6),
 FOREIGN KEY (user_id) REFERENCES usuario(id),
 INDEX idx_push_user (user_id, active)
);
CREATE TABLE chat_push_outbox (
 message_id BIGINT NOT NULL,
 device_id CHAR(36) NOT NULL,
 state VARCHAR(16) NOT NULL DEFAULT 'PENDING',
 attempts INT NOT NULL DEFAULT 0,
 next_attempt_at TIMESTAMP(6) NOT NULL DEFAULT CURRENT_TIMESTAMP(6),
 lease_until TIMESTAMP(6) NULL,
 receipt_id VARCHAR(128) NULL,
 created_at TIMESTAMP(6) NOT NULL DEFAULT CURRENT_TIMESTAMP(6),
 PRIMARY KEY (message_id,device_id),
 INDEX idx_push_due (state,next_attempt_at),
 FOREIGN KEY (message_id) REFERENCES messages(id),
 FOREIGN KEY (device_id) REFERENCES chat_push_devices(id) ON DELETE CASCADE
);
