CREATE TABLE cede (
    id INT AUTO_INCREMENT PRIMARY KEY,
    codigo INT NOT NULL,
    nome VARCHAR(255) NOT NULL,
    situacao TINYINT NOT NULL DEFAULT 1,           -- 1: ativo, 0: inativo
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);
