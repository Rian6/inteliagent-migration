INSERT INTO sync_tables
(ID, TABELA, ROTINA)
VALUES(1, 'AMOSTRA', 'SELECT ''(ID, NUMERO_INICIO, NUMERO_FINAL, QUANTIDADE, SITUACAO, ID_VISITA)''
UNION
SELECT CONCAT(''(\\'''',ID,''\\'','', NUMERO_INICIO,'','', NUMERO_FINAL,'','', QUANTIDADE,'','', SITUACAO,'','', ''\\'''',ID_VISITA,''\\'')'') from AMOSTRA
where updated_at >= :DATA_ULTIMO_SINCRONISMO and updated_at < :DATA_ATUAL');
INSERT INTO sync_tables
(ID, TABELA, ROTINA)
VALUES(2, 'IMAGEM_AMOSTRA', 'SELECT ''(ID, NOME, IMAGEM, SITUACAO, ID_AMOSTRA)''
UNION
SELECT CONCAT(''(\\'''',ID,''\\'','', coalesce(NOME,''''),'','', coalesce(TO_BASE64(IMAGEM), ''''),'','', SITUACAO,'','', ''\\'''',ID_AMOSTRA,''\\'')'') from IMAGEM_AMOSTRA');
INSERT INTO sync_tables
(ID, TABELA, ROTINA)
VALUES(3, 'INSPECAO', 'SELECT ''(ID, TIPO, NUMERO_DEPOSITOS, SITUACAO, ID_VISITA)''
UNION
SELECT CONCAT(''(\\'''',ID,''\\'','', ''\\'''',TIPO,''\\'','', NUMERO_DEPOSITOS,'','', SITUACAO,'','', ''\\'''',ID_VISITA,''\\'')'') from INSPECAO
where updated_at >= :DATA_ULTIMO_SINCRONISMO and updated_at < :DATA_ATUAL  ');
INSERT INTO sync_tables
(ID, TABELA, ROTINA)
VALUES(4, 'PLANEJAMENTO', 'SELECT ''(ID, ID_CIDADE, ID_CATEGORIA, ATIVIDADE, TIPO, DATA_ULT_VISITA, ANO, ZONA, STATUS, SITUACAO, NOME)''
UNION
SELECT CONCAT(''(\\'''',ID,''\\'','', ID_CIDADE,'','', ID_CATEGORIA,'',\\'''', ATIVIDADE,''\\'',\\'''', TIPO,''\\'',\\'''', DATA_ULT_VISITA,''\\'',\\'''', ANO,''\\'',\\'''', ZONA,''\\'',\\'''', STATUS,''\\'','', SITUACAO,'',\\'''', NOME,''\\'')'') from PLANEJAMENTO
where updated_at >= :DATA_ULTIMO_SINCRONISMO and updated_at < :DATA_ATUAL  ');
INSERT INTO sync_tables
(ID, TABELA, ROTINA)
VALUES(5, 'TRATAMENTO', 'SELECT ''(ID, DEPOSITOS_ELIMINADOS, IMOVEIS_TRATADOS, QTD_TRATAMENTO, TIPO, QTD_CARGA, SITUACAO, ID_VISITA)''
UNION
SELECT CONCAT(''(\\'''',ID,''\\'','', coalesce(DEPOSITOS_ELIMINADOS,0),'','', coalesce(IMOVEIS_TRATADOS,0),'','', coalesce(QTD_TRATAMENTO,0),'','', ''\\'''',coalesce(TIPO,0),''\\'','', coalesce(QTD_CARGA,0),'','', SITUACAO,'',\\'''', ID_VISITA,''\\'')'') from TRATAMENTO
where updated_at >= :DATA_ULTIMO_SINCRONISMO and updated_at < :DATA_ATUAL
');
INSERT INTO sync_tables
(ID, TABELA, ROTINA)
VALUES(6, 'VISITA', 'SELECT ''(ID, PRIMEIRA_VISITA, SEGUNDA_VISITA, TIPO_VISITA, NUMERO_QUARTOS, CONTEM_AMOSTRA, CONTEM_TRATAMENTO, SITUACAO_REFERENCIA, SITUACAO, ID_ENDERECO, ID_PLANEJAMENTO)''
UNION
SELECT CONCAT(''(\\'''',ID,''\\'','', ''\\'''',PRIMEIRA_VISITA,''\\'','', ''\\'''',SEGUNDA_VISITA,''\\'','', ''\\'''',TIPO_VISITA,''\\'','', coalesce(NUMERO_QUARTOS,0),'','', ''\\'''',coalesce(CONTEM_AMOSTRA,''''),''\\'','', ''\\'''',coalesce(CONTEM_TRATAMENTO,''''),''\\'',\\'''', coalesce(SITUACAO_REFERENCIA,''''),''\\'','', coalesce(SITUACAO,0),'','', coalesce(ID_ENDERECO,0),'',\\'''', coalesce(ID_PLANEJAMENTO,''''),''\\'''','')'') from VISITA
where updated_at >= :DATA_ULTIMO_SINCRONISMO and updated_at < :DATA_ATUAL
');