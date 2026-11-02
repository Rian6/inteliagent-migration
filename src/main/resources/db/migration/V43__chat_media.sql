CREATE TABLE chat_attachments (
 id CHAR(36) PRIMARY KEY,
 sender INT NOT NULL,
 recipient INT NOT NULL,
 id_cede INT NOT NULL,
 mime VARCHAR(64) NOT NULL,
 size_bytes INT NOT NULL,
 original_name VARCHAR(160) NOT NULL,
 duration_ms INT NULL,
 created_at TIMESTAMP(6) NOT NULL DEFAULT CURRENT_TIMESTAMP(6),
 INDEX idx_chat_attachment_owner (sender, recipient),
 FOREIGN KEY (sender) REFERENCES usuario(id),
 FOREIGN KEY (recipient) REFERENCES usuario(id)
);
ALTER TABLE messages ADD COLUMN attachment_id CHAR(36) NULL,
 ADD COLUMN client_id CHAR(36) NULL,
 ADD UNIQUE KEY unique_chat_client_message (sender, client_id),
 ADD CONSTRAINT fk_message_attachment FOREIGN KEY (attachment_id) REFERENCES chat_attachments(id);
