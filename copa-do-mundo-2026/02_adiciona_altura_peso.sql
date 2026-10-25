USE copa_mundo_2026;

-- =========================================
-- Adiciona altura e peso na tabela Jogador
-- =========================================
ALTER TABLE Jogador
    ADD COLUMN altura_jogador DECIMAL(3,2),
    ADD COLUMN peso_jogador DECIMAL(5,2);
