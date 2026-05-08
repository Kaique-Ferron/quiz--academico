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
    nome VARCHAR(100) NOT NULL,
    sigla VARCHAR(10),
    id_curso INT,
    FOREIGN KEY (id_curso) REFERENCES curso(id) ON DELETE SET NULL ON UPDATE CASCADE
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
    enunciado VARCHAR(255) NOT NULL,
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
    FOREIGN KEY (id_usuario) REFERENCES usuario(id) ON UPDATE CASCADE ON DELETE SET NULL,
    FOREIGN KEY (id_disciplina) REFERENCES disciplina(id) ON UPDATE CASCADE ON DELETE SET NULL,
    FOREIGN KEY (id_questao_01) REFERENCES questao(id) ON UPDATE CASCADE ON DELETE SET NULL,
    FOREIGN KEY (id_questao_02) REFERENCES questao(id) ON UPDATE CASCADE ON DELETE SET NULL,
    FOREIGN KEY (id_questao_03) REFERENCES questao(id) ON UPDATE CASCADE ON DELETE SET NULL,
    FOREIGN KEY (id_questao_04) REFERENCES questao(id) ON UPDATE CASCADE ON DELETE SET NULL,
    FOREIGN KEY (id_questao_05) REFERENCES questao(id) ON UPDATE CASCADE ON DELETE SET NULL
);

INSERT INTO curso (nome, sigla) VALUES ('Desenvolvimento de Sistemas', 'DS');

INSERT INTO disciplina (nome, id_curso, sigla) VALUES 
('Análise e Projeto de Sistemas', 1, 'APS'),
('Banco de Dados', 1, 'BD'),
('Desenvolvimento de Sistemas', 1, 'DS'),
('Programação de Aplicativos Mobile', 1, 'PAM'),
('Programação Web', 1, 'PW'),
('Operação de Software Aplicativo', 1, 'OSA'),
('Sistemas Embarcados', 1, 'SE'),
('Segurança de Sistemas de Informação', 1, 'SSI'),
('Internet e Protocolos', 1, 'IP'),
('Linguagem, Trabalho e Tecnologia', 1, 'LTT'),
('Inglês Instrumental', 1, 'II'),
('Design Digital', 1, 'DD'),
('Ética e Cidadania Organizacional', 1, 'ECO');

DELIMITER //
CREATE PROCEDURE AtualizarQuiz(IN p_id INT, IN p_pontuacao INT)
BEGIN
    UPDATE quiz SET pontuacao = p_pontuacao WHERE id = p_id;
END //
DELIMITER ;

DELIMITER //
CREATE PROCEDURE DeleteQuiz(IN p_id INT)
BEGIN
    DELETE FROM quiz WHERE id = p_id;
END //
DELIMITER ;

DELIMITER //
CREATE PROCEDURE SelectQuiz(IN p_id INT)
BEGIN
    SELECT * FROM quiz WHERE id = p_id;
END //
DELIMITER ;

DELIMITER //
CREATE PROCEDURE Escolher_Disciplina_por_Curso(IN p_id_curso INT)
BEGIN
    SELECT id, nome, sigla FROM disciplina WHERE id_curso = p_id_curso;
END //
DELIMITER ;

DELIMITER //
CREATE PROCEDURE Escolher_uma_Alternativa_Questao(IN p_id_questao INT)
BEGIN
    SELECT id, enunciado, correta FROM alternativa WHERE id_questao = p_id_questao;
END //
DELIMITER ;

DELIMITER //
CREATE PROCEDURE Escolher_cinco_questoes_Aleatoria_Disciplina(IN p_id_disciplina INT)
BEGIN
    SELECT id, enunciado, pontuacao 
    FROM questao 
    WHERE id_disciplina = p_id_disciplina 
    ORDER BY RAND() 
    LIMIT 5;
END //
DELIMITER ;

DELIMITER //
CREATE PROCEDURE Escolher_Quizes_de_Usuario(IN p_id_usuario INT)
BEGIN
    SELECT * FROM quiz WHERE id_usuario = p_id_usuario ORDER BY data DESC;
END //
DELIMITER ;

DELIMITER //
CREATE PROCEDURE escolher_Usuario_ordenados_por_pontos()
BEGIN
    SELECT id, nome, pontuacao FROM usuario ORDER BY pontuacao DESC;
END //
DELIMITER ;

DELIMITER //
CREATE PROCEDURE Verificar_Se_Login_Existe_e_Senha_Bate(IN p_email VARCHAR(100), IN p_senha VARCHAR(255))
BEGIN
    SELECT id, nome, email 
    FROM usuario 
    WHERE email = p_email AND senha = p_senha;
END //
DELIMITER ;

DELIMITER //
CREATE PROCEDURE Verificar_Login_Existente(IN p_email VARCHAR(100))
BEGIN
    SELECT COUNT(*) AS existe FROM usuario WHERE email = p_email;
END //
DELIMITER ;

DELIMITER //
CREATE PROCEDURE AtualizarPontuacaoUsuario(IN p_id_usuario INT, IN p_pontos_novos INT)
BEGIN
    UPDATE usuario SET pontuacao = pontuacao + p_pontos_novos WHERE id = p_id_usuario;
END //
DELIMITER ;

DELIMITER //
CREATE PROCEDURE RankingUsuarios()
BEGIN
    SELECT nome, pontuacao FROM usuario ORDER BY pontuacao DESC LIMIT 10;
END //
DELIMITER ;

DELIMITER //
CREATE PROCEDURE RankingUsuariosComInsignia()
BEGIN
    SELECT nome, pontuacao,
    CASE 
        WHEN pontuacao >= 1000 THEN 'Diamante'
        WHEN pontuacao >= 500 THEN 'Ouro'
        WHEN pontuacao >= 200 THEN 'Prata'
        ELSE 'Bronze'
    END AS insignia
    FROM usuario ORDER BY pontuacao DESC;
END //
DELIMITER ;
