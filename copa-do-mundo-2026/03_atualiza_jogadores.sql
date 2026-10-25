USE copa_mundo_2026;

-- =========================================
-- Atualiza os dados dos jogadores já cadastrados,
-- buscando pelo nome (requer 02_adiciona_altura_peso.sql)
-- =========================================
UPDATE Jogador
JOIN (
    SELECT 'Alisson Becker' AS nome, 'Goleiro' AS posicao, 1 AS camisa, '1992-10-02' AS nascimento, 'img/jogadores/alisson.jpg' AS foto, 1.93 AS altura, 91.0 AS peso, 9 AS selecao
    UNION ALL SELECT 'Weverton', 'Goleiro', 23, '1987-12-13', 'img/jogadores/weverton.jpg', 1.88, 84.0, 9
    UNION ALL SELECT 'Marquinhos', 'Zagueiro', 4, '1994-05-14', 'img/jogadores/marquinhos.jpg', 1.83, 75.0, 9
    UNION ALL SELECT 'Casemiro', 'Volante', 5, '1992-02-23', 'img/jogadores/casemiro.jpg', 1.85, 84.0, 9
    UNION ALL SELECT 'Bruno Guimarães', 'Volante', 8, '1997-11-16', 'img/jogadores/bruno.jpg', 1.82, 74.0, 9
    UNION ALL SELECT 'Lucas Paquetá', 'Meia', 17, '1997-08-27', 'img/jogadores/paqueta.jpg', 1.80, 72.0, 9
    UNION ALL SELECT 'Neymar Jr', 'Meia', 10, '1992-02-05', 'img/jogadores/neymar.jpg', 1.75, 68.0, 9
    UNION ALL SELECT 'Vinícius Júnior', 'Atacante', 7, '2000-07-12', 'img/jogadores/vinijr.jpg', 1.76, 73.0, 9
    UNION ALL SELECT 'Raphinha', 'Atacante', 11, '1996-12-14', 'img/jogadores/raphinha.jpg', 1.76, 68.0, 9
    UNION ALL SELECT 'Matheus Cunha', 'Atacante', 9, '1999-05-27', 'img/jogadores/cunha.jpg', 1.84, 78.0, 9
    UNION ALL SELECT 'Gabriel Martinelli', 'Atacante', 22, '2001-06-18', 'img/jogadores/martinelli.jpg', 1.78, 73.0, 9

    UNION ALL SELECT 'Yassine Bounou', 'Goleiro', 1, '1991-04-05', NULL, 1.92, 80.0, 10
    UNION ALL SELECT 'Achraf Hakimi', 'Lateral', 2, '1998-11-04', 'img/jogadores/hakimi.jpg', 1.81, 73.0, 10
    UNION ALL SELECT 'Ismael Saibari', 'Meia', 8, '2001-01-28', NULL, 1.85, 76.0, 10
    UNION ALL SELECT 'Soufiane Rahimi', 'Atacante', 19, '1996-06-02', NULL, 1.78, 72.0, 10

    UNION ALL SELECT 'Wilson Isidor', 'Atacante', 9, '2000-08-27', NULL, 1.85, 78.0, 12

    UNION ALL SELECT 'Kaishu Sano', 'Volante', 6, '2001-06-30', NULL, 1.78, 72.0, 22

    UNION ALL SELECT 'Erling Haaland', 'Atacante', 9, '2000-07-21', 'img/jogadores/haaland.jpg', 1.95, 88.0, 35

    UNION ALL SELECT 'Ferran Torres', 'Atacante', 9, '2000-02-29', 'img/jogadores/ferran.jpg', 1.84, 77.0, 29
    UNION ALL SELECT 'Nico Williams', 'Atacante', 17, '2002-07-12', 'img/jogadores/nico.jpg', 1.81, 73.0, 29
    UNION ALL SELECT 'Pedro Porro', 'Lateral', 2, '1999-09-13', NULL, 1.72, 70.0, 29

    UNION ALL SELECT 'Emiliano Martínez', 'Goleiro', 23, '1992-09-02', 'img/jogadores/dibu.jpg', 1.95, 88.0, 37
    UNION ALL SELECT 'Enzo Fernández', 'Meia', 24, '2001-01-17', NULL, 1.78, 76.0, 37
) AS novos
ON Jogador.nome_jogador = novos.nome

SET
    Jogador.posicao_jogador = novos.posicao,
    Jogador.numero_camisa_jogador = novos.camisa,
    Jogador.data_nascimento_jogador = novos.nascimento,
    Jogador.foto_jogador = novos.foto,
    Jogador.altura_jogador = novos.altura,
    Jogador.peso_jogador = novos.peso,
    Jogador.id_selecao = novos.selecao;