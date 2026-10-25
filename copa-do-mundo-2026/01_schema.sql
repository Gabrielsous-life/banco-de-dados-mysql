CREATE DATABASE copa_mundo_2026;
USE copa_mundo_2026;

-- =========================================
-- TABELA: Grupo
-- =========================================
CREATE TABLE Grupo (
    id_grupo INT AUTO_INCREMENT PRIMARY KEY,
    nome_grupo VARCHAR(1) NOT NULL
);

-- =========================================
-- TABELA: Selecao
-- =========================================
CREATE TABLE Selecao (
    id_selecao INT AUTO_INCREMENT PRIMARY KEY,
    nome_selecao VARCHAR(50) NOT NULL,
    sigla_selecao CHAR(3) NOT NULL,
    bandeira_pais_selecao BLOB,
    id_grupo INT,

    CONSTRAINT fk_selecao_grupo
        FOREIGN KEY (id_grupo)
        REFERENCES Grupo(id_grupo)
);

-- =========================================
-- TABELA: Jogador
-- =========================================
CREATE TABLE Jogador (
    id_jogador INT AUTO_INCREMENT PRIMARY KEY,
    nome_jogador VARCHAR(100) NOT NULL,
    posicao_jogador VARCHAR(20) NOT NULL,
    numero_camisa_jogador INT NOT NULL,
    data_nascimento_jogador DATE NOT NULL,
    foto_jogador VARCHAR(255),
    id_selecao INT,

    CONSTRAINT fk_jogador_selecao
        FOREIGN KEY (id_selecao)
        REFERENCES Selecao(id_selecao)
);

-- =========================================
-- TABELA: Estadio
-- =========================================
CREATE TABLE Estadio (
    id_estadio INT AUTO_INCREMENT PRIMARY KEY,
    nome_estadio VARCHAR(100) NOT NULL,
    cidade_estadio VARCHAR(50) NOT NULL,
    pais_sede_estadio VARCHAR(50) NOT NULL,
    capacidade_estadio INT NOT NULL
);

-- =========================================
-- TABELA: Partidas
-- =========================================
CREATE TABLE Partidas (
    id_partida INT AUTO_INCREMENT PRIMARY KEY,
    data_hora_partida DATETIME NOT NULL,
    fase_partida VARCHAR(30) NOT NULL,
    gols_A_partida INT,
    gols_B_partida INT,

    id_estadio INT,
    id_selecao_A INT,
    id_selecao_B INT,

    CONSTRAINT fk_partida_estadio
        FOREIGN KEY (id_estadio)
        REFERENCES Estadio(id_estadio),

    CONSTRAINT fk_partida_selecao_A
        FOREIGN KEY (id_selecao_A)
        REFERENCES Selecao(id_selecao),

    CONSTRAINT fk_partida_selecao_B
        FOREIGN KEY (id_selecao_B)
        REFERENCES Selecao(id_selecao)
);

-- =========================================
-- TABELA ASSOCIATIVA:
-- Estatisticas_Partida_Jogador
-- =========================================
CREATE TABLE Estatisticas_Partida_Jogador (
    id_jogador INT,
    id_partida INT,

    e_capitao_jogador BOOLEAN,
    minutos_jogados_jogador INT,
    gols_marcado_jogador INT,
    cartao_amarelo_jogador INT,
    cartao_vermelho_jogador BOOLEAN,

    PRIMARY KEY (id_jogador, id_partida),

    CONSTRAINT fk_estatistica_jogador
        FOREIGN KEY (id_jogador)
        REFERENCES Jogador(id_jogador),

    CONSTRAINT fk_estatistica_partida
        FOREIGN KEY (id_partida)
        REFERENCES Partidas(id_partida)
);