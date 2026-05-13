DROP DATABASE IF EXISTS quiz;

CREATE DATABASE quiz;

USE quiz;

CREATE TABLE curso (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    sigla VARCHAR(10)
);

CREATE TABLE disciplina (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(255) NOT NULL,
    modulo int not null,
    sigla VARCHAR(20),
    id_curso INT,
    FOREIGN KEY (id_curso) REFERENCES curso(id) ON DELETE
    SET
        NULL ON UPDATE CASCADE
);

CREATE TABLE usuario (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL,
    senha VARCHAR(255) NOT NULL,
    pontuacao INT DEFAULT 0
);

CREATE TABLE questao (
    id INT AUTO_INCREMENT PRIMARY KEY,
    enunciado TEXT NOT NULL,
    pontuacao INT,
    id_disciplina INT,
    FOREIGN KEY (id_disciplina) REFERENCES disciplina(id) ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE alternativa (
    id INT AUTO_INCREMENT PRIMARY KEY,
    id_questao INT,
    perguntas VARCHAR(255) NOT NULL,
    correta TINYINT(1) DEFAULT 0,
    FOREIGN KEY (id_questao) REFERENCES questao(id) ON DELETE CASCADE ON UPDATE CASCADE
);

CREATE TABLE quiz (
    id INT AUTO_INCREMENT PRIMARY KEY,
    data DATE NOT NULL,
    id_usuario INT,
    id_disciplina INT,
    id_questao_01 INT,
    id_questao_02 INT,
    id_questao_03 INT,
    id_questao_04 INT,
    id_questao_05 INT,
    pontuacao INT DEFAULT 0,
    FOREIGN KEY (id_usuario) REFERENCES usuario(id) ON UPDATE CASCADE ON DELETE
    SET
        NULL,
        FOREIGN KEY (id_disciplina) REFERENCES disciplina(id) ON UPDATE CASCADE ON DELETE
    SET
        NULL,
        FOREIGN KEY (id_questao_01) REFERENCES questao(id) ON UPDATE CASCADE ON DELETE
    SET
        NULL,
        FOREIGN KEY (id_questao_02) REFERENCES questao(id) ON UPDATE CASCADE ON DELETE
    SET
        NULL,
        FOREIGN KEY (id_questao_03) REFERENCES questao(id) ON UPDATE CASCADE ON DELETE
    SET
        NULL,
        FOREIGN KEY (id_questao_04) REFERENCES questao(id) ON UPDATE CASCADE ON DELETE
    SET
        NULL,
        FOREIGN KEY (id_questao_05) REFERENCES questao(id) ON UPDATE CASCADE ON DELETE
    SET
        NULL
);

INSERT INTO
    curso (id, nome, sigla)
VALUES
    (1, 'Desenvolvimento de Sistemas', 'DS');

-- Inserção de Disciplinas --
INSERT INTO
    disciplina (id, nome, modulo, sigla, id_curso)
VALUES
    (1, 'Programação e Algoritmos', 1, 'PA', 1);

INSERT INTO
    disciplina (id, nome, modulo, sigla, id_curso)
VALUES
    (2, 'Banco de Dados I', 1, 'BD1', 1);

INSERT INTO
    disciplina (id, nome, modulo, sigla, id_curso)
VALUES
    (3, 'Análise e Projeto de Sistemas', 1, 'APS', 1);

INSERT INTO
    disciplina (id, nome, modulo, sigla, id_curso)
VALUES
    (4, 'Design Digital', 1, 'DD', 1);

INSERT INTO
    disciplina (id, nome, modulo, sigla, id_curso)
VALUES
    (5, 'Programação Web I', 1, 'PW1', 1);

INSERT INTO
    disciplina (id, nome, modulo, sigla, id_curso)
VALUES
    (6, 'Fundamentos da Informática', 1, 'FI', 1);

INSERT INTO
    disciplina (id, nome, modulo, sigla, id_curso)
VALUES
    (7, 'Técnicas de Programação', 1, 'TP', 1);

INSERT INTO
    disciplina (id, nome, modulo, sigla, id_curso)
VALUES
    (8, 'Desenvolvimento de Sistemas', 1, 'DS', 1);

INSERT INTO
    disciplina (id, nome, modulo, sigla, id_curso)
VALUES
    (9, 'Banco de Dados II', 2, 'BD2', 1);

INSERT INTO
    disciplina (id, nome, modulo, sigla, id_curso)
VALUES
    (10, 'Internet e Protocolos', 2, 'IP', 1);

INSERT INTO
    disciplina (id, nome, modulo, sigla, id_curso)
VALUES
    (
        11,
        'Programação de Aplicativos Mobile I',
        2,
        'PAM1',
        1
    );

INSERT INTO
    disciplina (id, nome, modulo, sigla, id_curso)
VALUES
    (12, 'Programação Web II', 2, 'PW2', 1);

INSERT INTO
    disciplina (id, nome, modulo, sigla, id_curso)
VALUES
    (
        13,
        'Segurança de Sistemas da Informação',
        3,
        'SSI',
        1
    );

INSERT INTO
    disciplina (id, nome, modulo, sigla, id_curso)
VALUES
    (14, 'Banco de Dados III', 3, 'BD3', 1);

INSERT INTO
    disciplina (id, nome, modulo, sigla, id_curso)
VALUES
    (15, 'Sistemas Embarcados', 2, 'SE', 1);

INSERT INTO
    disciplina (id, nome, modulo, sigla, id_curso)
VALUES
    (
        16,
        'Programação de Aplicativos Mobile II',
        3,
        'PAM2',
        1
    );

INSERT INTO
    disciplina (id, nome, modulo, sigla, id_curso)
VALUES
    (17, 'Programação Web III', 3, 'PW3', 1);

INSERT INTO
    disciplina (id, nome, modulo, sigla, id_curso)
VALUES
    (18, 'Qualidade e Teste de Software', 3, 'QTS', 1);

INSERT INTO
    disciplina (id, nome, modulo, sigla, id_curso)
VALUES
    (20, 'Inglês Instrumental', 1, 'II', 1);

INSERT INTO
    disciplina (id, nome, modulo, sigla, id_curso)
VALUES
    (
        21,
        'Ética e Cidadania Organizacional',
        1,
        'ECO',
        1
    );

INSERT INTO
    disciplina (id, nome, modulo, sigla, id_curso)
VALUES
    (
        22,
        'Operação de Software Aplicativo',
        1,
        'OSA',
        1
    );

INSERT INTO
    disciplina (id, nome, modulo, sigla, id_curso)
VALUES
    (
        23,
        'Linguagem, Trabalho e Tecnologia',
        3,
        'LTT',
        1
    );

INSERT INTO
    disciplina (id, nome, modulo, sigla, id_curso)
VALUES
    (
        24,
        'Desenvolvimento de Sistemas II',
        3,
        'DS2',
        1
    );

SET
    FOREIGN_KEY_CHECKS = 0;

TRUNCATE TABLE alternativa;

TRUNCATE TABLE questao;

SET
    FOREIGN_KEY_CHECKS = 1;

-- Inserção de Questões e Alternativas dos PDFs --
INSERT INTO
    questao (id, enunciado, pontuacao, id_disciplina)
VALUES
    (
        1,
        'O que significa “manual técnico” em inglês?',
        10,
        20
    );

INSERT INTO
    alternativa (id_questao, perguntas, correta)
VALUES
    (1, 'User file', 0);

INSERT INTO
    alternativa (id_questao, perguntas, correta)
VALUES
    (1, 'Technical manual', 1);

INSERT INTO
    alternativa (id_questao, perguntas, correta)
VALUES
    (1, 'Data sheet', 0);

INSERT INTO
    alternativa (id_questao, perguntas, correta)
VALUES
    (1, 'Work paper', 0);

INSERT INTO
    questao (id, enunciado, pontuacao, id_disciplina)
VALUES
    (
        2,
        'Qual é a tradução correta de “e-mail comercial”?',
        10,
        20
    );

INSERT INTO
    alternativa (id_questao, perguntas, correta)
VALUES
    (2, 'Company mail', 0);

INSERT INTO
    alternativa (id_questao, perguntas, correta)
VALUES
    (2, 'Office text', 0);

INSERT INTO
    alternativa (id_questao, perguntas, correta)
VALUES
    (2, 'Business e-mail', 1);

INSERT INTO
    alternativa (id_questao, perguntas, correta)
VALUES
    (2, 'Work letter', 0);

INSERT INTO
    questao (id, enunciado, pontuacao, id_disciplina)
VALUES
    (3, '“Glossário técnico” em inglês é:', 10, 20);

INSERT INTO
    alternativa (id_questao, perguntas, correta)
VALUES
    (3, 'Technical notes', 0);

INSERT INTO
    alternativa (id_questao, perguntas, correta)
VALUES
    (3, 'Technical dictionary', 0);

INSERT INTO
    alternativa (id_questao, perguntas, correta)
VALUES
    (3, 'Technical glossary', 1);

INSERT INTO
    alternativa (id_questao, perguntas, correta)
VALUES
    (3, 'Technical list', 0);

INSERT INTO
    questao (id, enunciado, pontuacao, id_disciplina)
VALUES
    (4, 'O que significa “customer service”?', 10, 20);

INSERT INTO
    alternativa (id_questao, perguntas, correta)
VALUES
    (4, 'Rede social', 0);

INSERT INTO
    alternativa (id_questao, perguntas, correta)
VALUES
    (4, 'Atendimento ao cliente', 1);

INSERT INTO
    alternativa (id_questao, perguntas, correta)
VALUES
    (4, 'Sistema operacional', 0);

INSERT INTO
    alternativa (id_questao, perguntas, correta)
VALUES
    (4, 'Banco de dados', 0);

INSERT INTO
    questao (id, enunciado, pontuacao, id_disciplina)
VALUES
    (5, '“Carta comercial” em inglês é:', 10, 20);

INSERT INTO
    alternativa (id_questao, perguntas, correta)
VALUES
    (5, 'Work card', 0);

INSERT INTO
    alternativa (id_questao, perguntas, correta)
VALUES
    (5, 'Company note', 0);

INSERT INTO
    alternativa (id_questao, perguntas, correta)
VALUES
    (5, 'Office paper', 0);

INSERT INTO
    alternativa (id_questao, perguntas, correta)
VALUES
    (5, 'Business letter', 1);

INSERT INTO
    questao (id, enunciado, pontuacao, id_disciplina)
VALUES
    (
        6,
        'O que significa “listening” no contexto de inglês instrumental?',
        20,
        20
    );

INSERT INTO
    alternativa (id_questao, perguntas, correta)
VALUES
    (6, 'Produção de glossários', 0);

INSERT INTO
    alternativa (id_questao, perguntas, correta)
VALUES
    (6, 'Escrita técnica', 0);

INSERT INTO
    alternativa (id_questao, perguntas, correta)
VALUES
    (6, 'Compreensão auditiva', 1);

INSERT INTO
    alternativa (id_questao, perguntas, correta)
VALUES
    (6, 'Leitura de textos', 0);

INSERT INTO
    questao (id, enunciado, pontuacao, id_disciplina)
VALUES
    (
        7,
        'O que significa “speaking” no ambiente profissional?',
        20,
        20
    );

INSERT INTO
    alternativa (id_questao, perguntas, correta)
VALUES
    (7, 'Produção de glossários', 0);

INSERT INTO
    alternativa (id_questao, perguntas, correta)
VALUES
    (7, 'Expressão oral', 1);

INSERT INTO
    alternativa (id_questao, perguntas, correta)
VALUES
    (7, 'Leitura de textos', 0);

INSERT INTO
    alternativa (id_questao, perguntas, correta)
VALUES
    (7, 'Escrita técnica', 0);

INSERT INTO
    questao (id, enunciado, pontuacao, id_disciplina)
VALUES
    (
        8,
        'O que significa “reading” em inglês instrumental?',
        20,
        20
    );

INSERT INTO
    alternativa (id_questao, perguntas, correta)
VALUES
    (8, 'Produção de textos', 0);

INSERT INTO
    alternativa (id_questao, perguntas, correta)
VALUES
    (8, 'Vocabulário técnico', 0);

INSERT INTO
    alternativa (id_questao, perguntas, correta)
VALUES
    (8, 'Estratégias de leitura e interpretação', 1);

INSERT INTO
    alternativa (id_questao, perguntas, correta)
VALUES
    (8, 'Expressão oral', 0);

INSERT INTO
    questao (id, enunciado, pontuacao, id_disciplina)
VALUES
    (
        9,
        'O que significa “writing” em inglês instrumental?',
        20,
        20
    );

INSERT INTO
    alternativa (id_questao, perguntas, correta)
VALUES
    (9, 'Produção de textos técnicos', 1);

INSERT INTO
    alternativa (id_questao, perguntas, correta)
VALUES
    (9, 'Vocabulário técnico', 0);

INSERT INTO
    alternativa (id_questao, perguntas, correta)
VALUES
    (9, 'Compreensão auditiva', 0);

INSERT INTO
    alternativa (id_questao, perguntas, correta)
VALUES
    (9, 'Expressão oral', 0);

INSERT INTO
    questao (id, enunciado, pontuacao, id_disciplina)
VALUES
    (10, 'O que significa “grammar focus”?', 20, 20);

INSERT INTO
    alternativa (id_questao, perguntas, correta)
VALUES
    (10, 'Produção de textos', 0);

INSERT INTO
    alternativa (id_questao, perguntas, correta)
VALUES
    (10, 'Expressão oral', 0);

INSERT INTO
    alternativa (id_questao, perguntas, correta)
VALUES
    (10, 'Vocabulário técnico', 0);

INSERT INTO
    alternativa (id_questao, perguntas, correta)
VALUES
    (
        10,
        'Compreensão e uso dos aspectos linguísticos',
        1
    );

INSERT INTO
    questao (id, enunciado, pontuacao, id_disciplina)
VALUES
    (
        11,
        'O que significa “technical terminology”?',
        30,
        20
    );

INSERT INTO
    alternativa (id_questao, perguntas, correta)
VALUES
    (11, 'Vocabulário coloquial', 0);

INSERT INTO
    alternativa (id_questao, perguntas, correta)
VALUES
    (11, 'Terminologia técnico-científica', 1);

INSERT INTO
    alternativa (id_questao, perguntas, correta)
VALUES
    (11, 'Vocabulário informal', 0);

INSERT INTO
    alternativa (id_questao, perguntas, correta)
VALUES
    (11, 'Vocabulário literário', 0);

INSERT INTO
    questao (id, enunciado, pontuacao, id_disciplina)
VALUES
    (
        12,
        'O que significa “administrative correspondence”?',
        30,
        20
    );

INSERT INTO
    alternativa (id_questao, perguntas, correta)
VALUES
    (12, 'Glossário técnico', 0);

INSERT INTO
    alternativa (id_questao, perguntas, correta)
VALUES
    (12, 'Carta pessoal', 0);

INSERT INTO
    alternativa (id_questao, perguntas, correta)
VALUES
    (12, 'Correspondência administrativa', 1);

INSERT INTO
    alternativa (id_questao, perguntas, correta)
VALUES
    (12, 'Texto literário', 0);

INSERT INTO
    questao (id, enunciado, pontuacao, id_disciplina)
VALUES
    (
        13,
        'O que significa “scientific article”?',
        30,
        20
    );

INSERT INTO
    alternativa (id_questao, perguntas, correta)
VALUES
    (13, 'Carta comercial', 0);

INSERT INTO
    alternativa (id_questao, perguntas, correta)
VALUES
    (13, 'Manual de instruções', 0);

INSERT INTO
    alternativa (id_questao, perguntas, correta)
VALUES
    (13, 'Artigo técnico-científico', 1);

INSERT INTO
    alternativa (id_questao, perguntas, correta)
VALUES
    (13, 'Folheto de divulgação', 0);

INSERT INTO
    questao (id, enunciado, pontuacao, id_disciplina)
VALUES
    (
        14,
        'O que significa “business communication”?',
        30,
        20
    );

INSERT INTO
    alternativa (id_questao, perguntas, correta)
VALUES
    (14, 'Comunicação artística', 0);

INSERT INTO
    alternativa (id_questao, perguntas, correta)
VALUES
    (14, 'Comunicação pessoal', 0);

INSERT INTO
    alternativa (id_questao, perguntas, correta)
VALUES
    (14, 'Comunicação empresarial', 1);

INSERT INTO
    alternativa (id_questao, perguntas, correta)
VALUES
    (14, 'Comunicação literária', 0);

INSERT INTO
    questao (id, enunciado, pontuacao, id_disciplina)
VALUES
    (
        15,
        'O que significa “technical documentation”?',
        30,
        20
    );

INSERT INTO
    alternativa (id_questao, perguntas, correta)
VALUES
    (15, 'Texto literário', 0);

INSERT INTO
    alternativa (id_questao, perguntas, correta)
VALUES
    (15, 'Glossário informal', 0);

INSERT INTO
    alternativa (id_questao, perguntas, correta)
VALUES
    (15, 'Carta pessoal', 0);

INSERT INTO
    alternativa (id_questao, perguntas, correta)
VALUES
    (15, 'Documentação técnica', 1);

INSERT INTO
    questao (id, enunciado, pontuacao, id_disciplina)
VALUES
    (16, 'O que é ética?', 10, 21);

INSERT INTO
    alternativa (id_questao, perguntas, correta)
VALUES
    (16, 'Conjunto de valores e princípios', 1);

INSERT INTO
    alternativa (id_questao, perguntas, correta)
VALUES
    (16, 'Banco de dados', 0);

INSERT INTO
    alternativa (id_questao, perguntas, correta)
VALUES
    (16, 'Hardware', 0);

INSERT INTO
    alternativa (id_questao, perguntas, correta)
VALUES
    (16, 'Software', 0);

INSERT INTO
    questao (id, enunciado, pontuacao, id_disciplina)
VALUES
    (17, 'O que é cidadania?', 10, 21);

INSERT INTO
    alternativa (id_questao, perguntas, correta)
VALUES
    (17, 'Banco de dados', 0);

INSERT INTO
    alternativa (id_questao, perguntas, correta)
VALUES
    (17, 'Exercício de direitos e deveres', 1);

INSERT INTO
    alternativa (id_questao, perguntas, correta)
VALUES
    (17, 'Hardware', 0);

INSERT INTO
    alternativa (id_questao, perguntas, correta)
VALUES
    (17, 'Software', 0);

INSERT INTO
    questao (id, enunciado, pontuacao, id_disciplina)
VALUES
    (18, 'O que é moral?', 10, 21);

INSERT INTO
    alternativa (id_questao, perguntas, correta)
VALUES
    (18, 'Banco de dados', 0);

INSERT INTO
    alternativa (id_questao, perguntas, correta)
VALUES
    (18, 'Hardware', 0);

INSERT INTO
    alternativa (id_questao, perguntas, correta)
VALUES
    (18, 'Conjunto de costumes e regras sociais', 1);

INSERT INTO
    alternativa (id_questao, perguntas, correta)
VALUES
    (18, 'Software', 0);

INSERT INTO
    questao (id, enunciado, pontuacao, id_disciplina)
VALUES
    (
        19,
        'O que é respeito no ambiente de trabalho?',
        10,
        21
    );

INSERT INTO
    alternativa (id_questao, perguntas, correta)
VALUES
    (19, 'Criar tabelas', 0);

INSERT INTO
    alternativa (id_questao, perguntas, correta)
VALUES
    (19, 'Executar programas', 0);

INSERT INTO
    alternativa (id_questao, perguntas, correta)
VALUES
    (19, 'Compilar código', 0);

INSERT INTO
    alternativa (id_questao, perguntas, correta)
VALUES
    (19, 'Reconhecimento do valor do outro', 1);

INSERT INTO
    questao (id, enunciado, pontuacao, id_disciplina)
VALUES
    (20, 'O que é responsabilidade social?', 10, 21);

INSERT INTO
    alternativa (id_questao, perguntas, correta)
VALUES
    (20, 'Compromisso da empresa com a sociedade', 1);

INSERT INTO
    alternativa (id_questao, perguntas, correta)
VALUES
    (20, 'Criar variáveis', 0);

INSERT INTO
    alternativa (id_questao, perguntas, correta)
VALUES
    (20, 'Compilar programas', 0);

INSERT INTO
    alternativa (id_questao, perguntas, correta)
VALUES
    (20, 'Usar IDE', 0);

INSERT INTO
    questao (id, enunciado, pontuacao, id_disciplina)
VALUES
    (21, 'O que é ética profissional?', 20, 21);

INSERT INTO
    alternativa (id_questao, perguntas, correta)
VALUES
    (21, 'Banco de dados', 0);

INSERT INTO
    alternativa (id_questao, perguntas, correta)
VALUES
    (
        21,
        'Conjunto de regras de conduta no trabalho',
        1
    );

INSERT INTO
    alternativa (id_questao, perguntas, correta)
VALUES
    (21, 'Hardware', 0);

INSERT INTO
    alternativa (id_questao, perguntas, correta)
VALUES
    (21, 'Software', 0);

INSERT INTO
    questao (id, enunciado, pontuacao, id_disciplina)
VALUES
    (
        22,
        'O que é Código de Defesa do Consumidor?',
        20,
        21
    );

INSERT INTO
    alternativa (id_questao, perguntas, correta)
VALUES
    (22, 'Manual técnico', 0);

INSERT INTO
    alternativa (id_questao, perguntas, correta)
VALUES
    (22, 'Banco de dados', 0);

INSERT INTO
    alternativa (id_questao, perguntas, correta)
VALUES
    (
        22,
        'Conjunto de normas que protegem os direitos do consumidor',
        1
    );

INSERT INTO
    alternativa (id_questao, perguntas, correta)
VALUES
    (22, 'Hardware', 0);

INSERT INTO
    questao (id, enunciado, pontuacao, id_disciplina)
VALUES
    (23, 'O que é legislação ambiental?', 20, 21);

INSERT INTO
    alternativa (id_questao, perguntas, correta)
VALUES
    (
        23,
        'Normas que regulam o uso sustentável dos recursos naturais',
        1
    );

INSERT INTO
    alternativa (id_questao, perguntas, correta)
VALUES
    (23, 'Manual técnico', 0);

INSERT INTO
    alternativa (id_questao, perguntas, correta)
VALUES
    (23, 'Banco de dados', 0);

INSERT INTO
    alternativa (id_questao, perguntas, correta)
VALUES
    (23, 'Hardware', 0);

INSERT INTO
    questao (id, enunciado, pontuacao, id_disciplina)
VALUES
    (24, 'O que é Código de Ética de TI?', 20, 21);

INSERT INTO
    alternativa (id_questao, perguntas, correta)
VALUES
    (24, 'Manual técnico', 0);

INSERT INTO
    alternativa (id_questao, perguntas, correta)
VALUES
    (24, 'Banco de dados', 0);

INSERT INTO
    alternativa (id_questao, perguntas, correta)
VALUES
    (24, 'Hardware', 0);

INSERT INTO
    alternativa (id_questao, perguntas, correta)
VALUES
    (
        24,
        'Normas de conduta para profissionais de tecnologia',
        1
    );

INSERT INTO
    questao (id, enunciado, pontuacao, id_disciplina)
VALUES
    (25, 'O que é inclusão social?', 20, 21);

INSERT INTO
    alternativa (id_questao, perguntas, correta)
VALUES
    (
        25,
        'Garantia de participação de todos na sociedade',
        1
    );

INSERT INTO
    alternativa (id_questao, perguntas, correta)
VALUES
    (25, 'Banco de dados', 0);

INSERT INTO
    alternativa (id_questao, perguntas, correta)
VALUES
    (25, 'Hardware', 0);

INSERT INTO
    alternativa (id_questao, perguntas, correta)
VALUES
    (25, 'Software', 0);

INSERT INTO
    questao (id, enunciado, pontuacao, id_disciplina)
VALUES
    (
        26,
        'O que é a Lei da Transparência (Lei Complementar 131/2009)?',
        30,
        21
    );

INSERT INTO
    alternativa (id_questao, perguntas, correta)
VALUES
    (26, 'Lei que regula direitos autorais', 0);

INSERT INTO
    alternativa (id_questao, perguntas, correta)
VALUES
    (
        26,
        'Lei que obriga União, estados e municípios a divulgar seus gastos em',
        1
    );

INSERT INTO
    alternativa (id_questao, perguntas, correta)
VALUES
    (
        26,
        'Lei que cria o Código de Defesa do Consumidor',
        0
    );

INSERT INTO
    alternativa (id_questao, perguntas, correta)
VALUES
    (26, 'Lei que regula patentes', 0);

INSERT INTO
    questao (id, enunciado, pontuacao, id_disciplina)
VALUES
    (
        27,
        'O que é a Lei de Acesso à Informação (Lei 12.527/2011)?',
        30,
        21
    );

INSERT INTO
    alternativa (id_questao, perguntas, correta)
VALUES
    (
        27,
        'Lei que garante acesso às informações públicas',
        1
    );

INSERT INTO
    alternativa (id_questao, perguntas, correta)
VALUES
    (27, 'Lei que regula direitos autorais', 0);

INSERT INTO
    alternativa (id_questao, perguntas, correta)
VALUES
    (
        27,
        'Lei que cria o Código de Defesa do Consumidor',
        0
    );

INSERT INTO
    alternativa (id_questao, perguntas, correta)
VALUES
    (27, 'Lei que regula patentes', 0);

INSERT INTO
    questao (id, enunciado, pontuacao, id_disciplina)
VALUES
    (28, 'O que é a LGPD (Lei 13.709/2018)?', 30, 21);

INSERT INTO
    alternativa (id_questao, perguntas, correta)
VALUES
    (28, 'Lei de Direitos Autorais', 0);

INSERT INTO
    alternativa (id_questao, perguntas, correta)
VALUES
    (28, 'Lei da Transparência', 0);

INSERT INTO
    alternativa (id_questao, perguntas, correta)
VALUES
    (28, 'Lei Geral de Proteção de Dados Pessoais', 1);

INSERT INTO
    alternativa (id_questao, perguntas, correta)
VALUES
    (28, 'Lei de Acesso à Informação', 0);

INSERT INTO
    questao (id, enunciado, pontuacao, id_disciplina)
VALUES
    (
        29,
        'O que é responsabilidade corporativa?',
        30,
        21
    );

INSERT INTO
    alternativa (id_questao, perguntas, correta)
VALUES
    (29, 'Criar variáveis', 0);

INSERT INTO
    alternativa (id_questao, perguntas, correta)
VALUES
    (29, 'Compilar programas', 0);

INSERT INTO
    alternativa (id_questao, perguntas, correta)
VALUES
    (29, 'Usar IDE', 0);

INSERT INTO
    alternativa (id_questao, perguntas, correta)
VALUES
    (
        29,
        'Compromisso da empresa com sociedade e meio ambiente',
        1
    );

INSERT INTO
    questao (id, enunciado, pontuacao, id_disciplina)
VALUES
    (30, 'O que é governança corporativa?', 30, 21);

INSERT INTO
    alternativa (id_questao, perguntas, correta)
VALUES
    (
        30,
        'Conjunto de práticas para gestão responsável e transparente',
        1
    );

INSERT INTO
    alternativa (id_questao, perguntas, correta)
VALUES
    (30, 'Banco de dados', 0);

INSERT INTO
    alternativa (id_questao, perguntas, correta)
VALUES
    (30, 'Hardware', 0);

INSERT INTO
    alternativa (id_questao, perguntas, correta)
VALUES
    (30, 'Software', 0);

INSERT INTO
    questao (id, enunciado, pontuacao, id_disciplina)
VALUES
    (31, 'O que é uma imagem raster (bitmap)?', 10, 4);

INSERT INTO
    alternativa (id_questao, perguntas, correta)
VALUES
    (31, 'Imagem formada por pixels', 1);

INSERT INTO
    alternativa (id_questao, perguntas, correta)
VALUES
    (31, 'Imagem formada por vetores', 0);

INSERT INTO
    alternativa (id_questao, perguntas, correta)
VALUES
    (31, 'Texto digital', 0);

INSERT INTO
    alternativa (id_questao, perguntas, correta)
VALUES
    (31, 'Som digital', 0);

INSERT INTO
    questao (id, enunciado, pontuacao, id_disciplina)
VALUES
    (
        32,
        'Qual formato é comum para imagens raster?',
        10,
        4
    );

INSERT INTO
    alternativa (id_questao, perguntas, correta)
VALUES
    (32, 'SVG', 0);

INSERT INTO
    alternativa (id_questao, perguntas, correta)
VALUES
    (32, 'JPG', 1);

INSERT INTO
    alternativa (id_questao, perguntas, correta)
VALUES
    (32, 'TXT', 0);

INSERT INTO
    alternativa (id_questao, perguntas, correta)
VALUES
    (32, 'DOC', 0);

INSERT INTO
    questao (id, enunciado, pontuacao, id_disciplina)
VALUES
    (33, 'O que é uma imagem vetorial?', 10, 4);

INSERT INTO
    alternativa (id_questao, perguntas, correta)
VALUES
    (33, 'Imagem formada por pixels', 0);

INSERT INTO
    alternativa (id_questao, perguntas, correta)
VALUES
    (33, 'Texto digital', 0);

INSERT INTO
    alternativa (id_questao, perguntas, correta)
VALUES
    (
        33,
        'Imagem formada por linhas e curvas matemáticas',
        1
    );

INSERT INTO
    alternativa (id_questao, perguntas, correta)
VALUES
    (33, 'Som digital', 0);

INSERT INTO
    questao (id, enunciado, pontuacao, id_disciplina)
VALUES
    (
        34,
        'Qual formato é comum para imagens vetoriais?',
        10,
        4
    );

INSERT INTO
    alternativa (id_questao, perguntas, correta)
VALUES
    (34, 'JPG', 0);

INSERT INTO
    alternativa (id_questao, perguntas, correta)
VALUES
    (34, 'PNG', 0);

INSERT INTO
    alternativa (id_questao, perguntas, correta)
VALUES
    (34, 'DOC', 0);

INSERT INTO
    alternativa (id_questao, perguntas, correta)
VALUES
    (34, 'SVG', 1);

INSERT INTO
    questao (id, enunciado, pontuacao, id_disciplina)
VALUES
    (35, 'O que significa CMYK?', 10, 4);

INSERT INTO
    alternativa (id_questao, perguntas, correta)
VALUES
    (35, 'Modelo de cores usado para impressão', 1);

INSERT INTO
    alternativa (id_questao, perguntas, correta)
VALUES
    (35, 'Modelo de cores usado em telas', 0);

INSERT INTO
    alternativa (id_questao, perguntas, correta)
VALUES
    (35, 'Código de programação', 0);

INSERT INTO
    alternativa (id_questao, perguntas, correta)
VALUES
    (35, 'Banco de dados', 0);

INSERT INTO
    questao (id, enunciado, pontuacao, id_disciplina)
VALUES
    (36, 'O que significa RGB?', 20, 4);

INSERT INTO
    alternativa (id_questao, perguntas, correta)
VALUES
    (36, 'Modelo de cores usado em telas', 1);

INSERT INTO
    alternativa (id_questao, perguntas, correta)
VALUES
    (36, 'Modelo de cores usado para impressão', 0);

INSERT INTO
    alternativa (id_questao, perguntas, correta)
VALUES
    (36, 'Código de programação', 0);

INSERT INTO
    alternativa (id_questao, perguntas, correta)
VALUES
    (36, 'Banco de dados', 0);

INSERT INTO
    questao (id, enunciado, pontuacao, id_disciplina)
VALUES
    (37, 'O que é prototipação de interfaces?', 20, 4);

INSERT INTO
    alternativa (id_questao, perguntas, correta)
VALUES
    (37, 'Criação de banco de dados', 0);

INSERT INTO
    alternativa (id_questao, perguntas, correta)
VALUES
    (
        37,
        'Criação de modelos visuais iniciais de aplicativos e sites',
        1
    );

INSERT INTO
    alternativa (id_questao, perguntas, correta)
VALUES
    (37, 'Criação de hardware', 0);

INSERT INTO
    alternativa (id_questao, perguntas, correta)
VALUES
    (37, 'Criação de textos', 0);

INSERT INTO
    questao (id, enunciado, pontuacao, id_disciplina)
VALUES
    (38, 'O que é tipografia?', 20, 4);

INSERT INTO
    alternativa (id_questao, perguntas, correta)
VALUES
    (38, 'Banco de dados', 0);

INSERT INTO
    alternativa (id_questao, perguntas, correta)
VALUES
    (38, 'Hardware', 0);

INSERT INTO
    alternativa (id_questao, perguntas, correta)
VALUES
    (38, 'Estilo e aparência das letras', 1);

INSERT INTO
    alternativa (id_questao, perguntas, correta)
VALUES
    (38, 'Software', 0);

INSERT INTO
    questao (id, enunciado, pontuacao, id_disciplina)
VALUES
    (39, 'O que é Gestalt no design?', 20, 4);

INSERT INTO
    alternativa (id_questao, perguntas, correta)
VALUES
    (39, 'Modelo de cores', 0);

INSERT INTO
    alternativa (id_questao, perguntas, correta)
VALUES
    (39, 'Linguagem de programação', 0);

INSERT INTO
    alternativa (id_questao, perguntas, correta)
VALUES
    (39, 'Banco de dados', 0);

INSERT INTO
    alternativa (id_questao, perguntas, correta)
VALUES
    (
        39,
        'Conjunto de princípios de percepção visual',
        1
    );

INSERT INTO
    questao (id, enunciado, pontuacao, id_disciplina)
VALUES
    (
        40,
        'O que é transparência em imagens digitais?',
        20,
        4
    );

INSERT INTO
    alternativa (id_questao, perguntas, correta)
VALUES
    (
        40,
        'Capacidade de deixar áreas sem cor visíveis',
        1
    );

INSERT INTO
    alternativa (id_questao, perguntas, correta)
VALUES
    (40, 'Capacidade de aumentar resolução', 0);

INSERT INTO
    alternativa (id_questao, perguntas, correta)
VALUES
    (40, 'Capacidade de criar vetores', 0);

INSERT INTO
    alternativa (id_questao, perguntas, correta)
VALUES
    (40, 'Capacidade de criar texto', 0);

INSERT INTO
    questao (id, enunciado, pontuacao, id_disciplina)
VALUES
    (
        41,
        'O que é HEXADECIMAL em design digital?',
        30,
        4
    );

INSERT INTO
    alternativa (id_questao, perguntas, correta)
VALUES
    (
        41,
        'Código usado para representar cores em sistemas digitais',
        1
    );

INSERT INTO
    alternativa (id_questao, perguntas, correta)
VALUES
    (41, 'Código usado para representar texto', 0);

INSERT INTO
    alternativa (id_questao, perguntas, correta)
VALUES
    (41, 'Código usado para representar sons', 0);

INSERT INTO
    alternativa (id_questao, perguntas, correta)
VALUES
    (41, 'Código usado para representar vetores', 0);

INSERT INTO
    questao (id, enunciado, pontuacao, id_disciplina)
VALUES
    (42, 'O que é um wireframe?', 30, 4);

INSERT INTO
    alternativa (id_questao, perguntas, correta)
VALUES
    (42, 'Banco de dados', 0);

INSERT INTO
    alternativa (id_questao, perguntas, correta)
VALUES
    (42, 'Esboço estrutural de uma interface', 1);

INSERT INTO
    alternativa (id_questao, perguntas, correta)
VALUES
    (42, 'Hardware', 0);

INSERT INTO
    alternativa (id_questao, perguntas, correta)
VALUES
    (42, 'Software', 0);

INSERT INTO
    questao (id, enunciado, pontuacao, id_disciplina)
VALUES
    (43, 'O que é um pictograma?', 30, 4);

INSERT INTO
    alternativa (id_questao, perguntas, correta)
VALUES
    (43, 'Texto digital', 0);

INSERT INTO
    alternativa (id_questao, perguntas, correta)
VALUES
    (43, 'Som digital', 0);

INSERT INTO
    alternativa (id_questao, perguntas, correta)
VALUES
    (
        43,
        'Símbolo gráfico simples que representa uma ideia ou objeto',
        1
    );

INSERT INTO
    alternativa (id_questao, perguntas, correta)
VALUES
    (43, 'Banco de dados', 0);

INSERT INTO
    questao (id, enunciado, pontuacao, id_disciplina)
VALUES
    (44, 'O que é um banco de imagens?', 30, 4);

INSERT INTO
    alternativa (id_questao, perguntas, correta)
VALUES
    (44, 'Banco de dados relacional', 0);

INSERT INTO
    alternativa (id_questao, perguntas, correta)
VALUES
    (44, 'Banco de sons', 0);

INSERT INTO
    alternativa (id_questao, perguntas, correta)
VALUES
    (44, 'Banco de textos', 0);

INSERT INTO
    alternativa (id_questao, perguntas, correta)
VALUES
    (
        44,
        'Repositório de imagens para uso em projetos',
        1
    );

INSERT INTO
    questao (id, enunciado, pontuacao, id_disciplina)
VALUES
    (
        45,
        'O que é prototipagem de alta fidelidade?',
        30,
        4
    );

INSERT INTO
    alternativa (id_questao, perguntas, correta)
VALUES
    (
        45,
        'Protótipo detalhado próximo ao produto final',
        1
    );

INSERT INTO
    alternativa (id_questao, perguntas, correta)
VALUES
    (45, 'Protótipo simples em papel', 0);

INSERT INTO
    alternativa (id_questao, perguntas, correta)
VALUES
    (45, 'Banco de dados', 0);

INSERT INTO
    alternativa (id_questao, perguntas, correta)
VALUES
    (45, 'Hardware', 0);

INSERT INTO
    questao (id, enunciado, pontuacao, id_disciplina)
VALUES
    (46, 'Qual a função da tag <p> em HTML?', 10, 5);

INSERT INTO
    alternativa (id_questao, perguntas, correta)
VALUES
    (46, 'Criar parágrafo', 1);

INSERT INTO
    alternativa (id_questao, perguntas, correta)
VALUES
    (46, 'Criar tabela', 0);

INSERT INTO
    alternativa (id_questao, perguntas, correta)
VALUES
    (46, 'Criar imagem', 0);

INSERT INTO
    alternativa (id_questao, perguntas, correta)
VALUES
    (46, 'Criar link', 0);

INSERT INTO
    questao (id, enunciado, pontuacao, id_disciplina)
VALUES
    (47, 'Qual a função da tag <img>?', 10, 5);

INSERT INTO
    alternativa (id_questao, perguntas, correta)
VALUES
    (47, 'Criar parágrafo', 0);

INSERT INTO
    alternativa (id_questao, perguntas, correta)
VALUES
    (47, 'Inserir imagem', 1);

INSERT INTO
    alternativa (id_questao, perguntas, correta)
VALUES
    (47, 'Criar tabela', 0);

INSERT INTO
    alternativa (id_questao, perguntas, correta)
VALUES
    (47, 'Criar link', 0);

INSERT INTO
    questao (id, enunciado, pontuacao, id_disciplina)
VALUES
    (48, 'Qual a função da tag <a>?', 10, 5);

INSERT INTO
    alternativa (id_questao, perguntas, correta)
VALUES
    (48, 'Criar tabela', 0);

INSERT INTO
    alternativa (id_questao, perguntas, correta)
VALUES
    (48, 'Criar imagem', 0);

INSERT INTO
    alternativa (id_questao, perguntas, correta)
VALUES
    (48, 'Criar link', 1);

INSERT INTO
    alternativa (id_questao, perguntas, correta)
VALUES
    (48, 'Criar parágrafo', 0);

INSERT INTO
    questao (id, enunciado, pontuacao, id_disciplina)
VALUES
    (
        49,
        'Qual a função da propriedade CSS color?',
        10,
        5
    );

INSERT INTO
    alternativa (id_questao, perguntas, correta)
VALUES
    (49, 'Definir tamanho da fonte', 0);

INSERT INTO
    alternativa (id_questao, perguntas, correta)
VALUES
    (49, 'Definir margem', 0);

INSERT INTO
    alternativa (id_questao, perguntas, correta)
VALUES
    (49, 'Definir borda', 0);

INSERT INTO
    alternativa (id_questao, perguntas, correta)
VALUES
    (49, 'Definir cor do texto', 1);

INSERT INTO
    questao (id, enunciado, pontuacao, id_disciplina)
VALUES
    (
        50,
        'Qual a função da propriedade CSS background-color?',
        10,
        5
    );

INSERT INTO
    alternativa (id_questao, perguntas, correta)
VALUES
    (50, 'Definir cor de fundo', 1);

INSERT INTO
    alternativa (id_questao, perguntas, correta)
VALUES
    (50, 'Definir cor do texto', 0);

INSERT INTO
    alternativa (id_questao, perguntas, correta)
VALUES
    (50, 'Definir tamanho da fonte', 0);

INSERT INTO
    alternativa (id_questao, perguntas, correta)
VALUES
    (50, 'Definir borda', 0);

INSERT INTO
    questao (id, enunciado, pontuacao, id_disciplina)
VALUES
    (
        51,
        'Qual a função da tag <form> em HTML?',
        20,
        5
    );

INSERT INTO
    alternativa (id_questao, perguntas, correta)
VALUES
    (51, 'Criar formulário', 1);

INSERT INTO
    alternativa (id_questao, perguntas, correta)
VALUES
    (51, 'Criar tabela', 0);

INSERT INTO
    alternativa (id_questao, perguntas, correta)
VALUES
    (51, 'Criar imagem', 0);

INSERT INTO
    alternativa (id_questao, perguntas, correta)
VALUES
    (51, 'Criar link', 0);

INSERT INTO
    questao (id, enunciado, pontuacao, id_disciplina)
VALUES
    (52, 'Qual a função da tag <table>?', 20, 5);

INSERT INTO
    alternativa (id_questao, perguntas, correta)
VALUES
    (52, 'Criar formulário', 0);

INSERT INTO
    alternativa (id_questao, perguntas, correta)
VALUES
    (52, 'Criar tabela', 1);

INSERT INTO
    alternativa (id_questao, perguntas, correta)
VALUES
    (52, 'Criar imagem', 0);

INSERT INTO
    alternativa (id_questao, perguntas, correta)
VALUES
    (52, 'Criar link', 0);

INSERT INTO
    questao (id, enunciado, pontuacao, id_disciplina)
VALUES
    (
        53,
        'Qual a função do comando document.getElementById() em',
        20,
        5
    );

INSERT INTO
    alternativa (id_questao, perguntas, correta)
VALUES
    (53, 'Criar variável', 0);

INSERT INTO
    alternativa (id_questao, perguntas, correta)
VALUES
    (53, 'Executar função', 0);

INSERT INTO
    alternativa (id_questao, perguntas, correta)
VALUES
    (53, 'Selecionar elemento pelo ID', 1);

INSERT INTO
    alternativa (id_questao, perguntas, correta)
VALUES
    (53, 'Criar tabela', 0);

INSERT INTO
    questao (id, enunciado, pontuacao, id_disciplina)
VALUES
    (
        54,
        'Qual a função da estrutura if/else em JavaScript?',
        20,
        5
    );

INSERT INTO
    alternativa (id_questao, perguntas, correta)
VALUES
    (54, 'Tomar decisões no código', 1);

INSERT INTO
    alternativa (id_questao, perguntas, correta)
VALUES
    (54, 'Criar variáveis', 0);

INSERT INTO
    alternativa (id_questao, perguntas, correta)
VALUES
    (54, 'Criar tabelas', 0);

INSERT INTO
    alternativa (id_questao, perguntas, correta)
VALUES
    (54, 'Inserir imagens', 0);

INSERT INTO
    questao (id, enunciado, pontuacao, id_disciplina)
VALUES
    (55, 'Qual a função do Box Model em CSS?', 20, 5);

INSERT INTO
    alternativa (id_questao, perguntas, correta)
VALUES
    (55, 'Criar tabelas', 0);

INSERT INTO
    alternativa (id_questao, perguntas, correta)
VALUES
    (55, 'Criar links', 0);

INSERT INTO
    alternativa (id_questao, perguntas, correta)
VALUES
    (55, 'Criar imagens', 0);

INSERT INTO
    alternativa (id_questao, perguntas, correta)
VALUES
    (
        55,
        'Definir margens, bordas, padding e conteúdo',
        1
    );

INSERT INTO
    questao (id, enunciado, pontuacao, id_disciplina)
VALUES
    (56, 'Qual a função do Flexbox em CSS?', 30, 5);

INSERT INTO
    alternativa (id_questao, perguntas, correta)
VALUES
    (
        56,
        'Organizar elementos em layouts flexíveis',
        1
    );

INSERT INTO
    alternativa (id_questao, perguntas, correta)
VALUES
    (56, 'Criar tabelas', 0);

INSERT INTO
    alternativa (id_questao, perguntas, correta)
VALUES
    (56, 'Criar links', 0);

INSERT INTO
    alternativa (id_questao, perguntas, correta)
VALUES
    (56, 'Criar imagens', 0);

INSERT INTO
    questao (id, enunciado, pontuacao, id_disciplina)
VALUES
    (
        57,
        'Qual a função do Grid Layout em CSS?',
        30,
        5
    );

INSERT INTO
    alternativa (id_questao, perguntas, correta)
VALUES
    (57, 'Criar tabelas', 0);

INSERT INTO
    alternativa (id_questao, perguntas, correta)
VALUES
    (
        57,
        'Organizar elementos em grades bidimensionais',
        1
    );

INSERT INTO
    alternativa (id_questao, perguntas, correta)
VALUES
    (57, 'Criar links', 0);

INSERT INTO
    alternativa (id_questao, perguntas, correta)
VALUES
    (57, 'Criar imagens', 0);

INSERT INTO
    questao (id, enunciado, pontuacao, id_disciplina)
VALUES
    (
        58,
        'O que significa async/await em JavaScript?',
        30,
        5
    );

INSERT INTO
    alternativa (id_questao, perguntas, correta)
VALUES
    (58, 'Estrutura para criar variáveis', 0);

INSERT INTO
    alternativa (id_questao, perguntas, correta)
VALUES
    (58, 'Estrutura para criar tabelas', 0);

INSERT INTO
    alternativa (id_questao, perguntas, correta)
VALUES
    (
        58,
        'Estrutura para lidar com programação assíncrona',
        1
    );

INSERT INTO
    alternativa (id_questao, perguntas, correta)
VALUES
    (58, 'Estrutura para criar links', 0);

INSERT INTO
    questao (id, enunciado, pontuacao, id_disciplina)
VALUES
    (
        59,
        'Qual a função do JSON em JavaScript?',
        30,
        5
    );

INSERT INTO
    alternativa (id_questao, perguntas, correta)
VALUES
    (59, 'Criar tabelas', 0);

INSERT INTO
    alternativa (id_questao, perguntas, correta)
VALUES
    (59, 'Criar links', 0);

INSERT INTO
    alternativa (id_questao, perguntas, correta)
VALUES
    (59, 'Criar imagens', 0);

INSERT INTO
    alternativa (id_questao, perguntas, correta)
VALUES
    (59, 'Formato para troca de dados', 1);

INSERT INTO
    questao (id, enunciado, pontuacao, id_disciplina)
VALUES
    (60, 'Qual a função do GitHub Pages?', 30, 5);

INSERT INTO
    alternativa (id_questao, perguntas, correta)
VALUES
    (60, 'Publicar sites estáticos', 1);

INSERT INTO
    alternativa (id_questao, perguntas, correta)
VALUES
    (60, 'Criar tabelas', 0);

INSERT INTO
    alternativa (id_questao, perguntas, correta)
VALUES
    (60, 'Criar links', 0);

INSERT INTO
    alternativa (id_questao, perguntas, correta)
VALUES
    (60, 'Criar imagens', 0);

INSERT INTO
    questao (id, enunciado, pontuacao, id_disciplina)
VALUES
    (61, 'O que é hardware?', 10, 6);

INSERT INTO
    alternativa (id_questao, perguntas, correta)
VALUES
    (61, 'Parte física do computador', 1);

INSERT INTO
    alternativa (id_questao, perguntas, correta)
VALUES
    (61, 'Programas de computador', 0);

INSERT INTO
    alternativa (id_questao, perguntas, correta)
VALUES
    (61, 'Banco de dados', 0);

INSERT INTO
    alternativa (id_questao, perguntas, correta)
VALUES
    (61, 'Rede', 0);

INSERT INTO
    questao (id, enunciado, pontuacao, id_disciplina)
VALUES
    (62, 'O que é software?', 10, 6);

INSERT INTO
    alternativa (id_questao, perguntas, correta)
VALUES
    (62, 'Parte física', 0);

INSERT INTO
    alternativa (id_questao, perguntas, correta)
VALUES
    (62, 'Programas e sistemas', 1);

INSERT INTO
    alternativa (id_questao, perguntas, correta)
VALUES
    (62, 'Cabos e periféricos', 0);

INSERT INTO
    alternativa (id_questao, perguntas, correta)
VALUES
    (62, 'Internet', 0);

INSERT INTO
    questao (id, enunciado, pontuacao, id_disciplina)
VALUES
    (
        63,
        'Qual destes é um sistema operacional?',
        10,
        6
    );

INSERT INTO
    alternativa (id_questao, perguntas, correta)
VALUES
    (63, 'Excel', 0);

INSERT INTO
    alternativa (id_questao, perguntas, correta)
VALUES
    (63, 'Chrome', 0);

INSERT INTO
    alternativa (id_questao, perguntas, correta)
VALUES
    (63, 'Windows', 1);

INSERT INTO
    alternativa (id_questao, perguntas, correta)
VALUES
    (63, 'Word', 0);

INSERT INTO
    questao (id, enunciado, pontuacao, id_disciplina)
VALUES
    (64, 'O que é memória RAM?', 10, 6);

INSERT INTO
    alternativa (id_questao, perguntas, correta)
VALUES
    (64, 'Memória permanente', 0);

INSERT INTO
    alternativa (id_questao, perguntas, correta)
VALUES
    (64, 'Disco rígido', 0);

INSERT INTO
    alternativa (id_questao, perguntas, correta)
VALUES
    (64, 'Processador', 0);

INSERT INTO
    alternativa (id_questao, perguntas, correta)
VALUES
    (64, 'Memória temporária de acesso rápido', 1);

INSERT INTO
    questao (id, enunciado, pontuacao, id_disciplina)
VALUES
    (
        65,
        'Qual destes é um periférico de entrada?',
        10,
        6
    );

INSERT INTO
    alternativa (id_questao, perguntas, correta)
VALUES
    (65, 'Teclado', 1);

INSERT INTO
    alternativa (id_questao, perguntas, correta)
VALUES
    (65, 'Monitor', 0);

INSERT INTO
    alternativa (id_questao, perguntas, correta)
VALUES
    (65, 'Impressora', 0);

INSERT INTO
    alternativa (id_questao, perguntas, correta)
VALUES
    (65, 'Caixa de som', 0);

INSERT INTO
    questao (id, enunciado, pontuacao, id_disciplina)
VALUES
    (66, 'O que é representação binária?', 20, 6);

INSERT INTO
    alternativa (id_questao, perguntas, correta)
VALUES
    (
        66,
        'Forma de representar informações usando 0 e 1',
        1
    );

INSERT INTO
    alternativa (id_questao, perguntas, correta)
VALUES
    (
        66,
        'Forma de representar informações usando letras',
        0
    );

INSERT INTO
    alternativa (id_questao, perguntas, correta)
VALUES
    (
        66,
        'Forma de representar informações usando imagens',
        0
    );

INSERT INTO
    alternativa (id_questao, perguntas, correta)
VALUES
    (
        66,
        'Forma de representar informações usando sons',
        0
    );

INSERT INTO
    questao (id, enunciado, pontuacao, id_disciplina)
VALUES
    (67, 'O que é software livre?', 20, 6);

INSERT INTO
    alternativa (id_questao, perguntas, correta)
VALUES
    (67, 'Software pago', 0);

INSERT INTO
    alternativa (id_questao, perguntas, correta)
VALUES
    (
        67,
        'Software que pode ser usado, modificado e distribuído livremente',
        1
    );

INSERT INTO
    alternativa (id_questao, perguntas, correta)
VALUES
    (67, 'Software de rede', 0);

INSERT INTO
    alternativa (id_questao, perguntas, correta)
VALUES
    (67, 'Software proprietário', 0);

INSERT INTO
    questao (id, enunciado, pontuacao, id_disciplina)
VALUES
    (68, 'O que é virtualização?', 20, 6);

INSERT INTO
    alternativa (id_questao, perguntas, correta)
VALUES
    (68, 'Backup de arquivos', 0);

INSERT INTO
    alternativa (id_questao, perguntas, correta)
VALUES
    (68, 'Criação de tabelas', 0);

INSERT INTO
    alternativa (id_questao, perguntas, correta)
VALUES
    (
        68,
        'Uso de máquinas virtuais para simular sistemas',
        1
    );

INSERT INTO
    alternativa (id_questao, perguntas, correta)
VALUES
    (68, 'Instalação de programas', 0);

INSERT INTO
    questao (id, enunciado, pontuacao, id_disciplina)
VALUES
    (69, 'O que é rede local (LAN)?', 20, 6);

INSERT INTO
    alternativa (id_questao, perguntas, correta)
VALUES
    (69, 'Rede mundial', 0);

INSERT INTO
    alternativa (id_questao, perguntas, correta)
VALUES
    (69, 'Rede sem fio global', 0);

INSERT INTO
    alternativa (id_questao, perguntas, correta)
VALUES
    (69, 'Rede de servidores', 0);

INSERT INTO
    alternativa (id_questao, perguntas, correta)
VALUES
    (69, 'Rede de computadores em pequena área', 1);

INSERT INTO
    questao (id, enunciado, pontuacao, id_disciplina)
VALUES
    (70, 'O que é computação em nuvem?', 20, 6);

INSERT INTO
    alternativa (id_questao, perguntas, correta)
VALUES
    (
        70,
        'Armazenamento e processamento de dados pela internet',
        1
    );

INSERT INTO
    alternativa (id_questao, perguntas, correta)
VALUES
    (70, 'Disco rígido externo', 0);

INSERT INTO
    alternativa (id_questao, perguntas, correta)
VALUES
    (70, 'Memória RAM', 0);

INSERT INTO
    alternativa (id_questao, perguntas, correta)
VALUES
    (70, 'Processador', 0);

INSERT INTO
    questao (id, enunciado, pontuacao, id_disciplina)
VALUES
    (
        71,
        'Qual comando do Windows em linha de comando exibe o conteúdo de',
        30,
        6
    );

INSERT INTO
    alternativa (id_questao, perguntas, correta)
VALUES
    (71, 'dir', 1);

INSERT INTO
    alternativa (id_questao, perguntas, correta)
VALUES
    (71, 'ls', 0);

INSERT INTO
    alternativa (id_questao, perguntas, correta)
VALUES
    (71, 'cd', 0);

INSERT INTO
    alternativa (id_questao, perguntas, correta)
VALUES
    (71, 'pwd', 0);

INSERT INTO
    questao (id, enunciado, pontuacao, id_disciplina)
VALUES
    (
        72,
        'Qual comando do Linux em linha de comando exibe o conteúdo de um',
        30,
        6
    );

INSERT INTO
    alternativa (id_questao, perguntas, correta)
VALUES
    (72, 'dir', 0);

INSERT INTO
    alternativa (id_questao, perguntas, correta)
VALUES
    (72, 'ls', 1);

INSERT INTO
    alternativa (id_questao, perguntas, correta)
VALUES
    (72, 'cd', 0);

INSERT INTO
    alternativa (id_questao, perguntas, correta)
VALUES
    (72, 'pwd', 0);

INSERT INTO
    questao (id, enunciado, pontuacao, id_disciplina)
VALUES
    (
        73,
        'Qual comando do Windows em linha de comando muda de diretório?',
        30,
        6
    );

INSERT INTO
    alternativa (id_questao, perguntas, correta)
VALUES
    (73, 'ls', 0);

INSERT INTO
    alternativa (id_questao, perguntas, correta)
VALUES
    (73, 'dir', 0);

INSERT INTO
    alternativa (id_questao, perguntas, correta)
VALUES
    (73, 'cd', 1);

INSERT INTO
    alternativa (id_questao, perguntas, correta)
VALUES
    (73, 'pwd', 0);

INSERT INTO
    questao (id, enunciado, pontuacao, id_disciplina)
VALUES
    (
        74,
        'Qual comando do Linux em linha de comando mostra o diretório atual?',
        30,
        6
    );

INSERT INTO
    alternativa (id_questao, perguntas, correta)
VALUES
    (74, 'ls', 0);

INSERT INTO
    alternativa (id_questao, perguntas, correta)
VALUES
    (74, 'cd', 0);

INSERT INTO
    alternativa (id_questao, perguntas, correta)
VALUES
    (74, 'dir', 0);

INSERT INTO
    alternativa (id_questao, perguntas, correta)
VALUES
    (74, 'pwd', 1);

INSERT INTO
    questao (id, enunciado, pontuacao, id_disciplina)
VALUES
    (75, 'O que é Internet das Coisas (IoT)?', 30, 6);

INSERT INTO
    alternativa (id_questao, perguntas, correta)
VALUES
    (
        75,
        'Conexão de objetos físicos à internet para troca de dados',
        1
    );

INSERT INTO
    alternativa (id_questao, perguntas, correta)
VALUES
    (75, 'Banco de dados relacional', 0);

INSERT INTO
    alternativa (id_questao, perguntas, correta)
VALUES
    (75, 'Disco rígido externo', 0);

INSERT INTO
    alternativa (id_questao, perguntas, correta)
VALUES
    (75, 'Memória RAM', 0);

INSERT INTO
    questao (id, enunciado, pontuacao, id_disciplina)
VALUES
    (
        76,
        'Qual programa é usado para edição de textos?',
        10,
        22
    );

INSERT INTO
    alternativa (id_questao, perguntas, correta)
VALUES
    (76, 'Word', 1);

INSERT INTO
    alternativa (id_questao, perguntas, correta)
VALUES
    (76, 'Excel', 0);

INSERT INTO
    alternativa (id_questao, perguntas, correta)
VALUES
    (76, 'PowerPoint', 0);

INSERT INTO
    alternativa (id_questao, perguntas, correta)
VALUES
    (76, 'Access', 0);

INSERT INTO
    questao (id, enunciado, pontuacao, id_disciplina)
VALUES
    (
        77,
        'Qual programa é usado para planilhas eletrônicas?',
        10,
        22
    );

INSERT INTO
    alternativa (id_questao, perguntas, correta)
VALUES
    (77, 'Word', 0);

INSERT INTO
    alternativa (id_questao, perguntas, correta)
VALUES
    (77, 'Excel', 1);

INSERT INTO
    alternativa (id_questao, perguntas, correta)
VALUES
    (77, 'PowerPoint', 0);

INSERT INTO
    alternativa (id_questao, perguntas, correta)
VALUES
    (77, 'Outlook', 0);

INSERT INTO
    questao (id, enunciado, pontuacao, id_disciplina)
VALUES
    (
        78,
        'Qual programa é usado para apresentações?',
        10,
        22
    );

INSERT INTO
    alternativa (id_questao, perguntas, correta)
VALUES
    (78, 'Word', 0);

INSERT INTO
    alternativa (id_questao, perguntas, correta)
VALUES
    (78, 'Excel', 0);

INSERT INTO
    alternativa (id_questao, perguntas, correta)
VALUES
    (78, 'PowerPoint', 1);

INSERT INTO
    alternativa (id_questao, perguntas, correta)
VALUES
    (78, 'Access', 0);

INSERT INTO
    questao (id, enunciado, pontuacao, id_disciplina)
VALUES
    (
        79,
        'Qual recurso do Word insere numeração automática em listas?',
        10,
        22
    );

INSERT INTO
    alternativa (id_questao, perguntas, correta)
VALUES
    (79, 'Mala direta', 0);

INSERT INTO
    alternativa (id_questao, perguntas, correta)
VALUES
    (79, 'Cabeçalho', 0);

INSERT INTO
    alternativa (id_questao, perguntas, correta)
VALUES
    (79, 'Sumário', 0);

INSERT INTO
    alternativa (id_questao, perguntas, correta)
VALUES
    (79, 'Marcadores e numeração', 1);

INSERT INTO
    questao (id, enunciado, pontuacao, id_disciplina)
VALUES
    (
        80,
        'Qual recurso do Excel permite somar valores rapidamente?',
        10,
        22
    );

INSERT INTO
    alternativa (id_questao, perguntas, correta)
VALUES
    (80, 'Função SOMA', 1);

INSERT INTO
    alternativa (id_questao, perguntas, correta)
VALUES
    (80, 'Função MÉDIA', 0);

INSERT INTO
    alternativa (id_questao, perguntas, correta)
VALUES
    (80, 'Função SE', 0);

INSERT INTO
    alternativa (id_questao, perguntas, correta)
VALUES
    (80, 'Função PROCV', 0);

INSERT INTO
    questao (id, enunciado, pontuacao, id_disciplina)
VALUES
    (
        81,
        'Qual recurso do Word permite criar cartas personalizadas para vários',
        20,
        22
    );

INSERT INTO
    alternativa (id_questao, perguntas, correta)
VALUES
    (81, 'Mala direta', 1);

INSERT INTO
    alternativa (id_questao, perguntas, correta)
VALUES
    (81, 'Cabeçalho', 0);

INSERT INTO
    alternativa (id_questao, perguntas, correta)
VALUES
    (81, 'Rodapé', 0);

INSERT INTO
    alternativa (id_questao, perguntas, correta)
VALUES
    (81, 'Sumário', 0);

INSERT INTO
    questao (id, enunciado, pontuacao, id_disciplina)
VALUES
    (
        82,
        'Qual recurso do Excel permite aplicar regras visuais a células?',
        20,
        22
    );

INSERT INTO
    alternativa (id_questao, perguntas, correta)
VALUES
    (82, 'Função SE', 0);

INSERT INTO
    alternativa (id_questao, perguntas, correta)
VALUES
    (82, 'Formatação condicional', 1);

INSERT INTO
    alternativa (id_questao, perguntas, correta)
VALUES
    (82, 'Filtro', 0);

INSERT INTO
    alternativa (id_questao, perguntas, correta)
VALUES
    (82, 'Gráfico', 0);

INSERT INTO
    questao (id, enunciado, pontuacao, id_disciplina)
VALUES
    (
        83,
        'Qual recurso do PowerPoint adiciona movimento aos elementos do',
        20,
        22
    );

INSERT INTO
    alternativa (id_questao, perguntas, correta)
VALUES
    (83, 'Layout', 0);

INSERT INTO
    alternativa (id_questao, perguntas, correta)
VALUES
    (83, 'Hiperlink', 0);

INSERT INTO
    alternativa (id_questao, perguntas, correta)
VALUES
    (83, 'Animações', 1);

INSERT INTO
    alternativa (id_questao, perguntas, correta)
VALUES
    (83, 'Cabeçalho', 0);

INSERT INTO
    questao (id, enunciado, pontuacao, id_disciplina)
VALUES
    (
        84,
        'Qual recurso do Word gera automaticamente índice de capítulos?',
        20,
        22
    );

INSERT INTO
    alternativa (id_questao, perguntas, correta)
VALUES
    (84, 'Mala direta', 0);

INSERT INTO
    alternativa (id_questao, perguntas, correta)
VALUES
    (84, 'Rodapé', 0);

INSERT INTO
    alternativa (id_questao, perguntas, correta)
VALUES
    (84, 'Comentários', 0);

INSERT INTO
    alternativa (id_questao, perguntas, correta)
VALUES
    (84, 'Sumário', 1);

INSERT INTO
    questao (id, enunciado, pontuacao, id_disciplina)
VALUES
    (
        85,
        'Qual recurso do Excel permite organizar dados em ordem crescente ou',
        20,
        22
    );

INSERT INTO
    alternativa (id_questao, perguntas, correta)
VALUES
    (85, 'Classificação', 1);

INSERT INTO
    alternativa (id_questao, perguntas, correta)
VALUES
    (85, 'Filtro', 0);

INSERT INTO
    alternativa (id_questao, perguntas, correta)
VALUES
    (85, 'Gráfico', 0);

INSERT INTO
    alternativa (id_questao, perguntas, correta)
VALUES
    (85, 'Validação', 0);

INSERT INTO
    questao (id, enunciado, pontuacao, id_disciplina)
VALUES
    (
        86,
        'Qual função do Excel retorna um valor de uma tabela com base em uma',
        30,
        22
    );

INSERT INTO
    alternativa (id_questao, perguntas, correta)
VALUES
    (86, 'PROCV', 1);

INSERT INTO
    alternativa (id_questao, perguntas, correta)
VALUES
    (86, 'SOMA', 0);

INSERT INTO
    alternativa (id_questao, perguntas, correta)
VALUES
    (86, 'MÉDIA', 0);

INSERT INTO
    alternativa (id_questao, perguntas, correta)
VALUES
    (86, 'SE', 0);

INSERT INTO
    questao (id, enunciado, pontuacao, id_disciplina)
VALUES
    (
        87,
        'Qual recurso do Word insere citações e gera bibliografia',
        30,
        22
    );

INSERT INTO
    alternativa (id_questao, perguntas, correta)
VALUES
    (87, 'Mala direta', 0);

INSERT INTO
    alternativa (id_questao, perguntas, correta)
VALUES
    (87, 'Referências', 1);

INSERT INTO
    alternativa (id_questao, perguntas, correta)
VALUES
    (87, 'Sumário', 0);

INSERT INTO
    alternativa (id_questao, perguntas, correta)
VALUES
    (87, 'Comentários', 0);

INSERT INTO
    questao (id, enunciado, pontuacao, id_disciplina)
VALUES
    (
        88,
        'Qual recurso do PowerPoint permite criar botões interativos nos slides?',
        30,
        22
    );

INSERT INTO
    alternativa (id_questao, perguntas, correta)
VALUES
    (88, 'Layout', 0);

INSERT INTO
    alternativa (id_questao, perguntas, correta)
VALUES
    (88, 'Cabeçalho', 0);

INSERT INTO
    alternativa (id_questao, perguntas, correta)
VALUES
    (88, 'Hiperlinks e botões de ação', 1);

INSERT INTO
    alternativa (id_questao, perguntas, correta)
VALUES
    (88, 'Rodapé', 0);

INSERT INTO
    questao (id, enunciado, pontuacao, id_disciplina)
VALUES
    (
        89,
        'Qual recurso do Excel permite criar relatórios dinâmicos a partir de',
        30,
        22
    );

INSERT INTO
    alternativa (id_questao, perguntas, correta)
VALUES
    (89, 'Filtro', 0);

INSERT INTO
    alternativa (id_questao, perguntas, correta)
VALUES
    (89, 'Gráfico', 0);

INSERT INTO
    alternativa (id_questao, perguntas, correta)
VALUES
    (89, 'Classificação', 0);

INSERT INTO
    alternativa (id_questao, perguntas, correta)
VALUES
    (89, 'Tabela dinâmica', 1);

INSERT INTO
    questao (id, enunciado, pontuacao, id_disciplina)
VALUES
    (
        90,
        'Qual recurso colaborativo permite editar documentos em tempo real na',
        30,
        22
    );

INSERT INTO
    alternativa (id_questao, perguntas, correta)
VALUES
    (
        90,
        'Aplicativos online como Google Docs e Office 365',
        1
    );

INSERT INTO
    alternativa (id_questao, perguntas, correta)
VALUES
    (90, 'Word offline', 0);

INSERT INTO
    alternativa (id_questao, perguntas, correta)
VALUES
    (90, 'Excel offline', 0);

INSERT INTO
    alternativa (id_questao, perguntas, correta)
VALUES
    (90, 'PowerPoint offline', 0);

INSERT INTO
    questao (id, enunciado, pontuacao, id_disciplina)
VALUES
    (91, 'O que é um banco de dados?', 10, 2);

INSERT INTO
    alternativa (id_questao, perguntas, correta)
VALUES
    (91, 'Conjunto organizado de informações', 1);

INSERT INTO
    alternativa (id_questao, perguntas, correta)
VALUES
    (91, 'Programa de edição de texto', 0);

INSERT INTO
    alternativa (id_questao, perguntas, correta)
VALUES
    (91, 'Hardware', 0);

INSERT INTO
    alternativa (id_questao, perguntas, correta)
VALUES
    (91, 'Rede', 0);

INSERT INTO
    questao (id, enunciado, pontuacao, id_disciplina)
VALUES
    (92, 'O que significa SQL?', 10, 2);

INSERT INTO
    alternativa (id_questao, perguntas, correta)
VALUES
    (92, 'Simple Query Language', 0);

INSERT INTO
    alternativa (id_questao, perguntas, correta)
VALUES
    (92, 'Structured Query Language', 1);

INSERT INTO
    alternativa (id_questao, perguntas, correta)
VALUES
    (92, 'System Query Language', 0);

INSERT INTO
    alternativa (id_questao, perguntas, correta)
VALUES
    (92, 'Standard Quick Language', 0);

INSERT INTO
    questao (id, enunciado, pontuacao, id_disciplina)
VALUES
    (
        93,
        'Para que serve uma tabela em banco de dados?',
        10,
        2
    );

INSERT INTO
    alternativa (id_questao, perguntas, correta)
VALUES
    (93, 'Executar programas', 0);

INSERT INTO
    alternativa (id_questao, perguntas, correta)
VALUES
    (93, 'Criar variáveis', 0);

INSERT INTO
    alternativa (id_questao, perguntas, correta)
VALUES
    (93, 'Organizar dados em linhas e colunas', 1);

INSERT INTO
    alternativa (id_questao, perguntas, correta)
VALUES
    (93, 'Depurar erros', 0);

INSERT INTO
    questao (id, enunciado, pontuacao, id_disciplina)
VALUES
    (94, 'O que é uma chave primária?', 10, 2);

INSERT INTO
    alternativa (id_questao, perguntas, correta)
VALUES
    (94, 'Um compilador', 0);

INSERT INTO
    alternativa (id_questao, perguntas, correta)
VALUES
    (94, 'Uma constante', 0);

INSERT INTO
    alternativa (id_questao, perguntas, correta)
VALUES
    (94, 'Uma linguagem', 0);

INSERT INTO
    alternativa (id_questao, perguntas, correta)
VALUES
    (94, 'Identificador único de registros', 1);

INSERT INTO
    questao (id, enunciado, pontuacao, id_disciplina)
VALUES
    (
        95,
        'Cite um sistema gerenciador de banco de dados relacional (SGBDR).',
        10,
        2
    );

INSERT INTO
    alternativa (id_questao, perguntas, correta)
VALUES
    (95, 'MySQL', 1);

INSERT INTO
    alternativa (id_questao, perguntas, correta)
VALUES
    (95, 'Python', 0);

INSERT INTO
    alternativa (id_questao, perguntas, correta)
VALUES
    (95, 'Excel', 0);

INSERT INTO
    alternativa (id_questao, perguntas, correta)
VALUES
    (95, 'HTML', 0);

INSERT INTO
    questao (id, enunciado, pontuacao, id_disciplina)
VALUES
    (96, 'Diferença entre DELETE e DROP:', 20, 2);

INSERT INTO
    alternativa (id_questao, perguntas, correta)
VALUES
    (96, 'DELETE remove dados, DROP remove tabela', 1);

INSERT INTO
    alternativa (id_questao, perguntas, correta)
VALUES
    (96, 'Ambos removem tabelas', 0);

INSERT INTO
    alternativa (id_questao, perguntas, correta)
VALUES
    (96, 'Ambos removem dados', 0);

INSERT INTO
    alternativa (id_questao, perguntas, correta)
VALUES
    (96, 'Não há diferença', 0);

INSERT INTO
    questao (id, enunciado, pontuacao, id_disciplina)
VALUES
    (
        97,
        'O que é relacionamento entre tabelas?',
        20,
        2
    );

INSERT INTO
    alternativa (id_questao, perguntas, correta)
VALUES
    (97, 'Criação de variáveis', 0);

INSERT INTO
    alternativa (id_questao, perguntas, correta)
VALUES
    (
        97,
        'Conexão entre dados de diferentes tabelas',
        1
    );

INSERT INTO
    alternativa (id_questao, perguntas, correta)
VALUES
    (97, 'Execução de programas', 0);

INSERT INTO
    alternativa (id_questao, perguntas, correta)
VALUES
    (97, 'Depuração', 0);

INSERT INTO
    questao (id, enunciado, pontuacao, id_disciplina)
VALUES
    (98, 'Qual a função do comando SELECT?', 20, 2);

INSERT INTO
    alternativa (id_questao, perguntas, correta)
VALUES
    (98, 'Apagar registros', 0);

INSERT INTO
    alternativa (id_questao, perguntas, correta)
VALUES
    (98, 'Criar tabelas', 0);

INSERT INTO
    alternativa (id_questao, perguntas, correta)
VALUES
    (98, 'Consultar dados', 1);

INSERT INTO
    alternativa (id_questao, perguntas, correta)
VALUES
    (98, 'Compilar código', 0);

INSERT INTO
    questao (id, enunciado, pontuacao, id_disciplina)
VALUES
    (99, 'O que é modelagem de dados?', 20, 2);

INSERT INTO
    alternativa (id_questao, perguntas, correta)
VALUES
    (99, 'Criar variáveis', 0);

INSERT INTO
    alternativa (id_questao, perguntas, correta)
VALUES
    (99, 'Executar programas', 0);

INSERT INTO
    alternativa (id_questao, perguntas, correta)
VALUES
    (99, 'Depurar erros', 0);

INSERT INTO
    alternativa (id_questao, perguntas, correta)
VALUES
    (99, 'Processo de estruturar dados e relações', 1);

INSERT INTO
    questao (id, enunciado, pontuacao, id_disciplina)
VALUES
    (100, 'O que é chave estrangeira?', 20, 2);

INSERT INTO
    alternativa (id_questao, perguntas, correta)
VALUES
    (
        100,
        'Campo que referencia chave primária de outra tabela',
        1
    );

INSERT INTO
    alternativa (id_questao, perguntas, correta)
VALUES
    (100, 'Um compilador', 0);

INSERT INTO
    alternativa (id_questao, perguntas, correta)
VALUES
    (100, 'Uma constante', 0);

INSERT INTO
    alternativa (id_questao, perguntas, correta)
VALUES
    (100, 'Uma linguagem', 0);

INSERT INTO
    questao (id, enunciado, pontuacao, id_disciplina)
VALUES
    (
        101,
        'Diferença entre bancos relacionais e não relacionais:',
        30,
        2
    );

INSERT INTO
    alternativa (id_questao, perguntas, correta)
VALUES
    (
        101,
        'Relacionais usam tabelas, não relacionais usam documentos ou',
        1
    );

INSERT INTO
    alternativa (id_questao, perguntas, correta)
VALUES
    (101, 'Ambos usam tabelas', 0);

INSERT INTO
    alternativa (id_questao, perguntas, correta)
VALUES
    (101, 'Ambos usam grafos', 0);

INSERT INTO
    alternativa (id_questao, perguntas, correta)
VALUES
    (101, 'Não há diferença', 0);

INSERT INTO
    questao (id, enunciado, pontuacao, id_disciplina)
VALUES
    (
        102,
        'O que é normalização de banco de dados?',
        30,
        2
    );

INSERT INTO
    alternativa (id_questao, perguntas, correta)
VALUES
    (102, 'Criar variáveis', 0);

INSERT INTO
    alternativa (id_questao, perguntas, correta)
VALUES
    (
        102,
        'Processo de organizar dados para evitar redundância',
        1
    );

INSERT INTO
    alternativa (id_questao, perguntas, correta)
VALUES
    (102, 'Executar programas', 0);

INSERT INTO
    alternativa (id_questao, perguntas, correta)
VALUES
    (102, 'Depurar erros', 0);

INSERT INTO
    questao (id, enunciado, pontuacao, id_disciplina)
VALUES
    (103, 'Como funciona um JOIN em SQL?', 30, 2);

INSERT INTO
    alternativa (id_questao, perguntas, correta)
VALUES
    (103, 'Cria variáveis', 0);

INSERT INTO
    alternativa (id_questao, perguntas, correta)
VALUES
    (103, 'Apaga registros', 0);

INSERT INTO
    alternativa (id_questao, perguntas, correta)
VALUES
    (103, 'Combina dados de duas ou mais tabelas', 1);

INSERT INTO
    alternativa (id_questao, perguntas, correta)
VALUES
    (103, 'Compila código', 0);

INSERT INTO
    questao (id, enunciado, pontuacao, id_disciplina)
VALUES
    (
        104,
        'Importância da integridade referencial:',
        30,
        2
    );

INSERT INTO
    alternativa (id_questao, perguntas, correta)
VALUES
    (104, 'Criar variáveis', 0);

INSERT INTO
    alternativa (id_questao, perguntas, correta)
VALUES
    (104, 'Executar programas', 0);

INSERT INTO
    alternativa (id_questao, perguntas, correta)
VALUES
    (104, 'Depurar erros', 0);

INSERT INTO
    alternativa (id_questao, perguntas, correta)
VALUES
    (
        104,
        'Garantir consistência entre tabelas relacionadas',
        1
    );

INSERT INTO
    questao (id, enunciado, pontuacao, id_disciplina)
VALUES
    (
        105,
        'Etapas para criar modelo lógico de banco de dados:',
        30,
        2
    );

INSERT INTO
    alternativa (id_questao, perguntas, correta)
VALUES
    (
        105,
        'Definir entidades, atributos, relacionamentos e restrições',
        1
    );

INSERT INTO
    alternativa (id_questao, perguntas, correta)
VALUES
    (105, 'Criar variáveis', 0);

INSERT INTO
    alternativa (id_questao, perguntas, correta)
VALUES
    (105, 'Compilar programas', 0);

INSERT INTO
    alternativa (id_questao, perguntas, correta)
VALUES
    (105, 'Usar IDE', 0);

INSERT INTO
    questao (id, enunciado, pontuacao, id_disciplina)
VALUES
    (106, 'O que é um algoritmo?', 10, 1);

INSERT INTO
    alternativa (id_questao, perguntas, correta)
VALUES
    (
        106,
        'Conjunto de instruções para resolver um problema',
        1
    );

INSERT INTO
    alternativa (id_questao, perguntas, correta)
VALUES
    (106, 'Banco de dados', 0);

INSERT INTO
    alternativa (id_questao, perguntas, correta)
VALUES
    (106, 'Hardware', 0);

INSERT INTO
    alternativa (id_questao, perguntas, correta)
VALUES
    (106, 'Software', 0);

INSERT INTO
    questao (id, enunciado, pontuacao, id_disciplina)
VALUES
    (107, 'O que é uma variável?', 10, 1);

INSERT INTO
    alternativa (id_questao, perguntas, correta)
VALUES
    (107, 'Valor fixo', 0);

INSERT INTO
    alternativa (id_questao, perguntas, correta)
VALUES
    (
        107,
        'Espaço na memória que pode armazenar valores',
        1
    );

INSERT INTO
    alternativa (id_questao, perguntas, correta)
VALUES
    (107, 'Banco de dados', 0);

INSERT INTO
    alternativa (id_questao, perguntas, correta)
VALUES
    (107, 'Hardware', 0);

INSERT INTO
    questao (id, enunciado, pontuacao, id_disciplina)
VALUES
    (108, 'O que é uma constante?', 10, 1);

INSERT INTO
    alternativa (id_questao, perguntas, correta)
VALUES
    (108, 'Valor que muda sempre', 0);

INSERT INTO
    alternativa (id_questao, perguntas, correta)
VALUES
    (108, 'Banco de dados', 0);

INSERT INTO
    alternativa (id_questao, perguntas, correta)
VALUES
    (
        108,
        'Valor que não pode ser alterado durante a execução',
        1
    );

INSERT INTO
    alternativa (id_questao, perguntas, correta)
VALUES
    (108, 'Hardware', 0);

INSERT INTO
    questao (id, enunciado, pontuacao, id_disciplina)
VALUES
    (109, 'O que é uma IDE?', 10, 1);

INSERT INTO
    alternativa (id_questao, perguntas, correta)
VALUES
    (109, 'Banco de dados', 0);

INSERT INTO
    alternativa (id_questao, perguntas, correta)
VALUES
    (109, 'Hardware', 0);

INSERT INTO
    alternativa (id_questao, perguntas, correta)
VALUES
    (109, 'Software', 0);

INSERT INTO
    alternativa (id_questao, perguntas, correta)
VALUES
    (109, 'Ambiente de desenvolvimento integrado', 1);

INSERT INTO
    questao (id, enunciado, pontuacao, id_disciplina)
VALUES
    (110, 'O que significa “depuração”?', 10, 1);

INSERT INTO
    alternativa (id_questao, perguntas, correta)
VALUES
    (110, 'Processo de encontrar e corrigir erros', 1);

INSERT INTO
    alternativa (id_questao, perguntas, correta)
VALUES
    (110, 'Criar variáveis', 0);

INSERT INTO
    alternativa (id_questao, perguntas, correta)
VALUES
    (110, 'Compilar programas', 0);

INSERT INTO
    alternativa (id_questao, perguntas, correta)
VALUES
    (110, 'Usar banco de dados', 0);

INSERT INTO
    questao (id, enunciado, pontuacao, id_disciplina)
VALUES
    (111, 'Qual a função do comando if/else?', 20, 1);

INSERT INTO
    alternativa (id_questao, perguntas, correta)
VALUES
    (111, 'Tomar decisões no código', 1);

INSERT INTO
    alternativa (id_questao, perguntas, correta)
VALUES
    (111, 'Criar variáveis', 0);

INSERT INTO
    alternativa (id_questao, perguntas, correta)
VALUES
    (111, 'Criar tabelas', 0);

INSERT INTO
    alternativa (id_questao, perguntas, correta)
VALUES
    (111, 'Inserir imagens', 0);

INSERT INTO
    questao (id, enunciado, pontuacao, id_disciplina)
VALUES
    (112, 'O que é laço de repetição?', 20, 1);

INSERT INTO
    alternativa (id_questao, perguntas, correta)
VALUES
    (112, 'Estrutura que cria variáveis', 0);

INSERT INTO
    alternativa (id_questao, perguntas, correta)
VALUES
    (
        112,
        'Estrutura que executa um bloco de código várias vezes',
        1
    );

INSERT INTO
    alternativa (id_questao, perguntas, correta)
VALUES
    (112, 'Estrutura que compila programas', 0);

INSERT INTO
    alternativa (id_questao, perguntas, correta)
VALUES
    (112, 'Estrutura que cria tabelas', 0);

INSERT INTO
    questao (id, enunciado, pontuacao, id_disciplina)
VALUES
    (113, 'O que é teste de mesa?', 20, 1);

INSERT INTO
    alternativa (id_questao, perguntas, correta)
VALUES
    (113, 'Criação de variáveis', 0);

INSERT INTO
    alternativa (id_questao, perguntas, correta)
VALUES
    (113, 'Execução automática', 0);

INSERT INTO
    alternativa (id_questao, perguntas, correta)
VALUES
    (
        113,
        'Simulação manual da execução de um algoritmo',
        1
    );

INSERT INTO
    alternativa (id_questao, perguntas, correta)
VALUES
    (113, 'Compilação', 0);

INSERT INTO
    questao (id, enunciado, pontuacao, id_disciplina)
VALUES
    (114, 'O que é programação modular?', 20, 1);

INSERT INTO
    alternativa (id_questao, perguntas, correta)
VALUES
    (114, 'Criação de variáveis', 0);

INSERT INTO
    alternativa (id_questao, perguntas, correta)
VALUES
    (114, 'Compilação', 0);

INSERT INTO
    alternativa (id_questao, perguntas, correta)
VALUES
    (114, 'Depuração', 0);

INSERT INTO
    alternativa (id_questao, perguntas, correta)
VALUES
    (
        114,
        'Divisão do programa em funções e procedimentos',
        1
    );

INSERT INTO
    questao (id, enunciado, pontuacao, id_disciplina)
VALUES
    (115, 'O que é recursividade?', 20, 1);

INSERT INTO
    alternativa (id_questao, perguntas, correta)
VALUES
    (115, 'Função que chama a si mesma', 1);

INSERT INTO
    alternativa (id_questao, perguntas, correta)
VALUES
    (115, 'Função que cria variáveis', 0);

INSERT INTO
    alternativa (id_questao, perguntas, correta)
VALUES
    (115, 'Função que compila programas', 0);

INSERT INTO
    alternativa (id_questao, perguntas, correta)
VALUES
    (115, 'Função que cria tabelas', 0);

INSERT INTO
    questao (id, enunciado, pontuacao, id_disciplina)
VALUES
    (
        116,
        'Qual a diferença entre compilador e interpretador?',
        30,
        1
    );

INSERT INTO
    alternativa (id_questao, perguntas, correta)
VALUES
    (
        116,
        'Compilador traduz todo o código antes da execução, interpretador',
        1
    );

INSERT INTO
    alternativa (id_questao, perguntas, correta)
VALUES
    (116, 'Ambos fazem a mesma coisa', 0);

INSERT INTO
    alternativa (id_questao, perguntas, correta)
VALUES
    (116, 'Interpretador é mais rápido', 0);

INSERT INTO
    alternativa (id_questao, perguntas, correta)
VALUES
    (116, 'Compilador não existe', 0);

INSERT INTO
    questao (id, enunciado, pontuacao, id_disciplina)
VALUES
    (
        117,
        'O que é pilha de chamadas (call stack)?',
        30,
        1
    );

INSERT INTO
    alternativa (id_questao, perguntas, correta)
VALUES
    (117, 'Banco de dados', 0);

INSERT INTO
    alternativa (id_questao, perguntas, correta)
VALUES
    (
        117,
        'Estrutura que armazena a sequência de chamadas de funções',
        1
    );

INSERT INTO
    alternativa (id_questao, perguntas, correta)
VALUES
    (117, 'Hardware', 0);

INSERT INTO
    alternativa (id_questao, perguntas, correta)
VALUES
    (117, 'Software', 0);

INSERT INTO
    questao (id, enunciado, pontuacao, id_disciplina)
VALUES
    (118, 'O que é tratamento de exceções?', 30, 1);

INSERT INTO
    alternativa (id_questao, perguntas, correta)
VALUES
    (118, 'Criação de variáveis', 0);

INSERT INTO
    alternativa (id_questao, perguntas, correta)
VALUES
    (118, 'Compilação', 0);

INSERT INTO
    alternativa (id_questao, perguntas, correta)
VALUES
    (
        118,
        'Mecanismo para lidar com erros durante a execução',
        1
    );

INSERT INTO
    alternativa (id_questao, perguntas, correta)
VALUES
    (118, 'Depuração', 0);

INSERT INTO
    questao (id, enunciado, pontuacao, id_disciplina)
VALUES
    (119, 'O que é vetor?', 30, 1);

INSERT INTO
    alternativa (id_questao, perguntas, correta)
VALUES
    (119, 'Estrutura que armazena apenas um valor', 0);

INSERT INTO
    alternativa (id_questao, perguntas, correta)
VALUES
    (119, 'Banco de dados', 0);

INSERT INTO
    alternativa (id_questao, perguntas, correta)
VALUES
    (119, 'Hardware', 0);

INSERT INTO
    alternativa (id_questao, perguntas, correta)
VALUES
    (
        119,
        'Estrutura que armazena vários valores do mesmo tipo em sequência',
        1
    );

INSERT INTO
    questao (id, enunciado, pontuacao, id_disciplina)
VALUES
    (120, 'O que é matriz?', 30, 1);

INSERT INTO
    alternativa (id_questao, perguntas, correta)
VALUES
    (
        120,
        'Estrutura bidimensional que armazena valores em linhas e colunas',
        1
    );

INSERT INTO
    alternativa (id_questao, perguntas, correta)
VALUES
    (120, 'Estrutura unidimensional', 0);

INSERT INTO
    alternativa (id_questao, perguntas, correta)
VALUES
    (120, 'Banco de dados', 0);

INSERT INTO
    alternativa (id_questao, perguntas, correta)
VALUES
    (120, 'Hardware', 0);

INSERT INTO
    questao (id, enunciado, pontuacao, id_disciplina)
VALUES
    (
        121,
        'O que é um requisito funcional em um sistema?',
        10,
        3
    );

INSERT INTO
    alternativa (id_questao, perguntas, correta)
VALUES
    (
        121,
        'Define regras de funcionamento do sistema',
        1
    );

INSERT INTO
    alternativa (id_questao, perguntas, correta)
VALUES
    (121, 'Define o horário da empresa', 0);

INSERT INTO
    alternativa (id_questao, perguntas, correta)
VALUES
    (121, 'Define os custos do projeto', 0);

INSERT INTO
    alternativa (id_questao, perguntas, correta)
VALUES
    (121, 'Define a quantidade de funcionários', 0);

INSERT INTO
    questao (id, enunciado, pontuacao, id_disciplina)
VALUES
    (
        122,
        'Qual metodologia abaixo é considerada ágil?',
        10,
        3
    );

INSERT INTO
    alternativa (id_questao, perguntas, correta)
VALUES
    (122, 'UML', 0);

INSERT INTO
    alternativa (id_questao, perguntas, correta)
VALUES
    (122, 'Scrum', 1);

INSERT INTO
    alternativa (id_questao, perguntas, correta)
VALUES
    (122, 'Ferramenta CASE', 0);

INSERT INTO
    alternativa (id_questao, perguntas, correta)
VALUES
    (122, 'Modelo relacional', 0);

INSERT INTO
    questao (id, enunciado, pontuacao, id_disciplina)
VALUES
    (
        123,
        'Qual ferramenta pode ser usada para organização de tarefas em Kanban?',
        10,
        3
    );

INSERT INTO
    alternativa (id_questao, perguntas, correta)
VALUES
    (123, 'Calculadora', 0);

INSERT INTO
    alternativa (id_questao, perguntas, correta)
VALUES
    (123, 'Word', 0);

INSERT INTO
    alternativa (id_questao, perguntas, correta)
VALUES
    (123, 'Trello', 1);

INSERT INTO
    alternativa (id_questao, perguntas, correta)
VALUES
    (123, 'Paint', 0);

INSERT INTO
    questao (id, enunciado, pontuacao, id_disciplina)
VALUES
    (124, 'Quem remove impedimentos no Scrum?', 10, 3);

INSERT INTO
    alternativa (id_questao, perguntas, correta)
VALUES
    (124, 'Usuário final', 0);

INSERT INTO
    alternativa (id_questao, perguntas, correta)
VALUES
    (124, 'Desenvolvedor', 0);

INSERT INTO
    alternativa (id_questao, perguntas, correta)
VALUES
    (124, 'Product Owner', 0);

INSERT INTO
    alternativa (id_questao, perguntas, correta)
VALUES
    (124, 'Scrum Master', 1);

INSERT INTO
    questao (id, enunciado, pontuacao, id_disciplina)
VALUES
    (
        125,
        'O ciclo de vida de um sistema representa:',
        10,
        3
    );

INSERT INTO
    alternativa (id_questao, perguntas, correta)
VALUES
    (125, 'O valor do software', 0);

INSERT INTO
    alternativa (id_questao, perguntas, correta)
VALUES
    (125, 'O tempo de garantia do computador', 0);

INSERT INTO
    alternativa (id_questao, perguntas, correta)
VALUES
    (
        125,
        'As etapas de desenvolvimento do sistema',
        1
    );

INSERT INTO
    alternativa (id_questao, perguntas, correta)
VALUES
    (125, 'O número de usuários', 0);

INSERT INTO
    questao (id, enunciado, pontuacao, id_disciplina)
VALUES
    (
        126,
        'Qual alternativa apresenta apenas tipos de requisitos?',
        20,
        3
    );

INSERT INTO
    alternativa (id_questao, perguntas, correta)
VALUES
    (126, 'Scrum, Kanban e UML', 0);

INSERT INTO
    alternativa (id_questao, perguntas, correta)
VALUES
    (
        126,
        'Funcionais, não funcionais e regras de negócio',
        1
    );

INSERT INTO
    alternativa (id_questao, perguntas, correta)
VALUES
    (126, 'Sprint, backlog e incremento', 0);

INSERT INTO
    alternativa (id_questao, perguntas, correta)
VALUES
    (126, 'Cascata, Scrum e XP', 0);

INSERT INTO
    questao (id, enunciado, pontuacao, id_disciplina)
VALUES
    (127, 'O Backlog do Produto no Scrum é:', 20, 3);

INSERT INTO
    alternativa (id_questao, perguntas, correta)
VALUES
    (
        127,
        'Uma lista de funcionalidades do produto',
        1
    );

INSERT INTO
    alternativa (id_questao, perguntas, correta)
VALUES
    (127, 'Um relatório financeiro', 0);

INSERT INTO
    alternativa (id_questao, perguntas, correta)
VALUES
    (127, 'Um diagrama UML', 0);

INSERT INTO
    alternativa (id_questao, perguntas, correta)
VALUES
    (127, 'Uma linguagem de programação', 0);

INSERT INTO
    questao (id, enunciado, pontuacao, id_disciplina)
VALUES
    (128, 'A UML é utilizada para:', 20, 3);

INSERT INTO
    alternativa (id_questao, perguntas, correta)
VALUES
    (128, 'Criar jogos', 0);

INSERT INTO
    alternativa (id_questao, perguntas, correta)
VALUES
    (128, 'Desenvolver bancos físicos', 0);

INSERT INTO
    alternativa (id_questao, perguntas, correta)
VALUES
    (128, 'Modelar sistemas orientados a objetos', 1);

INSERT INTO
    alternativa (id_questao, perguntas, correta)
VALUES
    (128, 'Fazer manutenção de computadores', 0);

INSERT INTO
    questao (id, enunciado, pontuacao, id_disciplina)
VALUES
    (
        129,
        'O principal objetivo do Design Sprint é:',
        20,
        3
    );

INSERT INTO
    alternativa (id_questao, perguntas, correta)
VALUES
    (129, 'Formatar computadores', 0);

INSERT INTO
    alternativa (id_questao, perguntas, correta)
VALUES
    (129, 'Criar planilhas financeiras', 0);

INSERT INTO
    alternativa (id_questao, perguntas, correta)
VALUES
    (129, 'Trocar ferramentas CASE', 0);

INSERT INTO
    alternativa (id_questao, perguntas, correta)
VALUES
    (129, 'Testar rapidamente ideias e soluções', 1);

INSERT INTO
    questao (id, enunciado, pontuacao, id_disciplina)
VALUES
    (
        130,
        'Uma característica do modelo em cascata é:',
        20,
        3
    );

INSERT INTO
    alternativa (id_questao, perguntas, correta)
VALUES
    (130, 'Desenvolvimento sem etapas', 0);

INSERT INTO
    alternativa (id_questao, perguntas, correta)
VALUES
    (130, 'Ausência de documentação', 0);

INSERT INTO
    alternativa (id_questao, perguntas, correta)
VALUES
    (130, 'Etapas realizadas de forma sequencial', 1);

INSERT INTO
    alternativa (id_questao, perguntas, correta)
VALUES
    (130, 'Entregas diárias obrigatórias', 0);

INSERT INTO
    questao (id, enunciado, pontuacao, id_disciplina)
VALUES
    (
        131,
        'Qual evento do Scrum é destinado à avaliação do trabalho concluído ao final da Sprint?',
        30,
        3
    );

INSERT INTO
    alternativa (id_questao, perguntas, correta)
VALUES
    (131, 'Revisão da Sprint', 1);

INSERT INTO
    alternativa (id_questao, perguntas, correta)
VALUES
    (131, 'Reunião diária', 0);

INSERT INTO
    alternativa (id_questao, perguntas, correta)
VALUES
    (131, 'Planejamento da Sprint', 0);

INSERT INTO
    alternativa (id_questao, perguntas, correta)
VALUES
    (131, 'Retrospectiva da Sprint', 0);

INSERT INTO
    questao (id, enunciado, pontuacao, id_disciplina)
VALUES
    (
        132,
        'Ferramentas CASE possuem como principal objetivo:',
        30,
        3
    );

INSERT INTO
    alternativa (id_questao, perguntas, correta)
VALUES
    (132, 'Controlar redes de internet', 0);

INSERT INTO
    alternativa (id_questao, perguntas, correta)
VALUES
    (
        132,
        'Auxiliar na análise e desenvolvimento de sistemas',
        1
    );

INSERT INTO
    alternativa (id_questao, perguntas, correta)
VALUES
    (
        132,
        'Fazer manutenção física de computadores',
        0
    );

INSERT INTO
    alternativa (id_questao, perguntas, correta)
VALUES
    (132, 'Substituir programadores', 0);

INSERT INTO
    questao (id, enunciado, pontuacao, id_disciplina)
VALUES
    (
        133,
        'Qual princípio do Manifesto Ágil valoriza mais as pessoas?',
        30,
        3
    );

INSERT INTO
    alternativa (id_questao, perguntas, correta)
VALUES
    (133, 'Processos acima de indivíduos', 0);

INSERT INTO
    alternativa (id_questao, perguntas, correta)
VALUES
    (133, 'Contratos acima da colaboração', 0);

INSERT INTO
    alternativa (id_questao, perguntas, correta)
VALUES
    (
        133,
        'Indivíduos e interações acima de processos e ferramentas',
        1
    );

INSERT INTO
    alternativa (id_questao, perguntas, correta)
VALUES
    (
        133,
        'Documentação acima de software funcionando',
        0
    );

INSERT INTO
    questao (id, enunciado, pontuacao, id_disciplina)
VALUES
    (134, 'No Kanban, o principal objetivo é:', 30, 3);

INSERT INTO
    alternativa (id_questao, perguntas, correta)
VALUES
    (134, 'Criar bancos de dados', 0);

INSERT INTO
    alternativa (id_questao, perguntas, correta)
VALUES
    (134, 'Eliminar programadores', 0);

INSERT INTO
    alternativa (id_questao, perguntas, correta)
VALUES
    (134, 'Substituir o Scrum', 0);

INSERT INTO
    alternativa (id_questao, perguntas, correta)
VALUES
    (
        134,
        'Visualizar e controlar o fluxo de trabalho',
        1
    );

INSERT INTO
    questao (id, enunciado, pontuacao, id_disciplina)
VALUES
    (135, 'O Product Owner é responsável por:', 30, 3);

INSERT INTO
    alternativa (id_questao, perguntas, correta)
VALUES
    (135, 'Configurar computadores', 0);

INSERT INTO
    alternativa (id_questao, perguntas, correta)
VALUES
    (
        135,
        'Gerenciar e priorizar o Backlog do Produto',
        1
    );

INSERT INTO
    alternativa (id_questao, perguntas, correta)
VALUES
    (135, 'Fazer manutenção da rede', 0);

INSERT INTO
    alternativa (id_questao, perguntas, correta)
VALUES
    (135, 'Desenvolver sozinho o sistema', 0);

INSERT INTO
    questao (id, enunciado, pontuacao, id_disciplina)
VALUES
    (
        136,
        'O que é um objeto na programação orientada a objetos?',
        10,
        8
    );

INSERT INTO
    alternativa (id_questao, perguntas, correta)
VALUES
    (136, 'Um tipo de banco de dados', 0);

INSERT INTO
    alternativa (id_questao, perguntas, correta)
VALUES
    (136, 'Uma instância de uma classe', 1);

INSERT INTO
    alternativa (id_questao, perguntas, correta)
VALUES
    (136, 'Um sistema operacional', 0);

INSERT INTO
    alternativa (id_questao, perguntas, correta)
VALUES
    (136, 'Um compilador', 0);

INSERT INTO
    questao (id, enunciado, pontuacao, id_disciplina)
VALUES
    (
        137,
        'Qual elemento é utilizado para armazenar características de um objeto?',
        10,
        8
    );

INSERT INTO
    alternativa (id_questao, perguntas, correta)
VALUES
    (137, 'Método', 0);

INSERT INTO
    alternativa (id_questao, perguntas, correta)
VALUES
    (137, 'Interface', 0);

INSERT INTO
    alternativa (id_questao, perguntas, correta)
VALUES
    (137, 'Atributo', 1);

INSERT INTO
    alternativa (id_questao, perguntas, correta)
VALUES
    (137, 'Namespace', 0);

INSERT INTO
    questao (id, enunciado, pontuacao, id_disciplina)
VALUES
    (138, 'O padrão MVC é utilizado para:', 10, 8);

INSERT INTO
    alternativa (id_questao, perguntas, correta)
VALUES
    (138, 'Organizar a estrutura do sistema', 1);

INSERT INTO
    alternativa (id_questao, perguntas, correta)
VALUES
    (138, 'Criar redes de computadores', 0);

INSERT INTO
    alternativa (id_questao, perguntas, correta)
VALUES
    (138, 'Desenvolver hardware', 0);

INSERT INTO
    alternativa (id_questao, perguntas, correta)
VALUES
    (138, 'Fazer manutenção física', 0);

INSERT INTO
    questao (id, enunciado, pontuacao, id_disciplina)
VALUES
    (
        139,
        'Qual operação CRUD é responsável por excluir dados?',
        10,
        8
    );

INSERT INTO
    alternativa (id_questao, perguntas, correta)
VALUES
    (139, 'Create', 0);

INSERT INTO
    alternativa (id_questao, perguntas, correta)
VALUES
    (139, 'Read', 0);

INSERT INTO
    alternativa (id_questao, perguntas, correta)
VALUES
    (139, 'Update', 0);

INSERT INTO
    alternativa (id_questao, perguntas, correta)
VALUES
    (139, 'Delete', 1);

INSERT INTO
    questao (id, enunciado, pontuacao, id_disciplina)
VALUES
    (
        140,
        'Qual componente gráfico permite selecionar apenas uma opção entre várias?',
        10,
        8
    );

INSERT INTO
    alternativa (id_questao, perguntas, correta)
VALUES
    (140, 'Caixa de texto', 0);

INSERT INTO
    alternativa (id_questao, perguntas, correta)
VALUES
    (140, 'Painel', 0);

INSERT INTO
    alternativa (id_questao, perguntas, correta)
VALUES
    (140, 'Botão de rádio', 1);

INSERT INTO
    alternativa (id_questao, perguntas, correta)
VALUES
    (140, 'Aba', 0);

INSERT INTO
    questao (id, enunciado, pontuacao, id_disciplina)
VALUES
    (
        141,
        'O encapsulamento na programação orientada a objetos serve para:',
        20,
        8
    );

INSERT INTO
    alternativa (id_questao, perguntas, correta)
VALUES
    (141, 'Aumentar o tamanho do programa', 0);

INSERT INTO
    alternativa (id_questao, perguntas, correta)
VALUES
    (
        141,
        'Proteger e controlar o acesso aos dados',
        1
    );

INSERT INTO
    alternativa (id_questao, perguntas, correta)
VALUES
    (141, 'Excluir métodos automaticamente', 0);

INSERT INTO
    alternativa (id_questao, perguntas, correta)
VALUES
    (141, 'Criar bancos de dados relacionais', 0);

INSERT INTO
    questao (id, enunciado, pontuacao, id_disciplina)
VALUES
    (142, 'A herança permite que uma classe:', 20, 8);

INSERT INTO
    alternativa (id_questao, perguntas, correta)
VALUES
    (
        142,
        'Utilize características de outra classe',
        1
    );

INSERT INTO
    alternativa (id_questao, perguntas, correta)
VALUES
    (142, 'Apague atributos automaticamente', 0);

INSERT INTO
    alternativa (id_questao, perguntas, correta)
VALUES
    (142, 'Crie apenas interfaces gráficas', 0);

INSERT INTO
    alternativa (id_questao, perguntas, correta)
VALUES
    (142, 'Trabalhe sem métodos', 0);

INSERT INTO
    questao (id, enunciado, pontuacao, id_disciplina)
VALUES
    (143, 'O DAO é um padrão utilizado para:', 20, 8);

INSERT INTO
    alternativa (id_questao, perguntas, correta)
VALUES
    (143, 'Criar formulários gráficos', 0);

INSERT INTO
    alternativa (id_questao, perguntas, correta)
VALUES
    (143, 'Gerenciar acesso aos dados do banco', 1);

INSERT INTO
    alternativa (id_questao, perguntas, correta)
VALUES
    (143, 'Desenvolver jogos', 0);

INSERT INTO
    alternativa (id_questao, perguntas, correta)
VALUES
    (143, 'Fazer conexões de internet', 0);

INSERT INTO
    questao (id, enunciado, pontuacao, id_disciplina)
VALUES
    (
        144,
        'Consultas parametrizadas ajudam principalmente na:',
        20,
        8
    );

INSERT INTO
    alternativa (id_questao, perguntas, correta)
VALUES
    (144, 'Criação automática de tabelas', 0);

INSERT INTO
    alternativa (id_questao, perguntas, correta)
VALUES
    (144, 'Organização de pastas', 0);

INSERT INTO
    alternativa (id_questao, perguntas, correta)
VALUES
    (144, 'Prevenção de SQL Injection', 1);

INSERT INTO
    alternativa (id_questao, perguntas, correta)
VALUES
    (144, 'Criação de botões gráficos', 0);

INSERT INTO
    questao (id, enunciado, pontuacao, id_disciplina)
VALUES
    (145, 'O polimorfismo permite que:', 20, 8);

INSERT INTO
    alternativa (id_questao, perguntas, correta)
VALUES
    (
        145,
        'Um método tenha diferentes comportamentos',
        1
    );

INSERT INTO
    alternativa (id_questao, perguntas, correta)
VALUES
    (145, 'Um banco de dados seja excluído', 0);

INSERT INTO
    alternativa (id_questao, perguntas, correta)
VALUES
    (145, 'Um formulário fique invisível', 0);

INSERT INTO
    alternativa (id_questao, perguntas, correta)
VALUES
    (145, 'Um sistema funcione sem classes', 0);

INSERT INTO
    questao (id, enunciado, pontuacao, id_disciplina)
VALUES
    (
        146,
        'A sobrecarga de métodos ocorre quando:',
        30,
        8
    );

INSERT INTO
    alternativa (id_questao, perguntas, correta)
VALUES
    (146, 'Um método é apagado automaticamente', 0);

INSERT INTO
    alternativa (id_questao, perguntas, correta)
VALUES
    (
        146,
        'Dois métodos possuem o mesmo nome com parâmetros diferentes',
        1
    );

INSERT INTO
    alternativa (id_questao, perguntas, correta)
VALUES
    (146, 'Uma classe não possui atributos', 0);

INSERT INTO
    alternativa (id_questao, perguntas, correta)
VALUES
    (
        146,
        'O sistema utiliza mais de um banco de dados',
        0
    );

INSERT INTO
    questao (id, enunciado, pontuacao, id_disciplina)
VALUES
    (
        147,
        'Classes abstratas possuem como característica principal:',
        30,
        8
    );

INSERT INTO
    alternativa (id_questao, perguntas, correta)
VALUES
    (147, 'Não poderem ser herdadas', 0);

INSERT INTO
    alternativa (id_questao, perguntas, correta)
VALUES
    (147, 'Não utilizarem métodos', 0);

INSERT INTO
    alternativa (id_questao, perguntas, correta)
VALUES
    (
        147,
        'Servirem como modelo para outras classes',
        1
    );

INSERT INTO
    alternativa (id_questao, perguntas, correta)
VALUES
    (
        147,
        'Funcionarem apenas em interfaces gráficas',
        0
    );

INSERT INTO
    questao (id, enunciado, pontuacao, id_disciplina)
VALUES
    (
        148,
        'Qual alternativa representa corretamente uma vantagem do padrão MVC?',
        30,
        8
    );

INSERT INTO
    alternativa (id_questao, perguntas, correta)
VALUES
    (
        148,
        'Misturar interface e banco de dados no mesmo código',
        0
    );

INSERT INTO
    alternativa (id_questao, perguntas, correta)
VALUES
    (148, 'Eliminar o uso de classes', 0);

INSERT INTO
    alternativa (id_questao, perguntas, correta)
VALUES
    (148, 'Impedir reutilização de código', 0);

INSERT INTO
    alternativa (id_questao, perguntas, correta)
VALUES
    (148, 'Separar responsabilidades da aplicação', 1);

INSERT INTO
    questao (id, enunciado, pontuacao, id_disciplina)
VALUES
    (149, 'Namespaces são utilizados para:', 30, 8);

INSERT INTO
    alternativa (id_questao, perguntas, correta)
VALUES
    (
        149,
        'Organizar classes e evitar conflitos de nomes',
        1
    );

INSERT INTO
    alternativa (id_questao, perguntas, correta)
VALUES
    (149, 'Criar botões automaticamente', 0);

INSERT INTO
    alternativa (id_questao, perguntas, correta)
VALUES
    (149, 'Substituir bancos de dados', 0);

INSERT INTO
    alternativa (id_questao, perguntas, correta)
VALUES
    (149, 'Excluir métodos duplicados', 0);

INSERT INTO
    questao (id, enunciado, pontuacao, id_disciplina)
VALUES
    (
        150,
        'A sobrescrita de métodos acontece quando:',
        30,
        8
    );

INSERT INTO
    alternativa (id_questao, perguntas, correta)
VALUES
    (
        150,
        'Um método da classe filha redefine o método da classe pai',
        1
    );

INSERT INTO
    alternativa (id_questao, perguntas, correta)
VALUES
    (150, 'Um método é executado duas vezes', 0);

INSERT INTO
    alternativa (id_questao, perguntas, correta)
VALUES
    (150, 'Uma interface gráfica é recriada', 0);

INSERT INTO
    alternativa (id_questao, perguntas, correta)
VALUES
    (150, 'Um atributo é removido da memória', 0);

INSERT INTO
    questao (id, enunciado, pontuacao, id_disciplina)
VALUES
    (151, 'O principal objetivo do TCC é:', 10, 8);

INSERT INTO
    alternativa (id_questao, perguntas, correta)
VALUES
    (
        151,
        'Desenvolver e planejar um projeto na área profissional',
        1
    );

INSERT INTO
    alternativa (id_questao, perguntas, correta)
VALUES
    (151, 'Apenas estudar matemática', 0);

INSERT INTO
    alternativa (id_questao, perguntas, correta)
VALUES
    (151, 'Fazer manutenção de computadores', 0);

INSERT INTO
    alternativa (id_questao, perguntas, correta)
VALUES
    (151, 'Criar redes de internet', 0);

INSERT INTO
    questao (id, enunciado, pontuacao, id_disciplina)
VALUES
    (
        152,
        'Qual item pode ser considerado uma técnica de pesquisa?',
        10,
        8
    );

INSERT INTO
    alternativa (id_questao, perguntas, correta)
VALUES
    (152, 'Questionário', 1);

INSERT INTO
    alternativa (id_questao, perguntas, correta)
VALUES
    (152, 'Compilador', 0);

INSERT INTO
    alternativa (id_questao, perguntas, correta)
VALUES
    (152, 'Firewall', 0);

INSERT INTO
    alternativa (id_questao, perguntas, correta)
VALUES
    (152, 'Driver', 0);

INSERT INTO
    questao (id, enunciado, pontuacao, id_disciplina)
VALUES
    (
        153,
        'O cronograma de trabalho serve para:',
        10,
        8
    );

INSERT INTO
    alternativa (id_questao, perguntas, correta)
VALUES
    (
        153,
        'Organizar as etapas e prazos do projeto',
        1
    );

INSERT INTO
    alternativa (id_questao, perguntas, correta)
VALUES
    (153, 'Excluir informações do projeto', 0);

INSERT INTO
    alternativa (id_questao, perguntas, correta)
VALUES
    (153, 'Criar bancos de dados', 0);

INSERT INTO
    alternativa (id_questao, perguntas, correta)
VALUES
    (153, 'Desenvolver hardware', 0);

INSERT INTO
    questao (id, enunciado, pontuacao, id_disciplina)
VALUES
    (
        154,
        'A justificativa em um projeto responde principalmente à pergunta:',
        10,
        8
    );

INSERT INTO
    alternativa (id_questao, perguntas, correta)
VALUES
    (154, 'Quem?', 0);

INSERT INTO
    alternativa (id_questao, perguntas, correta)
VALUES
    (154, 'Onde?', 0);

INSERT INTO
    alternativa (id_questao, perguntas, correta)
VALUES
    (154, 'Por quê?', 1);

INSERT INTO
    alternativa (id_questao, perguntas, correta)
VALUES
    (154, 'Quando?', 0);

INSERT INTO
    questao (id, enunciado, pontuacao, id_disciplina)
VALUES
    (
        155,
        'Qual documento pode ser utilizado na pesquisa de campo?',
        10,
        8
    );

INSERT INTO
    alternativa (id_questao, perguntas, correta)
VALUES
    (155, 'Questionário', 1);

INSERT INTO
    alternativa (id_questao, perguntas, correta)
VALUES
    (155, 'Antivírus', 0);

INSERT INTO
    alternativa (id_questao, perguntas, correta)
VALUES
    (155, 'Linguagem de programação', 0);

INSERT INTO
    alternativa (id_questao, perguntas, correta)
VALUES
    (155, 'Sistema operacional', 0);

INSERT INTO
    questao (id, enunciado, pontuacao, id_disciplina)
VALUES
    (
        156,
        'A pesquisa bibliográfica é classificada como:',
        20,
        8
    );

INSERT INTO
    alternativa (id_questao, perguntas, correta)
VALUES
    (156, 'Documentação indireta', 1);

INSERT INTO
    alternativa (id_questao, perguntas, correta)
VALUES
    (156, 'Pesquisa prática', 0);

INSERT INTO
    alternativa (id_questao, perguntas, correta)
VALUES
    (156, 'Desenvolvimento mobile', 0);

INSERT INTO
    alternativa (id_questao, perguntas, correta)
VALUES
    (156, 'Programação orientada a objetos', 0);

INSERT INTO
    questao (id, enunciado, pontuacao, id_disciplina)
VALUES
    (
        157,
        'Um dos critérios para escolha do tema do TCC é:',
        20,
        8
    );

INSERT INTO
    alternativa (id_questao, perguntas, correta)
VALUES
    (157, 'Popularidade em redes sociais', 0);

INSERT INTO
    alternativa (id_questao, perguntas, correta)
VALUES
    (157, 'Viabilidade', 1);

INSERT INTO
    alternativa (id_questao, perguntas, correta)
VALUES
    (157, 'Quantidade de computadores disponíveis', 0);

INSERT INTO
    alternativa (id_questao, perguntas, correta)
VALUES
    (157, 'Tipo de internet utilizada', 0);

INSERT INTO
    questao (id, enunciado, pontuacao, id_disciplina)
VALUES
    (
        158,
        'O objetivo geral de um projeto define:',
        20,
        8
    );

INSERT INTO
    alternativa (id_questao, perguntas, correta)
VALUES
    (158, 'O custo do sistema', 0);

INSERT INTO
    alternativa (id_questao, perguntas, correta)
VALUES
    (
        158,
        'As linguagens de programação utilizadas',
        0
    );

INSERT INTO
    alternativa (id_questao, perguntas, correta)
VALUES
    (
        158,
        'O que se pretende alcançar com o trabalho',
        1
    );

INSERT INTO
    alternativa (id_questao, perguntas, correta)
VALUES
    (158, 'Apenas o cronograma do projeto', 0);

INSERT INTO
    questao (id, enunciado, pontuacao, id_disciplina)
VALUES
    (
        159,
        'A problematização em um TCC está relacionada com:',
        20,
        8
    );

INSERT INTO
    alternativa (id_questao, perguntas, correta)
VALUES
    (159, 'A definição do problema a ser estudado', 1);

INSERT INTO
    alternativa (id_questao, perguntas, correta)
VALUES
    (159, 'A criação de jogos eletrônicos', 0);

INSERT INTO
    alternativa (id_questao, perguntas, correta)
VALUES
    (159, 'A manutenção de hardware', 0);

INSERT INTO
    alternativa (id_questao, perguntas, correta)
VALUES
    (159, 'A exclusão de hipóteses', 0);

INSERT INTO
    questao (id, enunciado, pontuacao, id_disciplina)
VALUES
    (160, 'O fichamento é utilizado para:', 20, 8);

INSERT INTO
    alternativa (id_questao, perguntas, correta)
VALUES
    (160, 'Formatar computadores', 0);

INSERT INTO
    alternativa (id_questao, perguntas, correta)
VALUES
    (
        160,
        'Organizar informações de pesquisas e obras',
        1
    );

INSERT INTO
    alternativa (id_questao, perguntas, correta)
VALUES
    (160, 'Criar aplicativos mobile', 0);

INSERT INTO
    alternativa (id_questao, perguntas, correta)
VALUES
    (160, 'Excluir documentos do projeto', 0);

INSERT INTO
    questao (id, enunciado, pontuacao, id_disciplina)
VALUES
    (
        161,
        'A construção de hipóteses em um projeto tem como finalidade:',
        30,
        8
    );

INSERT INTO
    alternativa (id_questao, perguntas, correta)
VALUES
    (
        161,
        'Definir possíveis respostas para o problema estudado',
        1
    );

INSERT INTO
    alternativa (id_questao, perguntas, correta)
VALUES
    (161, 'Excluir dados da pesquisa', 0);

INSERT INTO
    alternativa (id_questao, perguntas, correta)
VALUES
    (161, 'Criar bancos de dados automáticos', 0);

INSERT INTO
    alternativa (id_questao, perguntas, correta)
VALUES
    (161, 'Impedir entrevistas de campo', 0);

INSERT INTO
    questao (id, enunciado, pontuacao, id_disciplina)
VALUES
    (
        162,
        'A identificação de lacunas no setor profissional significa:',
        30,
        8
    );

INSERT INTO
    alternativa (id_questao, perguntas, correta)
VALUES
    (
        162,
        'Encontrar demandas não atendidas plenamente',
        1
    );

INSERT INTO
    alternativa (id_questao, perguntas, correta)
VALUES
    (162, 'Desenvolver apenas sistemas antigos', 0);

INSERT INTO
    alternativa (id_questao, perguntas, correta)
VALUES
    (162, 'Eliminar novas tecnologias', 0);

INSERT INTO
    alternativa (id_questao, perguntas, correta)
VALUES
    (162, 'Substituir pesquisas bibliográficas', 0);

INSERT INTO
    questao (id, enunciado, pontuacao, id_disciplina)
VALUES
    (
        163,
        'A análise de pertinência, relevância e viabilidade é utilizada para:',
        30,
        8
    );

INSERT INTO
    alternativa (id_questao, perguntas, correta)
VALUES
    (163, 'Escolher o tema do TCC', 1);

INSERT INTO
    alternativa (id_questao, perguntas, correta)
VALUES
    (163, 'Criar linguagens de programação', 0);

INSERT INTO
    alternativa (id_questao, perguntas, correta)
VALUES
    (163, 'Desenvolver peças de hardware', 0);

INSERT INTO
    alternativa (id_questao, perguntas, correta)
VALUES
    (163, 'Organizar servidores de rede', 0);

INSERT INTO
    questao (id, enunciado, pontuacao, id_disciplina)
VALUES
    (
        164,
        'Qual alternativa representa um exemplo de documentação direta?',
        30,
        8
    );

INSERT INTO
    alternativa (id_questao, perguntas, correta)
VALUES
    (164, 'Pesquisa bibliográfica', 0);

INSERT INTO
    alternativa (id_questao, perguntas, correta)
VALUES
    (164, 'Pesquisa documental', 0);

INSERT INTO
    alternativa (id_questao, perguntas, correta)
VALUES
    (164, 'Entrevista', 1);

INSERT INTO
    alternativa (id_questao, perguntas, correta)
VALUES
    (164, 'Fichamento técnico', 0);

INSERT INTO
    questao (id, enunciado, pontuacao, id_disciplina)
VALUES
    (
        165,
        'A relação entre TCC e empreendedorismo é importante porque:',
        30,
        8
    );

INSERT INTO
    alternativa (id_questao, perguntas, correta)
VALUES
    (
        165,
        'Permite desenvolver soluções e modelos de negócio inovadores',
        1
    );

INSERT INTO
    alternativa (id_questao, perguntas, correta)
VALUES
    (165, 'Elimina a necessidade de planejamento', 0);

INSERT INTO
    alternativa (id_questao, perguntas, correta)
VALUES
    (165, 'Substitui a pesquisa científica', 0);

INSERT INTO
    alternativa (id_questao, perguntas, correta)
VALUES
    (165, 'Impede a criação de softwares', 0);

INSERT INTO
    questao (id, enunciado, pontuacao, id_disciplina)
VALUES
    (
        166,
        'O que é um cronograma de atividades?',
        10,
        8
    );

INSERT INTO
    alternativa (id_questao, perguntas, correta)
VALUES
    (166, 'Sistema operacional de computadores', 0);

INSERT INTO
    alternativa (id_questao, perguntas, correta)
VALUES
    (
        166,
        'Planejamento das tarefas e prazos de um projeto',
        1
    );

INSERT INTO
    alternativa (id_questao, perguntas, correta)
VALUES
    (166, 'Banco de dados relacional', 0);

INSERT INTO
    alternativa (id_questao, perguntas, correta)
VALUES
    (166, 'Linguagem de programação', 0);

INSERT INTO
    questao (id, enunciado, pontuacao, id_disciplina)
VALUES
    (
        167,
        'Qual é a função de um relatório técnico?',
        10,
        8
    );

INSERT INTO
    alternativa (id_questao, perguntas, correta)
VALUES
    (167, 'Criar aplicativos mobile', 0);

INSERT INTO
    alternativa (id_questao, perguntas, correta)
VALUES
    (167, 'Configurar redes de computadores', 0);

INSERT INTO
    alternativa (id_questao, perguntas, correta)
VALUES
    (
        167,
        'Registrar informações e resultados de um projeto',
        1
    );

INSERT INTO
    alternativa (id_questao, perguntas, correta)
VALUES
    (167, 'Editar imagens digitais', 0);

INSERT INTO
    questao (id, enunciado, pontuacao, id_disciplina)
VALUES
    (168, 'O que é um fluxograma?', 10, 8);

INSERT INTO
    alternativa (id_questao, perguntas, correta)
VALUES
    (168, 'Programa de edição de textos', 0);

INSERT INTO
    alternativa (id_questao, perguntas, correta)
VALUES
    (168, 'Banco de dados em nuvem', 0);

INSERT INTO
    alternativa (id_questao, perguntas, correta)
VALUES
    (168, 'Sistema de autenticação', 0);

INSERT INTO
    alternativa (id_questao, perguntas, correta)
VALUES
    (
        168,
        'Representação gráfica de etapas de um processo',
        1
    );

INSERT INTO
    questao (id, enunciado, pontuacao, id_disciplina)
VALUES
    (
        169,
        'O referencial teórico de uma pesquisa é formado por:',
        10,
        8
    );

INSERT INTO
    alternativa (id_questao, perguntas, correta)
VALUES
    (
        169,
        'Fontes e estudos utilizados como base do trabalho',
        1
    );

INSERT INTO
    alternativa (id_questao, perguntas, correta)
VALUES
    (169, 'Equipamentos de hardware', 0);

INSERT INTO
    alternativa (id_questao, perguntas, correta)
VALUES
    (169, 'Configurações de rede', 0);

INSERT INTO
    alternativa (id_questao, perguntas, correta)
VALUES
    (169, 'Arquivos de instalação', 0);

INSERT INTO
    questao (id, enunciado, pontuacao, id_disciplina)
VALUES
    (
        170,
        'O que significa metodologia em um projeto?',
        10,
        8
    );

INSERT INTO
    alternativa (id_questao, perguntas, correta)
VALUES
    (170, 'Tipo de linguagem de programação', 0);

INSERT INTO
    alternativa (id_questao, perguntas, correta)
VALUES
    (
        170,
        'Conjunto de métodos e procedimentos utilizados',
        1
    );

INSERT INTO
    alternativa (id_questao, perguntas, correta)
VALUES
    (170, 'Sistema de armazenamento físico', 0);

INSERT INTO
    alternativa (id_questao, perguntas, correta)
VALUES
    (170, 'Estrutura de redes sociais', 0);

INSERT INTO
    questao (id, enunciado, pontuacao, id_disciplina)
VALUES
    (171, 'A tabulação de dados consiste em:', 20, 8);

INSERT INTO
    alternativa (id_questao, perguntas, correta)
VALUES
    (
        171,
        'Organizar informações coletadas em tabelas ou gráficos',
        1
    );

INSERT INTO
    alternativa (id_questao, perguntas, correta)
VALUES
    (171, 'Criar sistemas operacionais', 0);

INSERT INTO
    alternativa (id_questao, perguntas, correta)
VALUES
    (171, 'Desenvolver hardware', 0);

INSERT INTO
    alternativa (id_questao, perguntas, correta)
VALUES
    (171, 'Configurar impressoras', 0);

INSERT INTO
    questao (id, enunciado, pontuacao, id_disciplina)
VALUES
    (172, 'O objetivo da análise de dados é:', 20, 8);

INSERT INTO
    alternativa (id_questao, perguntas, correta)
VALUES
    (172, 'Criar bancos de dados físicos', 0);

INSERT INTO
    alternativa (id_questao, perguntas, correta)
VALUES
    (172, 'Melhorar velocidade da internet', 0);

INSERT INTO
    alternativa (id_questao, perguntas, correta)
VALUES
    (
        172,
        'Interpretar e explicar informações obtidas na pesquisa',
        1
    );

INSERT INTO
    alternativa (id_questao, perguntas, correta)
VALUES
    (172, 'Desenvolver jogos digitais', 0);

INSERT INTO
    questao (id, enunciado, pontuacao, id_disciplina)
VALUES
    (
        173,
        'O dimensionamento de recursos serve para:',
        20,
        8
    );

INSERT INTO
    alternativa (id_questao, perguntas, correta)
VALUES
    (173, 'Configurar sistemas embarcados', 0);

INSERT INTO
    alternativa (id_questao, perguntas, correta)
VALUES
    (173, 'Criar layouts de sites', 0);

INSERT INTO
    alternativa (id_questao, perguntas, correta)
VALUES
    (173, 'Editar vídeos digitais', 0);

INSERT INTO
    alternativa (id_questao, perguntas, correta)
VALUES
    (
        173,
        'Definir materiais, custos e necessidades do projeto',
        1
    );

INSERT INTO
    questao (id, enunciado, pontuacao, id_disciplina)
VALUES
    (
        174,
        'Qual é a finalidade de um gráfico em relatórios?',
        20,
        8
    );

INSERT INTO
    alternativa (id_questao, perguntas, correta)
VALUES
    (
        174,
        'Facilitar a visualização e interpretação de dados',
        1
    );

INSERT INTO
    alternativa (id_questao, perguntas, correta)
VALUES
    (174, 'Criar autenticação de usuários', 0);

INSERT INTO
    alternativa (id_questao, perguntas, correta)
VALUES
    (174, 'Configurar servidores HTTP', 0);

INSERT INTO
    alternativa (id_questao, perguntas, correta)
VALUES
    (174, 'Desenvolver drivers de hardware', 0);

INSERT INTO
    questao (id, enunciado, pontuacao, id_disciplina)
VALUES
    (
        175,
        'Sistemas de gerenciamento de projetos ajudam a:',
        20,
        8
    );

INSERT INTO
    alternativa (id_questao, perguntas, correta)
VALUES
    (175, 'Criar componentes eletrônicos', 0);

INSERT INTO
    alternativa (id_questao, perguntas, correta)
VALUES
    (175, 'Organizar tarefas, equipes e prazos', 1);

INSERT INTO
    alternativa (id_questao, perguntas, correta)
VALUES
    (175, 'Desenvolver processadores', 0);

INSERT INTO
    alternativa (id_questao, perguntas, correta)
VALUES
    (175, 'Configurar roteadores físicos', 0);

INSERT INTO
    questao (id, enunciado, pontuacao, id_disciplina)
VALUES
    (
        176,
        'A formatação de trabalhos acadêmicos é importante para:',
        30,
        8
    );

INSERT INTO
    alternativa (id_questao, perguntas, correta)
VALUES
    (
        176,
        'Padronizar a apresentação e organização do conteúdo',
        1
    );

INSERT INTO
    alternativa (id_questao, perguntas, correta)
VALUES
    (176, 'Melhorar desempenho do hardware', 0);

INSERT INTO
    alternativa (id_questao, perguntas, correta)
VALUES
    (176, 'Configurar aplicativos mobile', 0);

INSERT INTO
    alternativa (id_questao, perguntas, correta)
VALUES
    (176, 'Criar bancos NoSQL', 0);

INSERT INTO
    questao (id, enunciado, pontuacao, id_disciplina)
VALUES
    (
        177,
        'O processo de codificação de dados em pesquisas consiste em:',
        30,
        8
    );

INSERT INTO
    alternativa (id_questao, perguntas, correta)
VALUES
    (177, 'Desenvolver sistemas operacionais', 0);

INSERT INTO
    alternativa (id_questao, perguntas, correta)
VALUES
    (
        177,
        'Classificar e organizar informações coletadas',
        1
    );

INSERT INTO
    alternativa (id_questao, perguntas, correta)
VALUES
    (177, 'Configurar sensores digitais', 0);

INSERT INTO
    alternativa (id_questao, perguntas, correta)
VALUES
    (177, 'Criar efeitos visuais em apresentações', 0);

INSERT INTO
    questao (id, enunciado, pontuacao, id_disciplina)
VALUES
    (
        178,
        'O empreendedorismo em projetos de tecnologia envolve:',
        30,
        8
    );

INSERT INTO
    alternativa (id_questao, perguntas, correta)
VALUES
    (178, 'Exclusivamente manutenção de hardware', 0);

INSERT INTO
    alternativa (id_questao, perguntas, correta)
VALUES
    (178, 'Apenas edição de documentos', 0);

INSERT INTO
    alternativa (id_questao, perguntas, correta)
VALUES
    (
        178,
        'Desenvolvimento de soluções inovadoras e sustentáveis',
        1
    );

INSERT INTO
    alternativa (id_questao, perguntas, correta)
VALUES
    (178, 'Somente instalação de redes locais', 0);

INSERT INTO
    questao (id, enunciado, pontuacao, id_disciplina)
VALUES
    (
        179,
        'Um memorial descritivo é um documento utilizado para:',
        30,
        8
    );

INSERT INTO
    alternativa (id_questao, perguntas, correta)
VALUES
    (179, 'Configurar bancos de dados relacionais', 0);

INSERT INTO
    alternativa (id_questao, perguntas, correta)
VALUES
    (179, 'Criar autenticação em APIs', 0);

INSERT INTO
    alternativa (id_questao, perguntas, correta)
VALUES
    (179, 'Organizar protocolos de internet', 0);

INSERT INTO
    alternativa (id_questao, perguntas, correta)
VALUES
    (
        179,
        'Explicar detalhadamente características de um projeto',
        1
    );

INSERT INTO
    questao (id, enunciado, pontuacao, id_disciplina)
VALUES
    (
        180,
        'A apresentação oral de um TCC deve priorizar:',
        30,
        8
    );

INSERT INTO
    alternativa (id_questao, perguntas, correta)
VALUES
    (180, 'Clareza, organização e domínio do tema', 1);

INSERT INTO
    alternativa (id_questao, perguntas, correta)
VALUES
    (180, 'Uso excessivo de animações', 0);

INSERT INTO
    alternativa (id_questao, perguntas, correta)
VALUES
    (180, 'Apenas leitura dos slides', 0);

INSERT INTO
    alternativa (id_questao, perguntas, correta)
VALUES
    (180, 'Configuração de sistemas operacionais', 0);

INSERT INTO
    questao (id, enunciado, pontuacao, id_disciplina)
VALUES
    (
        181,
        'Qual linguagem SQL é utilizada para manipulação de dados?',
        10,
        9
    );

INSERT INTO
    alternativa (id_questao, perguntas, correta)
VALUES
    (181, 'DML', 1);

INSERT INTO
    alternativa (id_questao, perguntas, correta)
VALUES
    (181, 'DDL', 0);

INSERT INTO
    alternativa (id_questao, perguntas, correta)
VALUES
    (181, 'TCL', 0);

INSERT INTO
    alternativa (id_questao, perguntas, correta)
VALUES
    (181, 'DCL', 0);

INSERT INTO
    questao (id, enunciado, pontuacao, id_disciplina)
VALUES
    (
        182,
        'Qual comando é utilizado para inserir dados em uma tabela?',
        10,
        9
    );

INSERT INTO
    alternativa (id_questao, perguntas, correta)
VALUES
    (182, 'UPDATE', 0);

INSERT INTO
    alternativa (id_questao, perguntas, correta)
VALUES
    (182, 'DELETE', 0);

INSERT INTO
    alternativa (id_questao, perguntas, correta)
VALUES
    (182, 'INSERT', 1);

INSERT INTO
    alternativa (id_questao, perguntas, correta)
VALUES
    (182, 'SELECT', 0);

INSERT INTO
    questao (id, enunciado, pontuacao, id_disciplina)
VALUES
    (
        183,
        'O comando SELECT pertence à categoria:',
        10,
        9
    );

INSERT INTO
    alternativa (id_questao, perguntas, correta)
VALUES
    (183, 'DML', 0);

INSERT INTO
    alternativa (id_questao, perguntas, correta)
VALUES
    (183, 'DQL', 1);

INSERT INTO
    alternativa (id_questao, perguntas, correta)
VALUES
    (183, 'DCL', 0);

INSERT INTO
    alternativa (id_questao, perguntas, correta)
VALUES
    (183, 'TCL', 0);

INSERT INTO
    questao (id, enunciado, pontuacao, id_disciplina)
VALUES
    (
        184,
        'Qual comando remove dados de uma tabela?',
        10,
        9
    );

INSERT INTO
    alternativa (id_questao, perguntas, correta)
VALUES
    (184, 'INSERT', 0);

INSERT INTO
    alternativa (id_questao, perguntas, correta)
VALUES
    (184, 'UPDATE', 0);

INSERT INTO
    alternativa (id_questao, perguntas, correta)
VALUES
    (184, 'SELECT', 0);

INSERT INTO
    alternativa (id_questao, perguntas, correta)
VALUES
    (184, 'DELETE', 1);

INSERT INTO
    questao (id, enunciado, pontuacao, id_disciplina)
VALUES
    (
        185,
        'O COMMIT em uma transação serve para:',
        10,
        9
    );

INSERT INTO
    alternativa (id_questao, perguntas, correta)
VALUES
    (185, 'Cancelar alterações', 0);

INSERT INTO
    alternativa (id_questao, perguntas, correta)
VALUES
    (185, 'Salvar alterações realizadas', 1);

INSERT INTO
    alternativa (id_questao, perguntas, correta)
VALUES
    (185, 'Excluir tabelas', 0);

INSERT INTO
    alternativa (id_questao, perguntas, correta)
VALUES
    (185, 'Criar banco de dados', 0);

INSERT INTO
    questao (id, enunciado, pontuacao, id_disciplina)
VALUES
    (186, 'O UPDATE é utilizado para:', 20, 9);

INSERT INTO
    alternativa (id_questao, perguntas, correta)
VALUES
    (186, 'Inserir registros', 0);

INSERT INTO
    alternativa (id_questao, perguntas, correta)
VALUES
    (186, 'Consultar dados', 0);

INSERT INTO
    alternativa (id_questao, perguntas, correta)
VALUES
    (186, 'Alterar dados existentes', 1);

INSERT INTO
    alternativa (id_questao, perguntas, correta)
VALUES
    (186, 'Excluir tabelas', 0);

INSERT INTO
    questao (id, enunciado, pontuacao, id_disciplina)
VALUES
    (
        187,
        'A cláusula ORDER BY é utilizada para:',
        20,
        9
    );

INSERT INTO
    alternativa (id_questao, perguntas, correta)
VALUES
    (187, 'Excluir registros duplicados', 0);

INSERT INTO
    alternativa (id_questao, perguntas, correta)
VALUES
    (187, 'Ordenar resultados de uma consulta', 1);

INSERT INTO
    alternativa (id_questao, perguntas, correta)
VALUES
    (187, 'Criar tabelas', 0);

INSERT INTO
    alternativa (id_questao, perguntas, correta)
VALUES
    (187, 'Fazer backup do banco', 0);

INSERT INTO
    questao (id, enunciado, pontuacao, id_disciplina)
VALUES
    (
        188,
        'Qual função agregada é utilizada para contar registros?',
        20,
        9
    );

INSERT INTO
    alternativa (id_questao, perguntas, correta)
VALUES
    (188, 'COUNT', 1);

INSERT INTO
    alternativa (id_questao, perguntas, correta)
VALUES
    (188, 'SUM', 0);

INSERT INTO
    alternativa (id_questao, perguntas, correta)
VALUES
    (188, 'AVG', 0);

INSERT INTO
    alternativa (id_questao, perguntas, correta)
VALUES
    (188, 'MAX', 0);

INSERT INTO
    questao (id, enunciado, pontuacao, id_disciplina)
VALUES
    (189, 'O INNER JOIN é utilizado para:', 20, 9);

INSERT INTO
    alternativa (id_questao, perguntas, correta)
VALUES
    (
        189,
        'Unir tabelas mostrando apenas dados relacionados',
        1
    );

INSERT INTO
    alternativa (id_questao, perguntas, correta)
VALUES
    (189, 'Excluir relações entre tabelas', 0);

INSERT INTO
    alternativa (id_questao, perguntas, correta)
VALUES
    (189, 'Criar novos bancos de dados', 0);

INSERT INTO
    alternativa (id_questao, perguntas, correta)
VALUES
    (
        189,
        'Atualizar várias tabelas ao mesmo tempo',
        0
    );

INSERT INTO
    questao (id, enunciado, pontuacao, id_disciplina)
VALUES
    (
        190,
        'O ROLLBACK em transações serve para:',
        20,
        9
    );

INSERT INTO
    alternativa (id_questao, perguntas, correta)
VALUES
    (190, 'Confirmar alterações', 0);

INSERT INTO
    alternativa (id_questao, perguntas, correta)
VALUES
    (190, 'Criar índices', 0);

INSERT INTO
    alternativa (id_questao, perguntas, correta)
VALUES
    (190, 'Desfazer alterações não confirmadas', 1);

INSERT INTO
    alternativa (id_questao, perguntas, correta)
VALUES
    (190, 'Excluir banco de dados', 0);

INSERT INTO
    questao (id, enunciado, pontuacao, id_disciplina)
VALUES
    (
        191,
        'Qual propriedade ACID garante que uma transação seja concluída totalmente ou',
        30,
        9
    );

INSERT INTO
    alternativa (id_questao, perguntas, correta)
VALUES
    (191, 'Consistência', 0);

INSERT INTO
    alternativa (id_questao, perguntas, correta)
VALUES
    (191, 'Isolamento', 0);

INSERT INTO
    alternativa (id_questao, perguntas, correta)
VALUES
    (191, 'Durabilidade', 0);

INSERT INTO
    alternativa (id_questao, perguntas, correta)
VALUES
    (191, 'Atomicidade', 1);

INSERT INTO
    questao (id, enunciado, pontuacao, id_disciplina)
VALUES
    (192, 'O LEFT JOIN retorna:', 30, 9);

INSERT INTO
    alternativa (id_questao, perguntas, correta)
VALUES
    (
        192,
        'Apenas registros iguais nas duas tabelas',
        0
    );

INSERT INTO
    alternativa (id_questao, perguntas, correta)
VALUES
    (
        192,
        'Todos os registros da tabela da esquerda e os correspondentes da direita',
        1
    );

INSERT INTO
    alternativa (id_questao, perguntas, correta)
VALUES
    (192, 'Apenas registros da tabela da direita', 0);

INSERT INTO
    alternativa (id_questao, perguntas, correta)
VALUES
    (192, 'Somente registros duplicados', 0);

INSERT INTO
    questao (id, enunciado, pontuacao, id_disciplina)
VALUES
    (193, 'O CROSS JOIN gera:', 30, 9);

INSERT INTO
    alternativa (id_questao, perguntas, correta)
VALUES
    (193, 'Apenas registros relacionados', 0);

INSERT INTO
    alternativa (id_questao, perguntas, correta)
VALUES
    (193, 'Atualização automática dos dados', 0);

INSERT INTO
    alternativa (id_questao, perguntas, correta)
VALUES
    (193, 'Produto cartesiano entre tabelas', 1);

INSERT INTO
    alternativa (id_questao, perguntas, correta)
VALUES
    (193, 'Exclusão de registros repetidos', 0);

INSERT INTO
    questao (id, enunciado, pontuacao, id_disciplina)
VALUES
    (
        194,
        'Qual operação SQL combina resultados de duas consultas eliminando duplicidades?',
        30,
        9
    );

INSERT INTO
    alternativa (id_questao, perguntas, correta)
VALUES
    (194, 'DIFFERENCE', 0);

INSERT INTO
    alternativa (id_questao, perguntas, correta)
VALUES
    (194, 'INTERSECT', 0);

INSERT INTO
    alternativa (id_questao, perguntas, correta)
VALUES
    (194, 'JOIN', 0);

INSERT INTO
    alternativa (id_questao, perguntas, correta)
VALUES
    (194, 'UNION', 1);

INSERT INTO
    questao (id, enunciado, pontuacao, id_disciplina)
VALUES
    (
        195,
        'A propriedade de durabilidade no ACID garante que:',
        30,
        9
    );

INSERT INTO
    alternativa (id_questao, perguntas, correta)
VALUES
    (195, 'Os dados sejam apagados após o uso', 0);

INSERT INTO
    alternativa (id_questao, perguntas, correta)
VALUES
    (
        195,
        'As alterações confirmadas permaneçam salvas mesmo após falhas',
        1
    );

INSERT INTO
    alternativa (id_questao, perguntas, correta)
VALUES
    (
        195,
        'Apenas um usuário utilize o banco por vez',
        0
    );

INSERT INTO
    alternativa (id_questao, perguntas, correta)
VALUES
    (
        195,
        'Consultas sejam executadas mais rapidamente',
        0
    );

INSERT INTO
    questao (id, enunciado, pontuacao, id_disciplina)
VALUES
    (196, 'O que é um sistema embarcado?', 10, 15);

INSERT INTO
    alternativa (id_questao, perguntas, correta)
VALUES
    (
        196,
        'Um sistema desenvolvido apenas para jogos',
        0
    );

INSERT INTO
    alternativa (id_questao, perguntas, correta)
VALUES
    (
        196,
        'Um sistema dedicado a executar funções específicas',
        1
    );

INSERT INTO
    alternativa (id_questao, perguntas, correta)
VALUES
    (196, 'Um tipo de banco de dados', 0);

INSERT INTO
    alternativa (id_questao, perguntas, correta)
VALUES
    (
        196,
        'Um programa utilizado apenas em computadores',
        0
    );

INSERT INTO
    questao (id, enunciado, pontuacao, id_disciplina)
VALUES
    (
        197,
        'Qual componente é utilizado para montagem de circuitos sem solda?',
        10,
        15
    );

INSERT INTO
    alternativa (id_questao, perguntas, correta)
VALUES
    (197, 'Processador', 0);

INSERT INTO
    alternativa (id_questao, perguntas, correta)
VALUES
    (197, 'Capacitor', 0);

INSERT INTO
    alternativa (id_questao, perguntas, correta)
VALUES
    (197, 'Protoboard', 1);

INSERT INTO
    alternativa (id_questao, perguntas, correta)
VALUES
    (197, 'Monitor', 0);

INSERT INTO
    questao (id, enunciado, pontuacao, id_disciplina)
VALUES
    (
        198,
        'Em programas para microcontroladores, qual função é executada repetidamente?',
        10,
        15
    );

INSERT INTO
    alternativa (id_questao, perguntas, correta)
VALUES
    (198, 'main()', 0);

INSERT INTO
    alternativa (id_questao, perguntas, correta)
VALUES
    (198, 'digitalRead()', 0);

INSERT INTO
    alternativa (id_questao, perguntas, correta)
VALUES
    (198, 'setup()', 0);

INSERT INTO
    alternativa (id_questao, perguntas, correta)
VALUES
    (198, 'loop()', 1);

INSERT INTO
    questao (id, enunciado, pontuacao, id_disciplina)
VALUES
    (
        199,
        'Qual comando configura um pino como entrada ou saída?',
        10,
        15
    );

INSERT INTO
    alternativa (id_questao, perguntas, correta)
VALUES
    (199, 'analogWrite()', 0);

INSERT INTO
    alternativa (id_questao, perguntas, correta)
VALUES
    (199, 'pinMode()', 1);

INSERT INTO
    alternativa (id_questao, perguntas, correta)
VALUES
    (199, 'delay()', 0);

INSERT INTO
    alternativa (id_questao, perguntas, correta)
VALUES
    (199, 'micros()', 0);

INSERT INTO
    questao (id, enunciado, pontuacao, id_disciplina)
VALUES
    (
        200,
        'LEDs são componentes utilizados para:',
        10,
        15
    );

INSERT INTO
    alternativa (id_questao, perguntas, correta)
VALUES
    (200, 'Armazenar dados', 0);

INSERT INTO
    alternativa (id_questao, perguntas, correta)
VALUES
    (200, 'Processar informações', 0);

INSERT INTO
    alternativa (id_questao, perguntas, correta)
VALUES
    (200, 'Emitir luz', 1);

INSERT INTO
    alternativa (id_questao, perguntas, correta)
VALUES
    (200, 'Amplificar sinais', 0);

INSERT INTO
    questao (id, enunciado, pontuacao, id_disciplina)
VALUES
    (
        201,
        'A função digitalWrite() é utilizada para:',
        20,
        15
    );

INSERT INTO
    alternativa (id_questao, perguntas, correta)
VALUES
    (201, 'Ler sinais analógicos', 0);

INSERT INTO
    alternativa (id_questao, perguntas, correta)
VALUES
    (201, 'Configurar timers', 0);

INSERT INTO
    alternativa (id_questao, perguntas, correta)
VALUES
    (201, 'Enviar sinais digitais para um pino', 1);

INSERT INTO
    alternativa (id_questao, perguntas, correta)
VALUES
    (201, 'Reiniciar o microcontrolador', 0);

INSERT INTO
    questao (id, enunciado, pontuacao, id_disciplina)
VALUES
    (202, 'A função analogRead() serve para:', 20, 15);

INSERT INTO
    alternativa (id_questao, perguntas, correta)
VALUES
    (202, 'Ler sinais analógicos', 1);

INSERT INTO
    alternativa (id_questao, perguntas, correta)
VALUES
    (202, 'Criar números aleatórios', 0);

INSERT INTO
    alternativa (id_questao, perguntas, correta)
VALUES
    (202, 'Desligar sensores', 0);

INSERT INTO
    alternativa (id_questao, perguntas, correta)
VALUES
    (202, 'Configurar botões', 0);

INSERT INTO
    questao (id, enunciado, pontuacao, id_disciplina)
VALUES
    (
        203,
        'Qual estrutura é utilizada para repetir instruções em programação?',
        20,
        15
    );

INSERT INTO
    alternativa (id_questao, perguntas, correta)
VALUES
    (203, 'Condição', 0);

INSERT INTO
    alternativa (id_questao, perguntas, correta)
VALUES
    (203, 'Repetição', 1);

INSERT INTO
    alternativa (id_questao, perguntas, correta)
VALUES
    (203, 'Variável', 0);

INSERT INTO
    alternativa (id_questao, perguntas, correta)
VALUES
    (203, 'Biblioteca', 0);

INSERT INTO
    questao (id, enunciado, pontuacao, id_disciplina)
VALUES
    (204, 'O delay() é utilizado para:', 20, 15);

INSERT INTO
    alternativa (id_questao, perguntas, correta)
VALUES
    (204, 'Ler sensores digitais', 0);

INSERT INTO
    alternativa (id_questao, perguntas, correta)
VALUES
    (204, 'Gerar sons', 0);

INSERT INTO
    alternativa (id_questao, perguntas, correta)
VALUES
    (204, 'Criar pausas na execução do programa', 1);

INSERT INTO
    alternativa (id_questao, perguntas, correta)
VALUES
    (204, 'Configurar portas analógicas', 0);

INSERT INTO
    questao (id, enunciado, pontuacao, id_disciplina)
VALUES
    (
        205,
        'O movimento maker está relacionado com:',
        20,
        15
    );

INSERT INTO
    alternativa (id_questao, perguntas, correta)
VALUES
    (
        205,
        'Desenvolvimento apenas de softwares empresariais',
        0
    );

INSERT INTO
    alternativa (id_questao, perguntas, correta)
VALUES
    (
        205,
        'Criação prática de projetos tecnológicos',
        1
    );

INSERT INTO
    alternativa (id_questao, perguntas, correta)
VALUES
    (205, 'Exclusão de componentes eletrônicos', 0);

INSERT INTO
    alternativa (id_questao, perguntas, correta)
VALUES
    (205, 'Uso exclusivo de computadores antigos', 0);

INSERT INTO
    questao (id, enunciado, pontuacao, id_disciplina)
VALUES
    (
        206,
        'A conversão Analógico-Digital permite:',
        30,
        15
    );

INSERT INTO
    alternativa (id_questao, perguntas, correta)
VALUES
    (
        206,
        'Transformar sinais analógicos em valores digitais',
        1
    );

INSERT INTO
    alternativa (id_questao, perguntas, correta)
VALUES
    (206, 'Aumentar a memória do microcontrolador', 0);

INSERT INTO
    alternativa (id_questao, perguntas, correta)
VALUES
    (206, 'Criar interfaces gráficas', 0);

INSERT INTO
    alternativa (id_questao, perguntas, correta)
VALUES
    (206, 'Excluir sinais elétricos', 0);

INSERT INTO
    questao (id, enunciado, pontuacao, id_disciplina)
VALUES
    (207, 'A função millis() retorna:', 30, 15);

INSERT INTO
    alternativa (id_questao, perguntas, correta)
VALUES
    (207, 'A temperatura do sistema', 0);

INSERT INTO
    alternativa (id_questao, perguntas, correta)
VALUES
    (
        207,
        'O tempo em milissegundos desde o início da execução',
        1
    );

INSERT INTO
    alternativa (id_questao, perguntas, correta)
VALUES
    (207, 'A quantidade de memória disponível', 0);

INSERT INTO
    alternativa (id_questao, perguntas, correta)
VALUES
    (207, 'O número de portas digitais', 0);

INSERT INTO
    questao (id, enunciado, pontuacao, id_disciplina)
VALUES
    (
        208,
        'Bibliotecas em sistemas embarcados são utilizadas para:',
        30,
        15
    );

INSERT INTO
    alternativa (id_questao, perguntas, correta)
VALUES
    (208, 'Organizar componentes físicos apenas', 0);

INSERT INTO
    alternativa (id_questao, perguntas, correta)
VALUES
    (208, 'Substituir microcontroladores', 0);

INSERT INTO
    alternativa (id_questao, perguntas, correta)
VALUES
    (
        208,
        'Facilitar o uso de sensores e recursos específicos',
        1
    );

INSERT INTO
    alternativa (id_questao, perguntas, correta)
VALUES
    (208, 'Eliminar o uso de funções', 0);

INSERT INTO
    questao (id, enunciado, pontuacao, id_disciplina)
VALUES
    (
        209,
        'Qual alternativa representa corretamente uma característica da Internet das Coisas',
        30,
        15
    );

INSERT INTO
    alternativa (id_questao, perguntas, correta)
VALUES
    (
        209,
        'Dispositivos conectados trocando dados pela internet',
        1
    );

INSERT INTO
    alternativa (id_questao, perguntas, correta)
VALUES
    (209, 'Uso exclusivo de computadores sem rede', 0);

INSERT INTO
    alternativa (id_questao, perguntas, correta)
VALUES
    (209, 'Sistemas sem sensores', 0);

INSERT INTO
    alternativa (id_questao, perguntas, correta)
VALUES
    (
        209,
        'Eliminação de comunicação entre dispositivos',
        0
    );

INSERT INTO
    questao (id, enunciado, pontuacao, id_disciplina)
VALUES
    (
        210,
        'O uso de timers e contadores em microcontroladores permite:',
        30,
        15
    );

INSERT INTO
    alternativa (id_questao, perguntas, correta)
VALUES
    (
        210,
        'Controlar intervalos e medições de tempo',
        1
    );

INSERT INTO
    alternativa (id_questao, perguntas, correta)
VALUES
    (210, 'Aumentar o tamanho físico da placa', 0);

INSERT INTO
    alternativa (id_questao, perguntas, correta)
VALUES
    (210, 'Excluir bibliotecas automaticamente', 0);

INSERT INTO
    alternativa (id_questao, perguntas, correta)
VALUES
    (210, 'Substituir entradas analógicas', 0);

INSERT INTO
    questao (id, enunciado, pontuacao, id_disciplina)
VALUES
    (
        211,
        'Qual plataforma é utilizada para desenvolvimento nativo de aplicativos Android?',
        10,
        11
    );

INSERT INTO
    alternativa (id_questao, perguntas, correta)
VALUES
    (211, 'Swift', 0);

INSERT INTO
    alternativa (id_questao, perguntas, correta)
VALUES
    (211, 'Kotlin', 1);

INSERT INTO
    alternativa (id_questao, perguntas, correta)
VALUES
    (211, 'Ionic', 0);

INSERT INTO
    alternativa (id_questao, perguntas, correta)
VALUES
    (211, 'Flutter', 0);

INSERT INTO
    questao (id, enunciado, pontuacao, id_disciplina)
VALUES
    (
        212,
        'O Flutter é um modelo de desenvolvimento:',
        10,
        11
    );

INSERT INTO
    alternativa (id_questao, perguntas, correta)
VALUES
    (212, 'Exclusivo para iOS', 0);

INSERT INTO
    alternativa (id_questao, perguntas, correta)
VALUES
    (212, 'Desktop', 0);

INSERT INTO
    alternativa (id_questao, perguntas, correta)
VALUES
    (212, 'Nativo multiplataforma', 1);

INSERT INTO
    alternativa (id_questao, perguntas, correta)
VALUES
    (212, 'Banco de dados', 0);

INSERT INTO
    questao (id, enunciado, pontuacao, id_disciplina)
VALUES
    (
        213,
        'Qual componente é utilizado para exibir textos em aplicativos mobile?',
        10,
        11
    );

INSERT INTO
    alternativa (id_questao, perguntas, correta)
VALUES
    (213, 'Lista', 0);

INSERT INTO
    alternativa (id_questao, perguntas, correta)
VALUES
    (213, 'Botão', 0);

INSERT INTO
    alternativa (id_questao, perguntas, correta)
VALUES
    (213, 'Imagem', 0);

INSERT INTO
    alternativa (id_questao, perguntas, correta)
VALUES
    (213, 'Texto', 1);

INSERT INTO
    questao (id, enunciado, pontuacao, id_disciplina)
VALUES
    (
        214,
        'O SDK em desenvolvimento mobile é utilizado para:',
        10,
        11
    );

INSERT INTO
    alternativa (id_questao, perguntas, correta)
VALUES
    (214, 'Criar hardware para celulares', 0);

INSERT INTO
    alternativa (id_questao, perguntas, correta)
VALUES
    (
        214,
        'Fornecer ferramentas para desenvolvimento',
        1
    );

INSERT INTO
    alternativa (id_questao, perguntas, correta)
VALUES
    (214, 'Excluir aplicativos do aparelho', 0);

INSERT INTO
    alternativa (id_questao, perguntas, correta)
VALUES
    (214, 'Formatar dispositivos móveis', 0);

INSERT INTO
    questao (id, enunciado, pontuacao, id_disciplina)
VALUES
    (
        215,
        'As lojas de aplicativos servem para:',
        10,
        11
    );

INSERT INTO
    alternativa (id_questao, perguntas, correta)
VALUES
    (215, 'Desenvolver bancos de dados', 0);

INSERT INTO
    alternativa (id_questao, perguntas, correta)
VALUES
    (215, 'Armazenar componentes físicos', 0);

INSERT INTO
    alternativa (id_questao, perguntas, correta)
VALUES
    (215, 'Distribuir aplicativos para usuários', 1);

INSERT INTO
    alternativa (id_questao, perguntas, correta)
VALUES
    (215, 'Configurar redes locais', 0);

INSERT INTO
    questao (id, enunciado, pontuacao, id_disciplina)
VALUES
    (
        216,
        'O React Native é considerado um modelo de desenvolvimento:',
        20,
        11
    );

INSERT INTO
    alternativa (id_questao, perguntas, correta)
VALUES
    (216, 'Nativo multiplataforma', 1);

INSERT INTO
    alternativa (id_questao, perguntas, correta)
VALUES
    (216, 'Exclusivo para Android', 0);

INSERT INTO
    alternativa (id_questao, perguntas, correta)
VALUES
    (216, 'Exclusivo para iOS', 0);

INSERT INTO
    alternativa (id_questao, perguntas, correta)
VALUES
    (216, 'Apenas híbrido', 0);

INSERT INTO
    questao (id, enunciado, pontuacao, id_disciplina)
VALUES
    (
        217,
        'O armazenamento offline em aplicativos permite:',
        20,
        11
    );

INSERT INTO
    alternativa (id_questao, perguntas, correta)
VALUES
    (
        217,
        'Utilizar dados sem conexão com internet',
        1
    );

INSERT INTO
    alternativa (id_questao, perguntas, correta)
VALUES
    (217, 'Excluir arquivos automaticamente', 0);

INSERT INTO
    alternativa (id_questao, perguntas, correta)
VALUES
    (217, 'Bloquear o uso do aplicativo', 0);

INSERT INTO
    alternativa (id_questao, perguntas, correta)
VALUES
    (217, 'Aumentar o tamanho da tela do celular', 0);

INSERT INTO
    questao (id, enunciado, pontuacao, id_disciplina)
VALUES
    (
        218,
        'A função das permissões em aplicativos mobile é:',
        20,
        11
    );

INSERT INTO
    alternativa (id_questao, perguntas, correta)
VALUES
    (218, 'Melhorar apenas a aparência do app', 0);

INSERT INTO
    alternativa (id_questao, perguntas, correta)
VALUES
    (
        218,
        'Controlar acesso a recursos do dispositivo',
        1
    );

INSERT INTO
    alternativa (id_questao, perguntas, correta)
VALUES
    (218, 'Criar bancos de dados externos', 0);

INSERT INTO
    alternativa (id_questao, perguntas, correta)
VALUES
    (218, 'Excluir notificações do sistema', 0);

INSERT INTO
    questao (id, enunciado, pontuacao, id_disciplina)
VALUES
    (219, 'A splash screen é:', 20, 11);

INSERT INTO
    alternativa (id_questao, perguntas, correta)
VALUES
    (
        219,
        'Uma tela inicial exibida ao abrir o aplicativo',
        1
    );

INSERT INTO
    alternativa (id_questao, perguntas, correta)
VALUES
    (219, 'Um banco de dados interno', 0);

INSERT INTO
    alternativa (id_questao, perguntas, correta)
VALUES
    (219, 'Um tipo de linguagem mobile', 0);

INSERT INTO
    alternativa (id_questao, perguntas, correta)
VALUES
    (219, 'Um sistema operacional', 0);

INSERT INTO
    questao (id, enunciado, pontuacao, id_disciplina)
VALUES
    (
        220,
        'Navegação e roteamento em aplicativos mobile servem para:',
        20,
        11
    );

INSERT INTO
    alternativa (id_questao, perguntas, correta)
VALUES
    (
        220,
        'Trocar o sistema operacional do celular',
        0
    );

INSERT INTO
    alternativa (id_questao, perguntas, correta)
VALUES
    (220, 'Configurar internet móvel', 0);

INSERT INTO
    alternativa (id_questao, perguntas, correta)
VALUES
    (
        220,
        'Controlar a mudança entre telas do aplicativo',
        1
    );

INSERT INTO
    alternativa (id_questao, perguntas, correta)
VALUES
    (220, 'Excluir componentes da interface', 0);

INSERT INTO
    questao (id, enunciado, pontuacao, id_disciplina)
VALUES
    (
        221,
        'Qual alternativa apresenta apenas tecnologias híbridas?',
        30,
        11
    );

INSERT INTO
    alternativa (id_questao, perguntas, correta)
VALUES
    (221, 'Java e Swift', 0);

INSERT INTO
    alternativa (id_questao, perguntas, correta)
VALUES
    (221, 'Flutter e React Native', 0);

INSERT INTO
    alternativa (id_questao, perguntas, correta)
VALUES
    (221, 'Cordova e Ionic', 1);

INSERT INTO
    alternativa (id_questao, perguntas, correta)
VALUES
    (221, 'Kotlin e Xamarin', 0);

INSERT INTO
    questao (id, enunciado, pontuacao, id_disciplina)
VALUES
    (
        222,
        'O gerenciamento de estado dos componentes é importante porque:',
        30,
        11
    );

INSERT INTO
    alternativa (id_questao, perguntas, correta)
VALUES
    (
        222,
        'Controla e atualiza informações da interface do aplicativo',
        1
    );

INSERT INTO
    alternativa (id_questao, perguntas, correta)
VALUES
    (222, 'Remove permissões automaticamente', 0);

INSERT INTO
    alternativa (id_questao, perguntas, correta)
VALUES
    (222, 'Substitui o armazenamento offline', 0);

INSERT INTO
    alternativa (id_questao, perguntas, correta)
VALUES
    (222, 'Cria emuladores para celulares', 0);

INSERT INTO
    questao (id, enunciado, pontuacao, id_disciplina)
VALUES
    (
        223,
        'Emuladores no desenvolvimento mobile são utilizados para:',
        30,
        11
    );

INSERT INTO
    alternativa (id_questao, perguntas, correta)
VALUES
    (223, 'Aumentar a memória do celular', 0);

INSERT INTO
    alternativa (id_questao, perguntas, correta)
VALUES
    (
        223,
        'Simular dispositivos para testes de aplicativos',
        1
    );

INSERT INTO
    alternativa (id_questao, perguntas, correta)
VALUES
    (223, 'Criar bancos de dados online', 0);

INSERT INTO
    alternativa (id_questao, perguntas, correta)
VALUES
    (223, 'Melhorar sinais de internet', 0);

INSERT INTO
    questao (id, enunciado, pontuacao, id_disciplina)
VALUES
    (
        224,
        'O ciclo de vida de um aplicativo mobile representa:',
        30,
        11
    );

INSERT INTO
    alternativa (id_questao, perguntas, correta)
VALUES
    (224, 'Apenas o design da interface', 0);

INSERT INTO
    alternativa (id_questao, perguntas, correta)
VALUES
    (224, 'O tempo de bateria do celular', 0);

INSERT INTO
    alternativa (id_questao, perguntas, correta)
VALUES
    (
        224,
        'As etapas de execução e funcionamento do aplicativo',
        1
    );

INSERT INTO
    alternativa (id_questao, perguntas, correta)
VALUES
    (224, 'A quantidade de usuários do sistema', 0);

INSERT INTO
    questao (id, enunciado, pontuacao, id_disciplina)
VALUES
    (
        225,
        'Qual alternativa representa corretamente uma vantagem do desenvolvimento',
        30,
        11
    );

INSERT INTO
    alternativa (id_questao, perguntas, correta)
VALUES
    (
        225,
        'Necessidade de criar aplicativos separados para cada sistema',
        0
    );

INSERT INTO
    alternativa (id_questao, perguntas, correta)
VALUES
    (225, 'Uso exclusivo em computadores', 0);

INSERT INTO
    alternativa (id_questao, perguntas, correta)
VALUES
    (
        225,
        'Desenvolvimento mais rápido para diferentes plataformas',
        1
    );

INSERT INTO
    alternativa (id_questao, perguntas, correta)
VALUES
    (
        225,
        'Eliminação total do uso de interfaces gráficas',
        0
    );

INSERT INTO
    questao (id, enunciado, pontuacao, id_disciplina)
VALUES
    (226, 'O que significa o termo NoSQL?', 10, 14);

INSERT INTO
    alternativa (id_questao, perguntas, correta)
VALUES
    (
        226,
        'Banco de dados sem estrutura fixa relacional',
        1
    );

INSERT INTO
    alternativa (id_questao, perguntas, correta)
VALUES
    (226, 'Linguagem de programação para web', 0);

INSERT INTO
    alternativa (id_questao, perguntas, correta)
VALUES
    (226, 'Sistema operacional para servidores', 0);

INSERT INTO
    alternativa (id_questao, perguntas, correta)
VALUES
    (226, 'Ferramenta de design gráfico', 0);

INSERT INTO
    questao (id, enunciado, pontuacao, id_disciplina)
VALUES
    (
        227,
        'Qual banco de dados é baseado em documentos?',
        10,
        14
    );

INSERT INTO
    alternativa (id_questao, perguntas, correta)
VALUES
    (227, 'Redis', 0);

INSERT INTO
    alternativa (id_questao, perguntas, correta)
VALUES
    (227, 'MongoDB', 1);

INSERT INTO
    alternativa (id_questao, perguntas, correta)
VALUES
    (227, 'Neo4j', 0);

INSERT INTO
    alternativa (id_questao, perguntas, correta)
VALUES
    (227, 'Cassandra', 0);

INSERT INTO
    questao (id, enunciado, pontuacao, id_disciplina)
VALUES
    (
        228,
        'O Redis é um exemplo de banco de dados do tipo:',
        10,
        14
    );

INSERT INTO
    alternativa (id_questao, perguntas, correta)
VALUES
    (228, 'Documento', 0);

INSERT INTO
    alternativa (id_questao, perguntas, correta)
VALUES
    (228, 'Coluna', 0);

INSERT INTO
    alternativa (id_questao, perguntas, correta)
VALUES
    (228, 'Grafo', 0);

INSERT INTO
    alternativa (id_questao, perguntas, correta)
VALUES
    (228, 'Chave-valor', 1);

INSERT INTO
    questao (id, enunciado, pontuacao, id_disciplina)
VALUES
    (
        229,
        'Qual banco de dados é especializado em grafos?',
        10,
        14
    );

INSERT INTO
    alternativa (id_questao, perguntas, correta)
VALUES
    (229, 'Bigtable', 0);

INSERT INTO
    alternativa (id_questao, perguntas, correta)
VALUES
    (229, 'CouchDB', 0);

INSERT INTO
    alternativa (id_questao, perguntas, correta)
VALUES
    (229, 'Neo4j', 1);

INSERT INTO
    alternativa (id_questao, perguntas, correta)
VALUES
    (229, 'MongoDB', 0);

INSERT INTO
    questao (id, enunciado, pontuacao, id_disciplina)
VALUES
    (230, 'CRUD representa operações de:', 10, 14);

INSERT INTO
    alternativa (id_questao, perguntas, correta)
VALUES
    (
        230,
        'Criação, leitura, atualização e exclusão de dados',
        1
    );

INSERT INTO
    alternativa (id_questao, perguntas, correta)
VALUES
    (230, 'Compactação de arquivos', 0);

INSERT INTO
    alternativa (id_questao, perguntas, correta)
VALUES
    (230, 'Desenvolvimento de hardware', 0);

INSERT INTO
    alternativa (id_questao, perguntas, correta)
VALUES
    (230, 'Criação de redes locais', 0);

INSERT INTO
    questao (id, enunciado, pontuacao, id_disciplina)
VALUES
    (
        231,
        'Qual é uma das principais motivações do uso de bancos NoSQL?',
        20,
        14
    );

INSERT INTO
    alternativa (id_questao, perguntas, correta)
VALUES
    (231, 'Trabalhar apenas com tabelas fixas', 0);

INSERT INTO
    alternativa (id_questao, perguntas, correta)
VALUES
    (
        231,
        'Melhorar escalabilidade e flexibilidade',
        1
    );

INSERT INTO
    alternativa (id_questao, perguntas, correta)
VALUES
    (231, 'Eliminar armazenamento de dados', 0);

INSERT INTO
    alternativa (id_questao, perguntas, correta)
VALUES
    (231, 'Substituir linguagens de programação', 0);

INSERT INTO
    questao (id, enunciado, pontuacao, id_disciplina)
VALUES
    (
        232,
        'Em MongoDB, coleções são equivalentes a:',
        20,
        14
    );

INSERT INTO
    alternativa (id_questao, perguntas, correta)
VALUES
    (232, 'Linhas de uma tabela', 0);

INSERT INTO
    alternativa (id_questao, perguntas, correta)
VALUES
    (232, 'Campos numéricos', 0);

INSERT INTO
    alternativa (id_questao, perguntas, correta)
VALUES
    (232, 'Tabelas em bancos relacionais', 1);

INSERT INTO
    alternativa (id_questao, perguntas, correta)
VALUES
    (232, 'Índices automáticos', 0);

INSERT INTO
    questao (id, enunciado, pontuacao, id_disciplina)
VALUES
    (
        233,
        'O modelo Embedded em MongoDB consiste em:',
        20,
        14
    );

INSERT INTO
    alternativa (id_questao, perguntas, correta)
VALUES
    (
        233,
        'Armazenar documentos dentro de outros documentos',
        1
    );

INSERT INTO
    alternativa (id_questao, perguntas, correta)
VALUES
    (233, 'Criar tabelas relacionais', 0);

INSERT INTO
    alternativa (id_questao, perguntas, correta)
VALUES
    (
        233,
        'Separar todos os dados em servidores diferentes',
        0
    );

INSERT INTO
    alternativa (id_questao, perguntas, correta)
VALUES
    (233, 'Utilizar apenas números inteiros', 0);

INSERT INTO
    questao (id, enunciado, pontuacao, id_disciplina)
VALUES
    (
        234,
        'Qual recurso é utilizado para melhorar o desempenho de buscas em bancos de',
        20,
        14
    );

INSERT INTO
    alternativa (id_questao, perguntas, correta)
VALUES
    (234, 'Agregação', 0);

INSERT INTO
    alternativa (id_questao, perguntas, correta)
VALUES
    (234, 'Índices', 1);

INSERT INTO
    alternativa (id_questao, perguntas, correta)
VALUES
    (234, 'Transações', 0);

INSERT INTO
    alternativa (id_questao, perguntas, correta)
VALUES
    (234, 'Map-Reduce', 0);

INSERT INTO
    questao (id, enunciado, pontuacao, id_disciplina)
VALUES
    (
        235,
        'O Map-Reduce é utilizado principalmente para:',
        20,
        14
    );

INSERT INTO
    alternativa (id_questao, perguntas, correta)
VALUES
    (235, 'Criação de interfaces gráficas', 0);

INSERT INTO
    alternativa (id_questao, perguntas, correta)
VALUES
    (235, 'Desenvolvimento de aplicativos mobile', 0);

INSERT INTO
    alternativa (id_questao, perguntas, correta)
VALUES
    (
        235,
        'Processamento de grandes volumes de dados',
        1
    );

INSERT INTO
    alternativa (id_questao, perguntas, correta)
VALUES
    (235, 'Exclusão automática de documentos', 0);

INSERT INTO
    questao (id, enunciado, pontuacao, id_disciplina)
VALUES
    (
        236,
        'Bancos de dados orientados a colunas são mais adequados para:',
        30,
        14
    );

INSERT INTO
    alternativa (id_questao, perguntas, correta)
VALUES
    (
        236,
        'Consultas analíticas em grandes volumes de dados',
        1
    );

INSERT INTO
    alternativa (id_questao, perguntas, correta)
VALUES
    (236, 'Desenvolvimento de jogos', 0);

INSERT INTO
    alternativa (id_questao, perguntas, correta)
VALUES
    (236, 'Edição de imagens', 0);

INSERT INTO
    alternativa (id_questao, perguntas, correta)
VALUES
    (236, 'Criação de páginas HTML', 0);

INSERT INTO
    questao (id, enunciado, pontuacao, id_disciplina)
VALUES
    (
        237,
        'O conceito de Big Data está relacionado com:',
        30,
        14
    );

INSERT INTO
    alternativa (id_questao, perguntas, correta)
VALUES
    (
        237,
        'Grandes volumes de dados processados rapidamente',
        1
    );

INSERT INTO
    alternativa (id_questao, perguntas, correta)
VALUES
    (237, 'Pequenos arquivos locais', 0);

INSERT INTO
    alternativa (id_questao, perguntas, correta)
VALUES
    (237, 'Criação de interfaces simples', 0);

INSERT INTO
    alternativa (id_questao, perguntas, correta)
VALUES
    (237, 'Desenvolvimento de hardware portátil', 0);

INSERT INTO
    questao (id, enunciado, pontuacao, id_disciplina)
VALUES
    (
        238,
        'Transações em bancos NoSQL têm como objetivo:',
        30,
        14
    );

INSERT INTO
    alternativa (id_questao, perguntas, correta)
VALUES
    (
        238,
        'Garantir consistência nas operações de dados',
        1
    );

INSERT INTO
    alternativa (id_questao, perguntas, correta)
VALUES
    (238, 'Criar novas linguagens de programação', 0);

INSERT INTO
    alternativa (id_questao, perguntas, correta)
VALUES
    (
        238,
        'Melhorar apenas o design das aplicações',
        0
    );

INSERT INTO
    alternativa (id_questao, perguntas, correta)
VALUES
    (238, 'Eliminar índices automaticamente', 0);

INSERT INTO
    questao (id, enunciado, pontuacao, id_disciplina)
VALUES
    (
        239,
        'Qual alternativa representa corretamente um banco de dados chave-valor?',
        30,
        14
    );

INSERT INTO
    alternativa (id_questao, perguntas, correta)
VALUES
    (239, 'MongoDB', 0);

INSERT INTO
    alternativa (id_questao, perguntas, correta)
VALUES
    (239, 'Neo4j', 0);

INSERT INTO
    alternativa (id_questao, perguntas, correta)
VALUES
    (239, 'Redis', 1);

INSERT INTO
    alternativa (id_questao, perguntas, correta)
VALUES
    (239, 'Cassandra', 0);

INSERT INTO
    questao (id, enunciado, pontuacao, id_disciplina)
VALUES
    (
        240,
        'Ciência de Dados é uma área voltada para:',
        30,
        14
    );

INSERT INTO
    alternativa (id_questao, perguntas, correta)
VALUES
    (
        240,
        'Análise e interpretação de dados para gerar conhecimento',
        1
    );

INSERT INTO
    alternativa (id_questao, perguntas, correta)
VALUES
    (240, 'Desenvolvimento exclusivo de hardware', 0);

INSERT INTO
    alternativa (id_questao, perguntas, correta)
VALUES
    (240, 'Criação de sistemas operacionais', 0);

INSERT INTO
    alternativa (id_questao, perguntas, correta)
VALUES
    (240, 'Montagem de redes físicas', 0);

INSERT INTO
    questao (id, enunciado, pontuacao, id_disciplina)
VALUES
    (241, 'O que significa a sigla IP?', 10, 10);

INSERT INTO
    alternativa (id_questao, perguntas, correta)
VALUES
    (241, 'Internal Program', 0);

INSERT INTO
    alternativa (id_questao, perguntas, correta)
VALUES
    (241, 'Internet Program', 0);

INSERT INTO
    alternativa (id_questao, perguntas, correta)
VALUES
    (241, 'Internet Protocol', 1);

INSERT INTO
    alternativa (id_questao, perguntas, correta)
VALUES
    (241, 'Integrated Process', 0);

INSERT INTO
    questao (id, enunciado, pontuacao, id_disciplina)
VALUES
    (
        242,
        'Qual protocolo é utilizado para navegação na web?',
        10,
        10
    );

INSERT INTO
    alternativa (id_questao, perguntas, correta)
VALUES
    (242, 'FTP', 0);

INSERT INTO
    alternativa (id_questao, perguntas, correta)
VALUES
    (242, 'SSH', 0);

INSERT INTO
    alternativa (id_questao, perguntas, correta)
VALUES
    (242, 'DNS', 0);

INSERT INTO
    alternativa (id_questao, perguntas, correta)
VALUES
    (242, 'HTTP', 1);

INSERT INTO
    questao (id, enunciado, pontuacao, id_disciplina)
VALUES
    (
        243,
        'Qual ferramenta é usada para testar conectividade entre computadores?',
        10,
        10
    );

INSERT INTO
    alternativa (id_questao, perguntas, correta)
VALUES
    (243, 'arp', 0);

INSERT INTO
    alternativa (id_questao, perguntas, correta)
VALUES
    (243, 'route', 0);

INSERT INTO
    alternativa (id_questao, perguntas, correta)
VALUES
    (243, 'ping', 1);

INSERT INTO
    alternativa (id_questao, perguntas, correta)
VALUES
    (243, 'netstat', 0);

INSERT INTO
    questao (id, enunciado, pontuacao, id_disciplina)
VALUES
    (244, 'O DNS é responsável por:', 10, 10);

INSERT INTO
    alternativa (id_questao, perguntas, correta)
VALUES
    (
        244,
        'Traduzir nomes de domínio em endereços IP',
        1
    );

INSERT INTO
    alternativa (id_questao, perguntas, correta)
VALUES
    (244, 'Armazenar arquivos', 0);

INSERT INTO
    alternativa (id_questao, perguntas, correta)
VALUES
    (244, 'Criar páginas web', 0);

INSERT INTO
    alternativa (id_questao, perguntas, correta)
VALUES
    (244, 'Configurar placas de vídeo', 0);

INSERT INTO
    questao (id, enunciado, pontuacao, id_disciplina)
VALUES
    (
        245,
        'Qual protocolo é utilizado para acesso remoto seguro?',
        10,
        10
    );

INSERT INTO
    alternativa (id_questao, perguntas, correta)
VALUES
    (245, 'FTP', 0);

INSERT INTO
    alternativa (id_questao, perguntas, correta)
VALUES
    (245, 'HTTP', 0);

INSERT INTO
    alternativa (id_questao, perguntas, correta)
VALUES
    (245, 'DNS', 0);

INSERT INTO
    alternativa (id_questao, perguntas, correta)
VALUES
    (245, 'SSH', 1);

INSERT INTO
    questao (id, enunciado, pontuacao, id_disciplina)
VALUES
    (
        246,
        'O modelo cliente/servidor funciona quando:',
        20,
        10
    );

INSERT INTO
    alternativa (id_questao, perguntas, correta)
VALUES
    (
        246,
        'Dois computadores compartilham hardware físico',
        0
    );

INSERT INTO
    alternativa (id_questao, perguntas, correta)
VALUES
    (246, 'Apenas servidores trocam informações', 0);

INSERT INTO
    alternativa (id_questao, perguntas, correta)
VALUES
    (
        246,
        'Um dispositivo solicita serviços e outro responde',
        1
    );

INSERT INTO
    alternativa (id_questao, perguntas, correta)
VALUES
    (
        246,
        'Não existe comunicação entre dispositivos',
        0
    );

INSERT INTO
    questao (id, enunciado, pontuacao, id_disciplina)
VALUES
    (247, 'O protocolo TCP é conhecido por:', 20, 10);

INSERT INTO
    alternativa (id_questao, perguntas, correta)
VALUES
    (247, 'Trabalhar apenas com imagens', 0);

INSERT INTO
    alternativa (id_questao, perguntas, correta)
VALUES
    (247, 'Garantir entrega confiável de dados', 1);

INSERT INTO
    alternativa (id_questao, perguntas, correta)
VALUES
    (247, 'Não utilizar portas', 0);

INSERT INTO
    alternativa (id_questao, perguntas, correta)
VALUES
    (247, 'Substituir o protocolo IP', 0);

INSERT INTO
    questao (id, enunciado, pontuacao, id_disciplina)
VALUES
    (
        248,
        'Qual ferramenta exibe configurações de rede no Windows?',
        20,
        10
    );

INSERT INTO
    alternativa (id_questao, perguntas, correta)
VALUES
    (248, 'ipconfig', 1);

INSERT INTO
    alternativa (id_questao, perguntas, correta)
VALUES
    (248, 'pathping', 0);

INSERT INTO
    alternativa (id_questao, perguntas, correta)
VALUES
    (248, 'nslookup', 0);

INSERT INTO
    alternativa (id_questao, perguntas, correta)
VALUES
    (248, 'getmac', 0);

INSERT INTO
    questao (id, enunciado, pontuacao, id_disciplina)
VALUES
    (249, 'O NAT é utilizado para:', 20, 10);

INSERT INTO
    alternativa (id_questao, perguntas, correta)
VALUES
    (249, 'Criar bancos de dados', 0);

INSERT INTO
    alternativa (id_questao, perguntas, correta)
VALUES
    (249, 'Configurar navegadores', 0);

INSERT INTO
    alternativa (id_questao, perguntas, correta)
VALUES
    (249, 'Desenvolver aplicativos mobile', 0);

INSERT INTO
    alternativa (id_questao, perguntas, correta)
VALUES
    (249, 'Traduzir endereços de rede', 1);

INSERT INTO
    questao (id, enunciado, pontuacao, id_disciplina)
VALUES
    (250, 'Cookies em HTTP servem para:', 20, 10);

INSERT INTO
    alternativa (id_questao, perguntas, correta)
VALUES
    (250, 'Melhorar sinais de internet', 0);

INSERT INTO
    alternativa (id_questao, perguntas, correta)
VALUES
    (250, 'Criar páginas HTML', 0);

INSERT INTO
    alternativa (id_questao, perguntas, correta)
VALUES
    (
        250,
        'Armazenar informações de sessão do usuário',
        1
    );

INSERT INTO
    alternativa (id_questao, perguntas, correta)
VALUES
    (250, 'Substituir servidores web', 0);

INSERT INTO
    questao (id, enunciado, pontuacao, id_disciplina)
VALUES
    (
        251,
        'O HTTPS utiliza quais protocolos para segurança?',
        30,
        10
    );

INSERT INTO
    alternativa (id_questao, perguntas, correta)
VALUES
    (251, 'FTP e DNS', 0);

INSERT INTO
    alternativa (id_questao, perguntas, correta)
VALUES
    (251, 'TCP e UDP', 0);

INSERT INTO
    alternativa (id_questao, perguntas, correta)
VALUES
    (251, 'NAT e ARP', 0);

INSERT INTO
    alternativa (id_questao, perguntas, correta)
VALUES
    (251, 'SSL e TLS', 1);

INSERT INTO
    questao (id, enunciado, pontuacao, id_disciplina)
VALUES
    (
        252,
        'O código de status HTTP 404 indica:',
        30,
        10
    );

INSERT INTO
    alternativa (id_questao, perguntas, correta)
VALUES
    (252, 'Sucesso na requisição', 0);

INSERT INTO
    alternativa (id_questao, perguntas, correta)
VALUES
    (252, 'Recurso não encontrado', 1);

INSERT INTO
    alternativa (id_questao, perguntas, correta)
VALUES
    (252, 'Erro interno do servidor', 0);

INSERT INTO
    alternativa (id_questao, perguntas, correta)
VALUES
    (252, 'Acesso autorizado', 0);

INSERT INTO
    questao (id, enunciado, pontuacao, id_disciplina)
VALUES
    (
        253,
        'O protocolo UDP se diferencia do TCP porque:',
        30,
        10
    );

INSERT INTO
    alternativa (id_questao, perguntas, correta)
VALUES
    (253, 'Utiliza criptografia obrigatória', 0);

INSERT INTO
    alternativa (id_questao, perguntas, correta)
VALUES
    (253, 'Não trabalha com portas', 0);

INSERT INTO
    alternativa (id_questao, perguntas, correta)
VALUES
    (
        253,
        'Não garante entrega confiável dos dados',
        1
    );

INSERT INTO
    alternativa (id_questao, perguntas, correta)
VALUES
    (253, 'Funciona apenas na web', 0);

INSERT INTO
    questao (id, enunciado, pontuacao, id_disciplina)
VALUES
    (254, 'O Wireshark é utilizado para:', 30, 10);

INSERT INTO
    alternativa (id_questao, perguntas, correta)
VALUES
    (254, 'Criar páginas HTML', 0);

INSERT INTO
    alternativa (id_questao, perguntas, correta)
VALUES
    (254, 'Desenvolver bancos de dados', 0);

INSERT INTO
    alternativa (id_questao, perguntas, correta)
VALUES
    (254, 'Configurar impressoras', 0);

INSERT INTO
    alternativa (id_questao, perguntas, correta)
VALUES
    (254, 'Capturar e analisar tráfego de rede', 1);

INSERT INTO
    questao (id, enunciado, pontuacao, id_disciplina)
VALUES
    (
        255,
        'O conceito de Stateless no HTTP significa que:',
        30,
        10
    );

INSERT INTO
    alternativa (id_questao, perguntas, correta)
VALUES
    (255, 'O navegador não usa cookies', 0);

INSERT INTO
    alternativa (id_questao, perguntas, correta)
VALUES
    (
        255,
        'O protocolo não armazena estado entre requisições',
        1
    );

INSERT INTO
    alternativa (id_questao, perguntas, correta)
VALUES
    (
        255,
        'O servidor sempre salva informações do usuário',
        0
    );

INSERT INTO
    alternativa (id_questao, perguntas, correta)
VALUES
    (255, 'O HTTP não utiliza cabeçalhos', 0);

INSERT INTO
    questao (id, enunciado, pontuacao, id_disciplina)
VALUES
    (256, 'O que é uma API REST?', 10, 16);

INSERT INTO
    alternativa (id_questao, perguntas, correta)
VALUES
    (256, 'Sistema operacional mobile', 0);

INSERT INTO
    alternativa (id_questao, perguntas, correta)
VALUES
    (
        256,
        'Interface para comunicação entre sistemas',
        1
    );

INSERT INTO
    alternativa (id_questao, perguntas, correta)
VALUES
    (256, 'Banco de dados relacional', 0);

INSERT INTO
    alternativa (id_questao, perguntas, correta)
VALUES
    (256, 'Linguagem de programação', 0);

INSERT INTO
    questao (id, enunciado, pontuacao, id_disciplina)
VALUES
    (257, 'O Bluetooth é utilizado para:', 10, 16);

INSERT INTO
    alternativa (id_questao, perguntas, correta)
VALUES
    (257, 'Comunicação sem fio entre dispositivos', 1);

INSERT INTO
    alternativa (id_questao, perguntas, correta)
VALUES
    (257, 'Desenvolver bancos de dados', 0);

INSERT INTO
    alternativa (id_questao, perguntas, correta)
VALUES
    (257, 'Editar imagens digitais', 0);

INSERT INTO
    alternativa (id_questao, perguntas, correta)
VALUES
    (257, 'Criar páginas web', 0);

INSERT INTO
    questao (id, enunciado, pontuacao, id_disciplina)
VALUES
    (
        258,
        'Qual recurso do smartphone permite tirar fotos em aplicativos?',
        10,
        16
    );

INSERT INTO
    alternativa (id_questao, perguntas, correta)
VALUES
    (258, 'GPS', 0);

INSERT INTO
    alternativa (id_questao, perguntas, correta)
VALUES
    (258, 'Bluetooth', 0);

INSERT INTO
    alternativa (id_questao, perguntas, correta)
VALUES
    (258, 'Câmera', 1);

INSERT INTO
    alternativa (id_questao, perguntas, correta)
VALUES
    (258, 'Sensor de proximidade', 0);

INSERT INTO
    questao (id, enunciado, pontuacao, id_disciplina)
VALUES
    (
        259,
        'O GPS em aplicativos mobile é utilizado para:',
        10,
        16
    );

INSERT INTO
    alternativa (id_questao, perguntas, correta)
VALUES
    (259, 'Controle de memória RAM', 0);

INSERT INTO
    alternativa (id_questao, perguntas, correta)
VALUES
    (259, 'Criação de tabelas', 0);

INSERT INTO
    alternativa (id_questao, perguntas, correta)
VALUES
    (259, 'Edição de textos', 0);

INSERT INTO
    alternativa (id_questao, perguntas, correta)
VALUES
    (259, 'Localização e mapas', 1);

INSERT INTO
    questao (id, enunciado, pontuacao, id_disciplina)
VALUES
    (
        260,
        'O SMS em aplicativos mobile está relacionado com:',
        10,
        16
    );

INSERT INTO
    alternativa (id_questao, perguntas, correta)
VALUES
    (260, 'Redes sociais apenas', 0);

INSERT INTO
    alternativa (id_questao, perguntas, correta)
VALUES
    (260, 'Banco de dados', 0);

INSERT INTO
    alternativa (id_questao, perguntas, correta)
VALUES
    (260, 'Impressão de documentos', 0);

INSERT INTO
    alternativa (id_questao, perguntas, correta)
VALUES
    (260, 'Mensagens de texto', 1);

INSERT INTO
    questao (id, enunciado, pontuacao, id_disciplina)
VALUES
    (
        261,
        'O consumo de APIs REST permite que aplicativos:',
        20,
        16
    );

INSERT INTO
    alternativa (id_questao, perguntas, correta)
VALUES
    (261, 'Funcionem apenas offline', 0);

INSERT INTO
    alternativa (id_questao, perguntas, correta)
VALUES
    (261, 'Eliminem o uso da internet', 0);

INSERT INTO
    alternativa (id_questao, perguntas, correta)
VALUES
    (
        261,
        'Troquem informações com servidores e sistemas externos',
        1
    );

INSERT INTO
    alternativa (id_questao, perguntas, correta)
VALUES
    (261, 'Substituam bancos de dados', 0);

INSERT INTO
    questao (id, enunciado, pontuacao, id_disciplina)
VALUES
    (
        262,
        'A comunicação TCP full-duplex permite:',
        20,
        16
    );

INSERT INTO
    alternativa (id_questao, perguntas, correta)
VALUES
    (262, 'Apenas envio de mensagens', 0);

INSERT INTO
    alternativa (id_questao, perguntas, correta)
VALUES
    (
        262,
        'Comunicação sem internet obrigatoriamente',
        0
    );

INSERT INTO
    alternativa (id_questao, perguntas, correta)
VALUES
    (
        262,
        'Troca de dados nos dois sentidos simultaneamente',
        1
    );

INSERT INTO
    alternativa (id_questao, perguntas, correta)
VALUES
    (262, 'Apenas recebimento de mensagens', 0);

INSERT INTO
    questao (id, enunciado, pontuacao, id_disciplina)
VALUES
    (
        263,
        'A autenticação em aplicativos mobile serve para:',
        20,
        16
    );

INSERT INTO
    alternativa (id_questao, perguntas, correta)
VALUES
    (263, 'Criar animações', 0);

INSERT INTO
    alternativa (id_questao, perguntas, correta)
VALUES
    (263, 'Verificar a identidade do usuário', 1);

INSERT INTO
    alternativa (id_questao, perguntas, correta)
VALUES
    (263, 'Editar imagens', 0);

INSERT INTO
    alternativa (id_questao, perguntas, correta)
VALUES
    (263, 'Configurar sensores', 0);

INSERT INTO
    questao (id, enunciado, pontuacao, id_disciplina)
VALUES
    (
        264,
        'Sensores em smartphones podem ser usados para:',
        20,
        16
    );

INSERT INTO
    alternativa (id_questao, perguntas, correta)
VALUES
    (264, 'Melhorar impressões gráficas', 0);

INSERT INTO
    alternativa (id_questao, perguntas, correta)
VALUES
    (264, 'Criar bancos de dados', 0);

INSERT INTO
    alternativa (id_questao, perguntas, correta)
VALUES
    (
        264,
        'Detectar movimento e orientação do aparelho',
        1
    );

INSERT INTO
    alternativa (id_questao, perguntas, correta)
VALUES
    (264, 'Excluir aplicativos automaticamente', 0);

INSERT INTO
    questao (id, enunciado, pontuacao, id_disciplina)
VALUES
    (
        265,
        'O empacotamento de aplicativos é o processo de:',
        20,
        16
    );

INSERT INTO
    alternativa (id_questao, perguntas, correta)
VALUES
    (265, 'Criar bancos de dados relacionais', 0);

INSERT INTO
    alternativa (id_questao, perguntas, correta)
VALUES
    (265, 'Configurar roteadores', 0);

INSERT INTO
    alternativa (id_questao, perguntas, correta)
VALUES
    (265, 'Desenvolver hardware mobile', 0);

INSERT INTO
    alternativa (id_questao, perguntas, correta)
VALUES
    (
        265,
        'Preparar o aplicativo para instalação e distribuição',
        1
    );

INSERT INTO
    questao (id, enunciado, pontuacao, id_disciplina)
VALUES
    (
        266,
        'A integração via Bluetooth com dispositivos embarcados permite:',
        30,
        16
    );

INSERT INTO
    alternativa (id_questao, perguntas, correta)
VALUES
    (
        266,
        'Comunicação entre aplicativos e equipamentos eletrônicos externos',
        1
    );

INSERT INTO
    alternativa (id_questao, perguntas, correta)
VALUES
    (266, 'Substituição de APIs REST', 0);

INSERT INTO
    alternativa (id_questao, perguntas, correta)
VALUES
    (266, 'Criação de redes sociais', 0);

INSERT INTO
    alternativa (id_questao, perguntas, correta)
VALUES
    (266, 'Exclusão automática de arquivos', 0);

INSERT INTO
    questao (id, enunciado, pontuacao, id_disciplina)
VALUES
    (
        267,
        'APIs REST normalmente utilizam qual protocolo para comunicação?',
        30,
        16
    );

INSERT INTO
    alternativa (id_questao, perguntas, correta)
VALUES
    (267, 'SMTP', 0);

INSERT INTO
    alternativa (id_questao, perguntas, correta)
VALUES
    (267, 'FTP', 0);

INSERT INTO
    alternativa (id_questao, perguntas, correta)
VALUES
    (267, 'SSH', 0);

INSERT INTO
    alternativa (id_questao, perguntas, correta)
VALUES
    (267, 'HTTP', 1);

INSERT INTO
    questao (id, enunciado, pontuacao, id_disciplina)
VALUES
    (
        268,
        'O uso de autenticação em aplicativos mobile ajuda a:',
        30,
        16
    );

INSERT INTO
    alternativa (id_questao, perguntas, correta)
VALUES
    (268, 'Desenvolver placas eletrônicas', 0);

INSERT INTO
    alternativa (id_questao, perguntas, correta)
VALUES
    (268, 'Criar imagens vetoriais', 0);

INSERT INTO
    alternativa (id_questao, perguntas, correta)
VALUES
    (
        268,
        'Melhorar a segurança de acesso aos sistemas',
        1
    );

INSERT INTO
    alternativa (id_questao, perguntas, correta)
VALUES
    (268, 'Configurar impressoras', 0);

INSERT INTO
    questao (id, enunciado, pontuacao, id_disciplina)
VALUES
    (
        269,
        'A utilização de mapas em aplicativos geralmente depende de:',
        30,
        16
    );

INSERT INTO
    alternativa (id_questao, perguntas, correta)
VALUES
    (
        269,
        'Serviços de geolocalização e APIs de mapas',
        1
    );

INSERT INTO
    alternativa (id_questao, perguntas, correta)
VALUES
    (269, 'Planilhas eletrônicas', 0);

INSERT INTO
    alternativa (id_questao, perguntas, correta)
VALUES
    (269, 'Sistemas de impressão', 0);

INSERT INTO
    alternativa (id_questao, perguntas, correta)
VALUES
    (269, 'Cabos HDMI', 0);

INSERT INTO
    questao (id, enunciado, pontuacao, id_disciplina)
VALUES
    (
        270,
        'O recurso de orientação em smartphones utiliza principalmente:',
        30,
        16
    );

INSERT INTO
    alternativa (id_questao, perguntas, correta)
VALUES
    (270, 'Monitores CRT', 0);

INSERT INTO
    alternativa (id_questao, perguntas, correta)
VALUES
    (
        270,
        'Sensores como acelerômetro e giroscópio',
        1
    );

INSERT INTO
    alternativa (id_questao, perguntas, correta)
VALUES
    (270, 'Impressoras térmicas', 0);

INSERT INTO
    alternativa (id_questao, perguntas, correta)
VALUES
    (270, 'Fontes ATX', 0);

INSERT INTO
    questao (id, enunciado, pontuacao, id_disciplina)
VALUES
    (
        271,
        'O que significa SPA em desenvolvimento web?',
        10,
        17
    );

INSERT INTO
    alternativa (id_questao, perguntas, correta)
VALUES
    (271, 'Single Page Application', 1);

INSERT INTO
    alternativa (id_questao, perguntas, correta)
VALUES
    (271, 'Simple Program Access', 0);

INSERT INTO
    alternativa (id_questao, perguntas, correta)
VALUES
    (271, 'System Page Application', 0);

INSERT INTO
    alternativa (id_questao, perguntas, correta)
VALUES
    (271, 'Secure Page Area', 0);

INSERT INTO
    questao (id, enunciado, pontuacao, id_disciplina)
VALUES
    (
        272,
        'Em aplicações SPA, o roteamento é responsável por:',
        10,
        17
    );

INSERT INTO
    alternativa (id_questao, perguntas, correta)
VALUES
    (272, 'Criação de banco de dados', 0);

INSERT INTO
    alternativa (id_questao, perguntas, correta)
VALUES
    (272, 'Configuração de hardware', 0);

INSERT INTO
    alternativa (id_questao, perguntas, correta)
VALUES
    (272, 'Navegação entre páginas e componentes', 1);

INSERT INTO
    alternativa (id_questao, perguntas, correta)
VALUES
    (272, 'Desenvolvimento de drivers', 0);

INSERT INTO
    questao (id, enunciado, pontuacao, id_disciplina)
VALUES
    (
        273,
        'O que são componentes em frameworks web?',
        10,
        17
    );

INSERT INTO
    alternativa (id_questao, perguntas, correta)
VALUES
    (273, 'Arquivos de áudio', 0);

INSERT INTO
    alternativa (id_questao, perguntas, correta)
VALUES
    (273, 'Sistemas operacionais', 0);

INSERT INTO
    alternativa (id_questao, perguntas, correta)
VALUES
    (273, 'Protocolos de rede', 0);

INSERT INTO
    alternativa (id_questao, perguntas, correta)
VALUES
    (273, 'Partes reutilizáveis da interface', 1);

INSERT INTO
    questao (id, enunciado, pontuacao, id_disciplina)
VALUES
    (
        274,
        'Qual recurso é usado para armazenar informações do usuário no navegador?',
        10,
        17
    );

INSERT INTO
    alternativa (id_questao, perguntas, correta)
VALUES
    (274, 'Cookies', 1);

INSERT INTO
    alternativa (id_questao, perguntas, correta)
VALUES
    (274, 'Impressoras', 0);

INSERT INTO
    alternativa (id_questao, perguntas, correta)
VALUES
    (274, 'Compiladores', 0);

INSERT INTO
    alternativa (id_questao, perguntas, correta)
VALUES
    (274, 'Switches', 0);

INSERT INTO
    questao (id, enunciado, pontuacao, id_disciplina)
VALUES
    (275, 'APIs REST são utilizadas para:', 10, 17);

INSERT INTO
    alternativa (id_questao, perguntas, correta)
VALUES
    (275, 'Criar imagens digitais', 0);

INSERT INTO
    alternativa (id_questao, perguntas, correta)
VALUES
    (
        275,
        'Comunicação entre aplicações e serviços',
        1
    );

INSERT INTO
    alternativa (id_questao, perguntas, correta)
VALUES
    (275, 'Configurar redes locais', 0);

INSERT INTO
    alternativa (id_questao, perguntas, correta)
VALUES
    (275, 'Desenvolver hardware', 0);

INSERT INTO
    questao (id, enunciado, pontuacao, id_disciplina)
VALUES
    (
        276,
        'O gerenciamento de estados em aplicações SPA serve para:',
        20,
        17
    );

INSERT INTO
    alternativa (id_questao, perguntas, correta)
VALUES
    (276, 'Criar bancos de dados relacionais', 0);

INSERT INTO
    alternativa (id_questao, perguntas, correta)
VALUES
    (
        276,
        'Controlar dados e comportamento da interface',
        1
    );

INSERT INTO
    alternativa (id_questao, perguntas, correta)
VALUES
    (276, 'Configurar roteadores físicos', 0);

INSERT INTO
    alternativa (id_questao, perguntas, correta)
VALUES
    (276, 'Editar arquivos multimídia', 0);

INSERT INTO
    questao (id, enunciado, pontuacao, id_disciplina)
VALUES
    (277, 'O que é renderização de HTML?', 20, 17);

INSERT INTO
    alternativa (id_questao, perguntas, correta)
VALUES
    (
        277,
        'Processo de criar redes de computadores',
        0
    );

INSERT INTO
    alternativa (id_questao, perguntas, correta)
VALUES
    (277, 'Processo de configurar servidores FTP', 0);

INSERT INTO
    alternativa (id_questao, perguntas, correta)
VALUES
    (
        277,
        'Processo de exibir conteúdo visual no navegador',
        1
    );

INSERT INTO
    alternativa (id_questao, perguntas, correta)
VALUES
    (277, 'Processo de montar hardware', 0);

INSERT INTO
    questao (id, enunciado, pontuacao, id_disciplina)
VALUES
    (
        278,
        'Validação de formulários é utilizada para:',
        20,
        17
    );

INSERT INTO
    alternativa (id_questao, perguntas, correta)
VALUES
    (
        278,
        'Garantir que os dados preenchidos estejam corretos',
        1
    );

INSERT INTO
    alternativa (id_questao, perguntas, correta)
VALUES
    (278, 'Criar sistemas operacionais', 0);

INSERT INTO
    alternativa (id_questao, perguntas, correta)
VALUES
    (278, 'Melhorar velocidade da internet', 0);

INSERT INTO
    alternativa (id_questao, perguntas, correta)
VALUES
    (278, 'Configurar impressoras', 0);

INSERT INTO
    questao (id, enunciado, pontuacao, id_disciplina)
VALUES
    (279, 'Um CMS é um sistema voltado para:', 20, 17);

INSERT INTO
    alternativa (id_questao, perguntas, correta)
VALUES
    (279, 'Controle de hardware', 0);

INSERT INTO
    alternativa (id_questao, perguntas, correta)
VALUES
    (279, 'Desenvolvimento de drivers', 0);

INSERT INTO
    alternativa (id_questao, perguntas, correta)
VALUES
    (279, 'Criação de placas eletrônicas', 0);

INSERT INTO
    alternativa (id_questao, perguntas, correta)
VALUES
    (279, 'Gerenciamento de conteúdo digital', 1);

INSERT INTO
    questao (id, enunciado, pontuacao, id_disciplina)
VALUES
    (280, 'Sessões de usuário permitem:', 20, 17);

INSERT INTO
    alternativa (id_questao, perguntas, correta)
VALUES
    (280, 'Excluir automaticamente cookies', 0);

INSERT INTO
    alternativa (id_questao, perguntas, correta)
VALUES
    (280, 'Criar bancos de dados NoSQL', 0);

INSERT INTO
    alternativa (id_questao, perguntas, correta)
VALUES
    (280, 'Configurar sensores físicos', 0);

INSERT INTO
    alternativa (id_questao, perguntas, correta)
VALUES
    (
        280,
        'Manter informações temporárias do usuário durante o uso do sistema',
        1
    );

INSERT INTO
    questao (id, enunciado, pontuacao, id_disciplina)
VALUES
    (
        281,
        'O Hash de autenticação é utilizado para:',
        30,
        17
    );

INSERT INTO
    alternativa (id_questao, perguntas, correta)
VALUES
    (
        281,
        'Verificar identidade e segurança de acesso',
        1
    );

INSERT INTO
    alternativa (id_questao, perguntas, correta)
VALUES
    (281, 'Editar componentes gráficos', 0);

INSERT INTO
    alternativa (id_questao, perguntas, correta)
VALUES
    (281, 'Criar tabelas relacionais', 0);

INSERT INTO
    alternativa (id_questao, perguntas, correta)
VALUES
    (281, 'Melhorar desempenho de hardware', 0);

INSERT INTO
    questao (id, enunciado, pontuacao, id_disciplina)
VALUES
    (
        282,
        'A autenticação em aplicações web serve para:',
        30,
        17
    );

INSERT INTO
    alternativa (id_questao, perguntas, correta)
VALUES
    (282, 'Criar animações', 0);

INSERT INTO
    alternativa (id_questao, perguntas, correta)
VALUES
    (282, 'Confirmar a identidade do usuário', 1);

INSERT INTO
    alternativa (id_questao, perguntas, correta)
VALUES
    (282, 'Desenvolver bancos de dados', 0);

INSERT INTO
    alternativa (id_questao, perguntas, correta)
VALUES
    (282, 'Configurar dispositivos físicos', 0);

INSERT INTO
    questao (id, enunciado, pontuacao, id_disciplina)
VALUES
    (
        283,
        'A autorização em sistemas web define:',
        30,
        17
    );

INSERT INTO
    alternativa (id_questao, perguntas, correta)
VALUES
    (283, 'Velocidade da conexão de rede', 0);

INSERT INTO
    alternativa (id_questao, perguntas, correta)
VALUES
    (283, 'Configuração de periféricos', 0);

INSERT INTO
    alternativa (id_questao, perguntas, correta)
VALUES
    (
        283,
        'Quais recursos cada usuário pode acessar',
        1
    );

INSERT INTO
    alternativa (id_questao, perguntas, correta)
VALUES
    (283, 'Tipos de memória RAM', 0);

INSERT INTO
    questao (id, enunciado, pontuacao, id_disciplina)
VALUES
    (
        284,
        'Testes automatizados têm como principal objetivo:',
        30,
        17
    );

INSERT INTO
    alternativa (id_questao, perguntas, correta)
VALUES
    (284, 'Criar interfaces gráficas', 0);

INSERT INTO
    alternativa (id_questao, perguntas, correta)
VALUES
    (284, 'Configurar servidores físicos', 0);

INSERT INTO
    alternativa (id_questao, perguntas, correta)
VALUES
    (284, 'Montar redes locais', 0);

INSERT INTO
    alternativa (id_questao, perguntas, correta)
VALUES
    (
        284,
        'Verificar automaticamente o funcionamento do sistema',
        1
    );

INSERT INTO
    questao (id, enunciado, pontuacao, id_disciplina)
VALUES
    (
        285,
        'O acesso a dados via APIs REST geralmente utiliza:',
        30,
        17
    );

INSERT INTO
    alternativa (id_questao, perguntas, correta)
VALUES
    (285, 'Requisições HTTP', 1);

INSERT INTO
    alternativa (id_questao, perguntas, correta)
VALUES
    (285, 'Cabos HDMI', 0);

INSERT INTO
    alternativa (id_questao, perguntas, correta)
VALUES
    (285, 'Protocolos Bluetooth apenas', 0);

INSERT INTO
    alternativa (id_questao, perguntas, correta)
VALUES
    (285, 'Linguagem Assembly', 0);

INSERT INTO
    questao (id, enunciado, pontuacao, id_disciplina)
VALUES
    (
        286,
        'Recursos de orientação em smartphones utilizam principalmente:',
        30,
        17
    );

INSERT INTO
    alternativa (id_questao, perguntas, correta)
VALUES
    (286, 'Impressoras térmicas', 0);

INSERT INTO
    alternativa (id_questao, perguntas, correta)
VALUES
    (286, 'Cabos de rede', 0);

INSERT INTO
    alternativa (id_questao, perguntas, correta)
VALUES
    (
        286,
        'Sensores como acelerômetro e giroscópio',
        1
    );

INSERT INTO
    alternativa (id_questao, perguntas, correta)
VALUES
    (286, 'Processadores gráficos externos', 0);

INSERT INTO
    questao (id, enunciado, pontuacao, id_disciplina)
VALUES
    (
        287,
        'O acesso a mapas em aplicativos geralmente depende de:',
        30,
        17
    );

INSERT INTO
    alternativa (id_questao, perguntas, correta)
VALUES
    (287, 'Serviços de geolocalização', 1);

INSERT INTO
    alternativa (id_questao, perguntas, correta)
VALUES
    (287, 'Planilhas eletrônicas', 0);

INSERT INTO
    alternativa (id_questao, perguntas, correta)
VALUES
    (287, 'Editores de imagem', 0);

INSERT INTO
    alternativa (id_questao, perguntas, correta)
VALUES
    (287, 'Compiladores de código', 0);

INSERT INTO
    questao (id, enunciado, pontuacao, id_disciplina)
VALUES
    (
        288,
        'A distribuição de aplicativos mobile normalmente ocorre por meio de:',
        30,
        17
    );

INSERT INTO
    alternativa (id_questao, perguntas, correta)
VALUES
    (288, 'Impressoras de rede', 0);

INSERT INTO
    alternativa (id_questao, perguntas, correta)
VALUES
    (288, 'Sistemas embarcados', 0);

INSERT INTO
    alternativa (id_questao, perguntas, correta)
VALUES
    (288, 'Lojas de aplicativos digitais', 1);

INSERT INTO
    alternativa (id_questao, perguntas, correta)
VALUES
    (288, 'Linguagens de marcação', 0);

INSERT INTO
    questao (id, enunciado, pontuacao, id_disciplina)
VALUES
    (289, 'O que é linguagem formal?', 10, 23);

INSERT INTO
    alternativa (id_questao, perguntas, correta)
VALUES
    (289, 'Linguagem usada apenas em jogos', 0);

INSERT INTO
    alternativa (id_questao, perguntas, correta)
VALUES
    (
        289,
        'Linguagem usada em situações profissionais e acadêmicas',
        1
    );

INSERT INTO
    alternativa (id_questao, perguntas, correta)
VALUES
    (289, 'Linguagem com gírias e abreviações', 0);

INSERT INTO
    alternativa (id_questao, perguntas, correta)
VALUES
    (289, 'Linguagem sem regras gramaticais', 0);

INSERT INTO
    questao (id, enunciado, pontuacao, id_disciplina)
VALUES
    (290, 'O que é um currículo?', 10, 23);

INSERT INTO
    alternativa (id_questao, perguntas, correta)
VALUES
    (290, 'Programa de edição de imagens', 0);

INSERT INTO
    alternativa (id_questao, perguntas, correta)
VALUES
    (290, 'Banco de dados empresarial', 0);

INSERT INTO
    alternativa (id_questao, perguntas, correta)
VALUES
    (
        290,
        'Documento com experiências e qualificações profissionais',
        1
    );

INSERT INTO
    alternativa (id_questao, perguntas, correta)
VALUES
    (290, 'Sistema operacional', 0);

INSERT INTO
    questao (id, enunciado, pontuacao, id_disciplina)
VALUES
    (
        291,
        'Qual documento é usado para comunicação interna em empresas?',
        10,
        23
    );

INSERT INTO
    alternativa (id_questao, perguntas, correta)
VALUES
    (291, 'Receita médica', 0);

INSERT INTO
    alternativa (id_questao, perguntas, correta)
VALUES
    (291, 'Panfleto publicitário', 0);

INSERT INTO
    alternativa (id_questao, perguntas, correta)
VALUES
    (291, 'Cartaz informativo', 0);

INSERT INTO
    alternativa (id_questao, perguntas, correta)
VALUES
    (291, 'Memorando', 1);

INSERT INTO
    questao (id, enunciado, pontuacao, id_disciplina)
VALUES
    (292, 'O que significa coesão textual?', 10, 23);

INSERT INTO
    alternativa (id_questao, perguntas, correta)
VALUES
    (292, 'Ligação adequada entre partes do texto', 1);

INSERT INTO
    alternativa (id_questao, perguntas, correta)
VALUES
    (292, 'Quantidade de páginas de um texto', 0);

INSERT INTO
    alternativa (id_questao, perguntas, correta)
VALUES
    (292, 'Uso exclusivo de palavras técnicas', 0);

INSERT INTO
    alternativa (id_questao, perguntas, correta)
VALUES
    (292, 'Organização de imagens em slides', 0);

INSERT INTO
    questao (id, enunciado, pontuacao, id_disciplina)
VALUES
    (293, 'O que é um relatório técnico?', 10, 23);

INSERT INTO
    alternativa (id_questao, perguntas, correta)
VALUES
    (293, 'Texto literário de ficção', 0);

INSERT INTO
    alternativa (id_questao, perguntas, correta)
VALUES
    (
        293,
        'Documento que apresenta informações técnicas de forma organizada',
        1
    );

INSERT INTO
    alternativa (id_questao, perguntas, correta)
VALUES
    (293, 'Página inicial de um site', 0);

INSERT INTO
    alternativa (id_questao, perguntas, correta)
VALUES
    (293, 'Sistema de armazenamento em nuvem', 0);

INSERT INTO
    questao (id, enunciado, pontuacao, id_disciplina)
VALUES
    (
        294,
        'O objetivo da leitura instrumental é:',
        20,
        23
    );

INSERT INTO
    alternativa (id_questao, perguntas, correta)
VALUES
    (294, 'Desenvolver jogos digitais', 0);

INSERT INTO
    alternativa (id_questao, perguntas, correta)
VALUES
    (294, 'Configurar computadores', 0);

INSERT INTO
    alternativa (id_questao, perguntas, correta)
VALUES
    (
        294,
        'Identificar informações importantes em textos técnicos',
        1
    );

INSERT INTO
    alternativa (id_questao, perguntas, correta)
VALUES
    (294, 'Criar bancos de dados', 0);

INSERT INTO
    questao (id, enunciado, pontuacao, id_disciplina)
VALUES
    (
        295,
        'O que são indicadores linguísticos?',
        20,
        23
    );

INSERT INTO
    alternativa (id_questao, perguntas, correta)
VALUES
    (295, 'Equipamentos de informática', 0);

INSERT INTO
    alternativa (id_questao, perguntas, correta)
VALUES
    (
        295,
        'Elementos relacionados à estrutura da língua',
        1
    );

INSERT INTO
    alternativa (id_questao, perguntas, correta)
VALUES
    (295, 'Sistemas operacionais', 0);

INSERT INTO
    alternativa (id_questao, perguntas, correta)
VALUES
    (295, 'Protocolos de rede', 0);

INSERT INTO
    questao (id, enunciado, pontuacao, id_disciplina)
VALUES
    (
        296,
        'Qual é a função das palavras-chave em um texto técnico?',
        20,
        23
    );

INSERT INTO
    alternativa (id_questao, perguntas, correta)
VALUES
    (
        296,
        'Destacar os temas principais do conteúdo',
        1
    );

INSERT INTO
    alternativa (id_questao, perguntas, correta)
VALUES
    (296, 'Decorar o texto visualmente', 0);

INSERT INTO
    alternativa (id_questao, perguntas, correta)
VALUES
    (296, 'Aumentar o tamanho do documento', 0);

INSERT INTO
    alternativa (id_questao, perguntas, correta)
VALUES
    (296, 'Substituir referências bibliográficas', 0);

INSERT INTO
    questao (id, enunciado, pontuacao, id_disciplina)
VALUES
    (297, 'O que é coerência textual?', 20, 23);

INSERT INTO
    alternativa (id_questao, perguntas, correta)
VALUES
    (297, 'Uso obrigatório de gráficos', 0);

INSERT INTO
    alternativa (id_questao, perguntas, correta)
VALUES
    (297, 'Quantidade de linhas do documento', 0);

INSERT INTO
    alternativa (id_questao, perguntas, correta)
VALUES
    (297, 'Organização de imagens digitais', 0);

INSERT INTO
    alternativa (id_questao, perguntas, correta)
VALUES
    (
        297,
        'Relação lógica e compreensível entre as ideias do texto',
        1
    );

INSERT INTO
    questao (id, enunciado, pontuacao, id_disciplina)
VALUES
    (
        298,
        'A carta-currículo tem como finalidade:',
        20,
        23
    );

INSERT INTO
    alternativa (id_questao, perguntas, correta)
VALUES
    (298, 'Criar contratos digitais', 0);

INSERT INTO
    alternativa (id_questao, perguntas, correta)
VALUES
    (298, 'Elaborar planilhas financeiras', 0);

INSERT INTO
    alternativa (id_questao, perguntas, correta)
VALUES
    (
        298,
        'Apresentar o candidato e demonstrar interesse pela vaga',
        1
    );

INSERT INTO
    alternativa (id_questao, perguntas, correta)
VALUES
    (298, 'Configurar sistemas operacionais', 0);

INSERT INTO
    questao (id, enunciado, pontuacao, id_disciplina)
VALUES
    (
        299,
        'O que caracteriza um texto técnico-científico?',
        30,
        23
    );

INSERT INTO
    alternativa (id_questao, perguntas, correta)
VALUES
    (
        299,
        'Uso de linguagem objetiva, clara e especializada',
        1
    );

INSERT INTO
    alternativa (id_questao, perguntas, correta)
VALUES
    (299, 'Uso predominante de linguagem informal', 0);

INSERT INTO
    alternativa (id_questao, perguntas, correta)
VALUES
    (
        299,
        'Presença obrigatória de ilustrações artísticas',
        0
    );

INSERT INTO
    alternativa (id_questao, perguntas, correta)
VALUES
    (299, 'Estrutura baseada apenas em diálogos', 0);

INSERT INTO
    questao (id, enunciado, pontuacao, id_disciplina)
VALUES
    (
        300,
        'As referências bibliográficas servem para:',
        30,
        23
    );

INSERT INTO
    alternativa (id_questao, perguntas, correta)
VALUES
    (300, 'Criar efeitos visuais em apresentações', 0);

INSERT INTO
    alternativa (id_questao, perguntas, correta)
VALUES
    (300, 'Configurar aplicativos mobile', 0);

INSERT INTO
    alternativa (id_questao, perguntas, correta)
VALUES
    (
        300,
        'Identificar as fontes utilizadas em um trabalho',
        1
    );

INSERT INTO
    alternativa (id_questao, perguntas, correta)
VALUES
    (300, 'Desenvolver interfaces gráficas', 0);

INSERT INTO
    questao (id, enunciado, pontuacao, id_disciplina)
VALUES
    (
        301,
        'O glossário técnico é utilizado para:',
        30,
        23
    );

INSERT INTO
    alternativa (id_questao, perguntas, correta)
VALUES
    (
        301,
        'Explicar termos específicos de determinada área',
        1
    );

INSERT INTO
    alternativa (id_questao, perguntas, correta)
VALUES
    (301, 'Organizar imagens digitais', 0);

INSERT INTO
    alternativa (id_questao, perguntas, correta)
VALUES
    (301, 'Configurar redes de computadores', 0);

INSERT INTO
    alternativa (id_questao, perguntas, correta)
VALUES
    (301, 'Criar bancos de dados relacionais', 0);

INSERT INTO
    questao (id, enunciado, pontuacao, id_disciplina)
VALUES
    (
        302,
        'Na apresentação oral técnico-científica, o planejamento é importante para:',
        30,
        23
    );

INSERT INTO
    alternativa (id_questao, perguntas, correta)
VALUES
    (302, 'Melhorar velocidade da internet', 0);

INSERT INTO
    alternativa (id_questao, perguntas, correta)
VALUES
    (
        302,
        'Organizar conteúdo, tempo e recursos da apresentação',
        1
    );

INSERT INTO
    alternativa (id_questao, perguntas, correta)
VALUES
    (302, 'Desenvolver sistemas embarcados', 0);

INSERT INTO
    alternativa (id_questao, perguntas, correta)
VALUES
    (302, 'Configurar servidores web', 0);

INSERT INTO
    questao (id, enunciado, pontuacao, id_disciplina)
VALUES
    (
        303,
        'A análise da confiabilidade das fontes busca verificar:',
        30,
        23
    );

INSERT INTO
    alternativa (id_questao, perguntas, correta)
VALUES
    (303, 'O design visual do documento', 0);

INSERT INTO
    alternativa (id_questao, perguntas, correta)
VALUES
    (303, 'O tamanho do arquivo digital', 0);

INSERT INTO
    alternativa (id_questao, perguntas, correta)
VALUES
    (
        303,
        'A velocidade de processamento do computador',
        0
    );

INSERT INTO
    alternativa (id_questao, perguntas, correta)
VALUES
    (
        303,
        'Se as informações são seguras, corretas e confiáveis',
        1
    );

INSERT INTO
    questao (id, enunciado, pontuacao, id_disciplina)
VALUES
    (
        304,
        'Qual é o objetivo do teste de software?',
        10,
        24
    );

INSERT INTO
    alternativa (id_questao, perguntas, correta)
VALUES
    (304, 'Criar componentes físicos', 0);

INSERT INTO
    alternativa (id_questao, perguntas, correta)
VALUES
    (
        304,
        'Melhorar a qualidade e identificar falhas no sistema',
        1
    );

INSERT INTO
    alternativa (id_questao, perguntas, correta)
VALUES
    (304, 'Desenvolver hardware', 0);

INSERT INTO
    alternativa (id_questao, perguntas, correta)
VALUES
    (304, 'Configurar redes locais', 0);

INSERT INTO
    questao (id, enunciado, pontuacao, id_disciplina)
VALUES
    (
        305,
        'O que significa legibilidade no código?',
        10,
        24
    );

INSERT INTO
    alternativa (id_questao, perguntas, correta)
VALUES
    (305, 'Velocidade de processamento', 0);

INSERT INTO
    alternativa (id_questao, perguntas, correta)
VALUES
    (305, 'Capacidade de armazenar arquivos', 0);

INSERT INTO
    alternativa (id_questao, perguntas, correta)
VALUES
    (305, 'Facilidade de entender o código-fonte', 1);

INSERT INTO
    alternativa (id_questao, perguntas, correta)
VALUES
    (305, 'Uso obrigatório de gráficos', 0);

INSERT INTO
    questao (id, enunciado, pontuacao, id_disciplina)
VALUES
    (306, 'O que é reutilização de código?', 10, 24);

INSERT INTO
    alternativa (id_questao, perguntas, correta)
VALUES
    (306, 'Exclusão automática de funções', 0);

INSERT INTO
    alternativa (id_questao, perguntas, correta)
VALUES
    (306, 'Criação de bancos de dados', 0);

INSERT INTO
    alternativa (id_questao, perguntas, correta)
VALUES
    (
        306,
        'Desenvolvimento de sistemas operacionais',
        0
    );

INSERT INTO
    alternativa (id_questao, perguntas, correta)
VALUES
    (
        306,
        'Aproveitamento de partes do código em outros projetos',
        1
    );

INSERT INTO
    questao (id, enunciado, pontuacao, id_disciplina)
VALUES
    (
        307,
        'A indentação no código serve para:',
        10,
        24
    );

INSERT INTO
    alternativa (id_questao, perguntas, correta)
VALUES
    (307, 'Organizar visualmente o código-fonte', 1);

INSERT INTO
    alternativa (id_questao, perguntas, correta)
VALUES
    (307, 'Melhorar conexão com internet', 0);

INSERT INTO
    alternativa (id_questao, perguntas, correta)
VALUES
    (307, 'Configurar servidores', 0);

INSERT INTO
    alternativa (id_questao, perguntas, correta)
VALUES
    (307, 'Criar tabelas relacionais', 0);

INSERT INTO
    questao (id, enunciado, pontuacao, id_disciplina)
VALUES
    (
        308,
        'O que é UX (Experiência do Usuário)?',
        10,
        24
    );

INSERT INTO
    alternativa (id_questao, perguntas, correta)
VALUES
    (308, 'Tipo de linguagem de programação', 0);

INSERT INTO
    alternativa (id_questao, perguntas, correta)
VALUES
    (
        308,
        'Qualidade da interação do usuário com o sistema',
        1
    );

INSERT INTO
    alternativa (id_questao, perguntas, correta)
VALUES
    (308, 'Modelo de banco de dados', 0);

INSERT INTO
    alternativa (id_questao, perguntas, correta)
VALUES
    (308, 'Sistema de autenticação', 0);

INSERT INTO
    questao (id, enunciado, pontuacao, id_disciplina)
VALUES
    (309, 'O que são testes funcionais?', 20, 24);

INSERT INTO
    alternativa (id_questao, perguntas, correta)
VALUES
    (309, 'Testes de velocidade da internet', 0);

INSERT INTO
    alternativa (id_questao, perguntas, correta)
VALUES
    (
        309,
        'Testes que verificam se o sistema funciona conforme esperado',
        1
    );

INSERT INTO
    alternativa (id_questao, perguntas, correta)
VALUES
    (309, 'Testes de hardware físico', 0);

INSERT INTO
    alternativa (id_questao, perguntas, correta)
VALUES
    (309, 'Testes de impressão gráfica', 0);

INSERT INTO
    questao (id, enunciado, pontuacao, id_disciplina)
VALUES
    (
        310,
        'Testes automatizados são executados:',
        20,
        24
    );

INSERT INTO
    alternativa (id_questao, perguntas, correta)
VALUES
    (310, 'Apenas manualmente', 0);

INSERT INTO
    alternativa (id_questao, perguntas, correta)
VALUES
    (310, 'Somente em servidores físicos', 0);

INSERT INTO
    alternativa (id_questao, perguntas, correta)
VALUES
    (
        310,
        'Automaticamente por ferramentas e scripts',
        1
    );

INSERT INTO
    alternativa (id_questao, perguntas, correta)
VALUES
    (310, 'Apenas em aplicativos mobile', 0);

INSERT INTO
    questao (id, enunciado, pontuacao, id_disciplina)
VALUES
    (311, 'O teste de usabilidade avalia:', 20, 24);

INSERT INTO
    alternativa (id_questao, perguntas, correta)
VALUES
    (
        311,
        'Facilidade de uso e interação do sistema',
        1
    );

INSERT INTO
    alternativa (id_questao, perguntas, correta)
VALUES
    (311, 'Velocidade da memória RAM', 0);

INSERT INTO
    alternativa (id_questao, perguntas, correta)
VALUES
    (311, 'Estrutura de redes de computadores', 0);

INSERT INTO
    alternativa (id_questao, perguntas, correta)
VALUES
    (311, 'Capacidade de impressão', 0);

INSERT INTO
    questao (id, enunciado, pontuacao, id_disciplina)
VALUES
    (
        312,
        'O desenvolvimento orientado por testes (TDD) consiste em:',
        20,
        24
    );

INSERT INTO
    alternativa (id_questao, perguntas, correta)
VALUES
    (312, 'Desenvolver sem realizar testes', 0);

INSERT INTO
    alternativa (id_questao, perguntas, correta)
VALUES
    (312, 'Utilizar apenas testes manuais', 0);

INSERT INTO
    alternativa (id_questao, perguntas, correta)
VALUES
    (312, 'Criar bancos de dados primeiro', 0);

INSERT INTO
    alternativa (id_questao, perguntas, correta)
VALUES
    (
        312,
        'Criar testes antes do desenvolvimento do código',
        1
    );

INSERT INTO
    questao (id, enunciado, pontuacao, id_disciplina)
VALUES
    (
        313,
        'A programação em par acontece quando:',
        20,
        24
    );

INSERT INTO
    alternativa (id_questao, perguntas, correta)
VALUES
    (
        313,
        'Dois computadores compartilham hardware',
        0
    );

INSERT INTO
    alternativa (id_questao, perguntas, correta)
VALUES
    (
        313,
        'Dois programadores trabalham juntos no mesmo código',
        1
    );

INSERT INTO
    alternativa (id_questao, perguntas, correta)
VALUES
    (313, 'Dois servidores utilizam o mesmo IP', 0);

INSERT INTO
    alternativa (id_questao, perguntas, correta)
VALUES
    (313, 'Dois bancos de dados são conectados', 0);

INSERT INTO
    questao (id, enunciado, pontuacao, id_disciplina)
VALUES
    (314, 'O objetivo da refatoração é:', 30, 24);

INSERT INTO
    alternativa (id_questao, perguntas, correta)
VALUES
    (314, 'Excluir funcionalidades do sistema', 0);

INSERT INTO
    alternativa (id_questao, perguntas, correta)
VALUES
    (
        314,
        'Melhorar a estrutura do código sem alterar seu funcionamento',
        1
    );

INSERT INTO
    alternativa (id_questao, perguntas, correta)
VALUES
    (314, 'Criar bancos de dados NoSQL', 0);

INSERT INTO
    alternativa (id_questao, perguntas, correta)
VALUES
    (314, 'Alterar o hardware do computador', 0);

INSERT INTO
    questao (id, enunciado, pontuacao, id_disciplina)
VALUES
    (315, 'Testes de integração verificam:', 30, 24);

INSERT INTO
    alternativa (id_questao, perguntas, correta)
VALUES
    (315, 'Velocidade da internet', 0);

INSERT INTO
    alternativa (id_questao, perguntas, correta)
VALUES
    (315, 'Apenas o design das telas', 0);

INSERT INTO
    alternativa (id_questao, perguntas, correta)
VALUES
    (
        315,
        'A comunicação entre diferentes partes do sistema',
        1
    );

INSERT INTO
    alternativa (id_questao, perguntas, correta)
VALUES
    (315, 'Configuração de periféricos', 0);

INSERT INTO
    questao (id, enunciado, pontuacao, id_disciplina)
VALUES
    (
        316,
        'Testes não funcionais analisam aspectos como:',
        30,
        24
    );

INSERT INTO
    alternativa (id_questao, perguntas, correta)
VALUES
    (316, 'Desempenho, segurança e confiabilidade', 1);

INSERT INTO
    alternativa (id_questao, perguntas, correta)
VALUES
    (316, 'Apenas aparência visual', 0);

INSERT INTO
    alternativa (id_questao, perguntas, correta)
VALUES
    (316, 'Estrutura de textos técnicos', 0);

INSERT INTO
    alternativa (id_questao, perguntas, correta)
VALUES
    (316, 'Organização de arquivos locais', 0);

INSERT INTO
    questao (id, enunciado, pontuacao, id_disciplina)
VALUES
    (
        317,
        'O modelo CMMI está relacionado com:',
        30,
        24
    );

INSERT INTO
    alternativa (id_questao, perguntas, correta)
VALUES
    (
        317,
        'Qualidade e maturidade de processos de software',
        1
    );

INSERT INTO
    alternativa (id_questao, perguntas, correta)
VALUES
    (317, 'Desenvolvimento de hardware', 0);

INSERT INTO
    alternativa (id_questao, perguntas, correta)
VALUES
    (317, 'Criação de sistemas operacionais', 0);

INSERT INTO
    alternativa (id_questao, perguntas, correta)
VALUES
    (317, 'Configuração de redes sociais', 0);

INSERT INTO
    questao (id, enunciado, pontuacao, id_disciplina)
VALUES
    (
        318,
        'A validação em testes de software busca garantir que:',
        30,
        24
    );

INSERT INTO
    alternativa (id_questao, perguntas, correta)
VALUES
    (318, 'O software funcione sem internet', 0);

INSERT INTO
    alternativa (id_questao, perguntas, correta)
VALUES
    (
        318,
        'O sistema utilize apenas banco de dados relacional',
        0
    );

INSERT INTO
    alternativa (id_questao, perguntas, correta)
VALUES
    (
        318,
        'O código tenha apenas funções matemáticas',
        0
    );

INSERT INTO
    alternativa (id_questao, perguntas, correta)
VALUES
    (
        318,
        'O produto atende às necessidades e requisitos definidos',
        1
    );

-- Stored Procedures --
DELIMITER / / -- =========================================================
-- PROCEDURES
-- =========================================================
CREATE PROCEDURE AtualizarQuiz(IN p_id INT, IN p_pontuacao INT) BEGIN
UPDATE
    quiz
SET
    pontuacao = p_pontuacao
WHERE
    id = p_id;

END / / CREATE PROCEDURE DeleteQuiz(IN p_id INT) BEGIN
DELETE FROM
    quiz
WHERE
    id = p_id;

END / / CREATE PROCEDURE SelectQuiz(IN p_id INT) BEGIN
SELECT
    *
FROM
    quiz
WHERE
    id = p_id;

END / / CREATE PROCEDURE Escolher_Disciplina_por_Curso(IN p_id_curso INT) BEGIN
SELECT
    id,
    nome,
    sigla
FROM
    disciplina
WHERE
    id_curso = p_id_curso;

END / / CREATE PROCEDURE Consultar_disciplina_por_modulo (IN p_id_curso INT, IN p_modulo INT) BEGIN
SELECT
    nome,
    sigla
FROM
    disciplina
WHERE
    id_curso = p_id_curso
    and modulo = p_modulo;

END / / CREATE PROCEDURE Escolher_uma_Alternativa_Questao(IN p_id_questao INT) BEGIN
SELECT
    id,
    enunciado,
    correta
FROM
    alternativa
WHERE
    id_questao = p_id_questao;

END / / CREATE PROCEDURE Escolher_cinco_questoes_Aleatoria_Disciplina(IN p_id_disciplina INT) BEGIN
SELECT
    id,
    enunciado,
    pontuacao
FROM
    questao
WHERE
    id_disciplina = p_id_disciplina
ORDER BY
    RAND()
LIMIT
    5;

END / / CREATE PROCEDURE Escolher_Quizes_de_Usuario(IN p_id_usuario INT) BEGIN
SELECT
    *
FROM
    quiz
WHERE
    id_usuario = p_id_usuario
ORDER BY
    data DESC;

END / / CREATE PROCEDURE escolher_Usuario_ordenados_por_pontos() BEGIN
SELECT
    id,
    nome,
    pontuacao
FROM
    usuario
ORDER BY
    pontuacao DESC;

END / / CREATE PROCEDURE Verificar_Se_Login_Existe_e_Senha_Bate(
    IN p_email VARCHAR(100),
    IN p_senha VARCHAR(255)
) BEGIN
SELECT
    id,
    nome,
    email
FROM
    usuario
WHERE
    email = p_email
    AND senha = p_senha;

END / / CREATE PROCEDURE Verificar_Login_Existente(IN p_email VARCHAR(100)) BEGIN
SELECT
    COUNT(*) AS existe
FROM
    usuario
WHERE
    email = p_email;

END / / CREATE PROCEDURE AtualizarPontuacaoUsuario(
    IN p_id_usuario INT,
    IN p_pontos_novos INT
) BEGIN
UPDATE
    usuario
SET
    pontuacao = pontuacao + p_pontos_novos
WHERE
    id = p_id_usuario;

END / / CREATE PROCEDURE RankingUsuarios() BEGIN
SELECT
    nome,
    pontuacao
FROM
    usuario
ORDER BY
    pontuacao DESC
LIMIT
    10;

END / / CREATE PROCEDURE RankingUsuariosComInsignia() BEGIN
SELECT
    nome,
    pontuacao,
    CASE
        WHEN pontuacao >= 1000 THEN 'Diamante'
        WHEN pontuacao >= 500 THEN 'Ouro'
        WHEN pontuacao >= 200 THEN 'Prata'
        ELSE 'Bronze'
    END AS insignia
FROM
    usuario
ORDER BY
    pontuacao DESC;

END / / DELIMITER;