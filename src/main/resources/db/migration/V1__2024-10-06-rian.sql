CREATE TABLE usuario (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(255) NOT NULL,
    email VARCHAR(255) NOT NULL UNIQUE,
    senha VARCHAR(255) NOT NULL,
    id_cede INT NOT NULL,
    situacao_aprovacao TINYINT NOT NULL DEFAULT 0, -- 0: pendente, 1: aprovado, 2: reprovado
    codigo_email VARCHAR(255) NOT NULL,
    situacao TINYINT NOT NULL DEFAULT 1,           -- 1: ativo, 0: inativo
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);
