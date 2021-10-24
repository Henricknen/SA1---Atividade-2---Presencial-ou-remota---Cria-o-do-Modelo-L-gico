DROP DATABASE IF EXISTS copa_mundo; /*apaga toda atabela com esse nome*/

CREATE DATABASE copa_mundo;

USE copa_mundo; 

CREATE TABLE jogos (
    idrodada INTEGER PRIMARY KEY,
    data DATETIME,
    estadio_idestadio INTEGER,
    pais_idpais_1 INTEGER,
    pais_idpais_2 INTEGER,
    gols_idpais_1 INTEGER,
    gols_idpais_2 INTEGER,
    publico INTEGER
);

CREATE TABLE pais (
    idpais INTEGER PRIMARY KEY,
    selecao VARCHAR(45),
    continente VARCHAR(45),
    tecnico VARCHAR(45),
    pontos INTEGER,
    vitorias INTEGER,
    empates INTEGER,
    derrotas INTEGER,
    golspro INTEGER,
    golscontra INTEGER,
    grupo_idgrupo CHAR(1)
);

CREATE TABLE estadio (
    idestadio INTEGER PRIMARY KEY,
    decricao VARCHAR(45),
    localizacao VARCHAR(45),
    capacidade INTEGER
);

CREATE TABLE jogador (
    idjogador INTEGER PRIMARY KEY,
    nome VARCHAR(45),
    camisa INTEGER,     /*numero da camisa */
    posicao VARCHAR(45),    /*goleiro, atacante, meia, sireita, zagueir */
    pais_idpais INTEGER,
    situacao CHAR(1)    /* T - titular ou R - reserva */
);

CREATE TABLE gols (
    jogo_idrodada INTEGER,
    jogador_idjoagador INTEGER,
    tempo VARCHAR(45)
);

CREATE TABLE substituicao (
    jogo_idrodada INTEGER,
    jogador_idjoagador_sai INTEGER,
    jogador_idjogador_entra INTEGER,
    tempo VARCHAR(45)
);

CREATE TABLE cartao (
    jogo_idrodada INTEGER,
    jogador_idjoagador INTEGER,
    amarelo TINYINT,    /* CARTAO AMARELO 0 - FALSO 1- VERDADEIRO */
    vermelho TINYINT,    /* CARTAO VERMELHO 0 - FALSO 1- VERDADEIRO */
    tempo VARCHAR(45)
);

CREATE TABLE grupo (
    idgrupo char(1) PRIMARY key,
    descricao VARCHAR(45)
);

ALTER TABLE pais ADD CONSTRANT FK_pais_2
    FOREIGN KEY (grupo_idgrupo)
    REFERENCES grupo(idgrupo);

ALTER TABLE jogos ADD CONSTRANT FK_jogos_2
    FOREIGN KEY(estadio_idestadio)
    REFERENCES estadio(idestadio);

ALTER TABLE jogos ADD CONSTRANT FK_jogos_3
    FOREIGN KEY(pais_idpais_1)
    REFERENCES pais(idpais);

ALTER TABLE jogos ADD CONSTRANT FK_jogos_4
    FOREIGN KEY(pais_idpais_2)
    REFERENCES pais(idpais);

ALTER TABLE jogador ADD CONSTRANT FK_jogador_2
    FOREIGN KEY(pais_idpais)
    REFERENCES pais(idpais);

ALTER TABLE gols ADD CONSTRANT FK_gols_1
    FOREIGN KEY(jogo_idrodada)
    REFERENCES jogos(idrodada);


ALTER TABLE gols ADD CONSTRANT FK_gols_2
    FOREIGN KEY(jogador_idjogador)
    REFERENCES jogador(idjoador);

ALTER TABLE sustituicao ADD CONSTRANT FK_substicao_1
    FOREIGN KEY (jogos_idrodada)
    REFERENCES jogos(id_jogador);

ALTER TABLE sustituicao ADD CONSTRANT KF_substicao_2
    FOREIGN KEY (jogador_idjogador_sai)
    REFERENCES jogador(id_jogador);

ALTER TABLE sustituicao ADD CONSTRANT FK_substicao_3
    FOREIGN KEY (jogador_idjogador_entra)
    REFERENCES jogador(id_jogador);

ALTER TABLE cartao ADD CONSTRANT FK_cartao_1
    FOREIGN key (jogos_idrodada)
    REFERENCES jogos(idrodada);

ALTER TABLE cartao ADD CONSTRANT FK_cartao_2
FOREIGN key (jogador_idjoagador)
REFERENCES jogador(idjogador)