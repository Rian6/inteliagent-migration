ALTER TABLE usuario ADD COLUMN role VARCHAR(16) NOT NULL DEFAULT 'AGENT';
ALTER TABLE planejamento ADD COLUMN id_cede INT NULL;
-- Legacy plans need an explicit sede assignment by an administrator; NULL is inaccessible.
CREATE INDEX idx_planejamento_cede_updated ON planejamento (id_cede, updated_at);
CREATE INDEX idx_visita_planejamento_updated ON visita (id_planejamento, updated_at);
CREATE INDEX idx_inspecao_visita ON inspecao (id_visita);
CREATE INDEX idx_amostra_visita ON amostra (id_visita);
CREATE INDEX idx_tratamento_visita ON tratamento (id_visita);
CREATE INDEX idx_email_code_expiry ON email_liberacao (email, codigo, created_at);
CREATE TABLE IF NOT EXISTS messages (
    id BIGINT AUTO_INCREMENT PRIMARY KEY,
    sender INT NOT NULL,
    recipient INT NOT NULL,
    text VARCHAR(4000) NOT NULL,
    timestamp DATETIME(6) NOT NULL DEFAULT CURRENT_TIMESTAMP(6),
    INDEX idx_messages_sender_id (sender, id),
    INDEX idx_messages_recipient_id (recipient, id),
    FOREIGN KEY (sender) REFERENCES usuario(id),
    FOREIGN KEY (recipient) REFERENCES usuario(id)
);
