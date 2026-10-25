# Banco de Dados com MySQL

Modelagens e scripts SQL desenvolvidos nos meus estudos de banco de dados, usando **MySQL** e **MySQL Workbench**.

| Projeto | Conteúdo |
|---|---|
| [Copa do Mundo 2026](#copa-do-mundo-2026) | Modelo no Workbench, script de criação do banco e script de atualização de dados |
| [Rede Social](#rede-social) | Modelagem lógica no Workbench |

Os arquivos `.mwb` abrem no MySQL Workbench. Os diagramas abaixo são uma representação desses modelos.

---

## Copa do Mundo 2026

Banco para gerenciar a Copa: grupos, seleções, jogadores, estádios, partidas e as estatísticas de cada jogador por partida.

| Arquivo | Descrição |
|---|---|
| [schema.sql](copa-do-mundo-2026/schema.sql) | Cria o banco `copa_mundo_2026` com todas as tabelas, chaves primárias e estrangeiras |
| [atualiza_jogadores.sql](copa-do-mundo-2026/atualiza_jogadores.sql) | Atualiza os dados de vários jogadores em um único `UPDATE` com `JOIN` em uma tabela derivada (`UNION ALL`). Escrito para uma versão posterior do banco, que tem altura e peso dos jogadores |
| [modelo.mwb](copa-do-mundo-2026/modelo.mwb) | Modelo no MySQL Workbench |

```mermaid
erDiagram
    Grupo ||--o{ Selecao : contem
    Selecao ||--o{ Jogador : convoca
    Estadio ||--o{ Partidas : sedia
    Selecao ||--o{ Partidas : "joga como A"
    Selecao ||--o{ Partidas : "joga como B"
    Jogador ||--o{ Estatisticas_Partida_Jogador : registra
    Partidas ||--o{ Estatisticas_Partida_Jogador : gera

    Grupo {
        int id_grupo PK
        varchar nome_grupo
    }
    Selecao {
        int id_selecao PK
        varchar nome_selecao
        char sigla_selecao
        blob bandeira_pais_selecao
        int id_grupo FK
    }
    Jogador {
        int id_jogador PK
        varchar nome_jogador
        varchar posicao_jogador
        int numero_camisa_jogador
        date data_nascimento_jogador
        varchar foto_jogador
        int id_selecao FK
    }
    Estadio {
        int id_estadio PK
        varchar nome_estadio
        varchar cidade_estadio
        varchar pais_sede_estadio
        int capacidade_estadio
    }
    Partidas {
        int id_partida PK
        datetime data_hora_partida
        varchar fase_partida
        int gols_A_partida
        int gols_B_partida
        int id_estadio FK
        int id_selecao_A FK
        int id_selecao_B FK
    }
    Estatisticas_Partida_Jogador {
        int id_jogador PK, FK
        int id_partida PK, FK
        boolean e_capitao_jogador
        int minutos_jogados_jogador
        int gols_marcado_jogador
        int cartao_amarelo_jogador
        boolean cartao_vermelho_jogador
    }
```

Destaques da modelagem:

- `Partidas` se relaciona duas vezes com `Selecao` (time A e time B).
- `Estatisticas_Partida_Jogador` é uma tabela associativa (N:N entre jogadores e partidas) com chave primária composta.

---

## Rede Social

Modelagem lógica de uma rede social com usuários, postagens, comentários, curtidas, seguidores e chats.

| Arquivo | Descrição |
|---|---|
| [modelo.mwb](rede-social/modelo.mwb) | Modelo no MySQL Workbench |

```mermaid
erDiagram
    usuarios ||--o{ postagens : publica
    usuarios ||--o{ comentarios : escreve
    postagens ||--o{ comentarios : recebe
    usuarios ||--o{ curtidas : da
    postagens ||--o{ curtidas : recebe
    usuarios ||--o{ seguidas : segue
    usuarios ||--o{ seguidas : "e seguido"
    chats ||--o{ participantes_chat : tem
    usuarios ||--o{ participantes_chat : participa
    chats ||--o{ mensagem : contem
    usuarios ||--o{ mensagem : envia

    usuarios {
        int id_usuario PK
        varchar nome_usuario
        varchar email_usuario
        varchar senha_hash_usuario
        date data_nasc_usuario
        timestamp data_criacao_usuario
        enum tipo_conta_usuario
        text bio_usuario
        blob foto_usuario
    }
    postagens {
        int id_postagem PK
        text legenda_postagem
        varchar midia_postagem
        timestamp data_hora_postagem
        int id_usuario FK
    }
    comentarios {
        int id_comentario PK
        text texto_comentario
        timestamp data_hora_comentario
        blob imagem_comentario
        int id_usuario FK
        int id_postagem FK
    }
    curtidas {
        int id_curtidas PK
        timestamp data_hora
        int id_usuario FK
        int postagens_id_postagem FK
    }
    seguidas {
        int id_usuario_seguidor PK, FK
        int id_usuario_seguido PK, FK
    }
    chats {
        int id_chat PK
        enum tipos_chat
        timestamp data_hora_criacao
        varchar nome_chat
    }
    participantes_chat {
        int id_chat PK, FK
        int id_usuario_participante PK, FK
    }
    mensagem {
        int id_mensagem PK
        text texto_mensagem
        timestamp data_hora_mensagem
        int id_usuario FK
        int id_chat FK
    }
```

Destaques da modelagem:

- `seguidas` é um autorrelacionamento N:N de `usuarios` (seguidor e seguido).
- A senha é armazenada como hash (`senha_hash_usuario`), nunca em texto puro.
- Chats podem ser diretos ou em grupo (`tipos_chat`), com participantes em tabela associativa.
- Contas podem ser públicas ou privadas (`tipo_conta_usuario`).

## Licença

[MIT](LICENSE)
