CREATE TABLE SYNC_TABLES (
    ID INTEGER PRIMARY KEY,
    TABELA VARCHAR(255),
    ROTINA VARCHAR(255)
);

CREATE TABLE SYNC_CONFIRM (
    ID INTEGER PRIMARY KEY,
    ID_SYNC_TABLES VARCHAR(255),
    ULTIMO_SINCRONISMO TIMESTAMP(6)
);