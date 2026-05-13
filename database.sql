DROP DATABASE IF EXISTS quiz;
CREATE DATABASE quiz;
USE quiz;

-- =========================================================
-- TABELAS
-- =========================================================

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
    FOREIGN KEY (id_curso) REFERENCES curso(id)
        ON DELETE SET NULL
        ON UPDATE CASCADE
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
    FOREIGN KEY (id_disciplina) REFERENCES disciplina(id)
        ON DELETE CASCADE
        ON UPDATE CASCADE
);

CREATE TABLE alternativa (
    id INT AUTO_INCREMENT PRIMARY KEY,
    id_questao INT,
    perguntas VARCHAR(255) NOT NULL,
    correta TINYINT(1) DEFAULT 0,
    FOREIGN KEY (id_questao) REFERENCES questao(id)
        ON DELETE CASCADE
        ON UPDATE CASCADE
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

    FOREIGN KEY (id_usuario) REFERENCES usuario(id)
        ON UPDATE CASCADE
        ON DELETE SET NULL,

    FOREIGN KEY (id_disciplina) REFERENCES disciplina(id)
        ON UPDATE CASCADE
        ON DELETE SET NULL,

    FOREIGN KEY (id_questao_01) REFERENCES questao(id)
        ON UPDATE CASCADE
        ON DELETE SET NULL,

    FOREIGN KEY (id_questao_02) REFERENCES questao(id)
        ON UPDATE CASCADE
        ON DELETE SET NULL,

    FOREIGN KEY (id_questao_03) REFERENCES questao(id)
        ON UPDATE CASCADE
        ON DELETE SET NULL,

    FOREIGN KEY (id_questao_04) REFERENCES questao(id)
        ON UPDATE CASCADE
        ON DELETE SET NULL,

    FOREIGN KEY (id_questao_05) REFERENCES questao(id)
        ON UPDATE CASCADE
        ON DELETE SET NULL
);

-- =========================================================
-- CURSO
-- =========================================================

INSERT INTO curso (nome, sigla)
VALUES ('Desenvolvimento de Sistemas', 'DS');

-- =========================================================
-- DISCIPLINAS
-- =========================================================

INSERT INTO disciplina (nome, id_curso, modulo,sigla) VALUES

-- Módulo I
('Programação e Algoritmos', 1, 1,'PA'),
('Banco de Dados I', 1, 1,'BD1'),
('Análise e Projeto de Sistemas', 1, 1,'APS'),
('Design Digital', 1, 1,'DD'),
('Programação Web I', 1, 1,'PW1'),
('Fundamentos da Informática', 1, 1,'FI'),
('Técnicas de Programação', 1, 1,'TP'),

-- Módulo II
('Desenvolvimento de Sistemas', 1, 2,'DS'),
('Banco de Dados II', 1, 2,'BD2'),
('Planejamento do Trabalho de Conclusão de Curso (TCC) em Desenvolvimento de Sistemas', 1, 2,'PTCCDS'),
('Internet e Protocolos', 1, 2,'IP'),
('Programação de Aplicativos Mobile I', 1, 2,'PAM1'),
('Programação Web II', 1, 2,'PW2'),
('Planejamento e Documentação do TCC', 1, 2,'PDTCC'),

-- Módulo III
('Segurança de Sistemas da Informação', 1, 3,'SSI'),
('Banco de Dados III', 1, 3,'BD3'),
('Sistemas Embarcados', 1, 3,'SE'),
('Programação de Aplicativos Mobile II', 1, 3,'PAM2'),
('Programação Web III', 1, 3,'PW3'),
('Qualidade e Teste de Software', 1, 3,'QTS'),
('Desenvolvimento do Trabalho de Conclusão de Curso (TCC) em Desenvolvimento de Sistemas', 1, 3,'DTCCDS');

-- =========================================================
-- QUESTÕES - PROGRAMAÇÃO E ALGORITMOS
-- id_disciplina = 1
-- =========================================================
-- =========================================================
-- QUESTÕES COMPLETAS
-- 15 QUESTÕES POR DISCIPLINA
-- 5 FÁCEIS
-- 5 MÉDIAS
-- 5 DIFÍCEIS
-- =========================================================

-- =========================================================
-- DISCIPLINA 1
-- PROGRAMAÇÃO E ALGORITMOS
-- =========================================================

INSERT INTO questao (enunciado, pontuacao, id_disciplina) VALUES
('O que é um algoritmo?',10,1),
('Qual estrutura repete comandos?',10,1),
('O que é uma variável?',10,1),
('Qual operador faz atribuição?',10,1),
('Qual comando mostra texto na tela?',10,1),

('Qual estrutura toma decisões?',20,1),
('O que é um vetor?',20,1),
('Qual operador representa OU lógico?',20,1),
('Qual laço executa ao menos uma vez?',20,1),
('Qual função do break?',20,1),

('O que é recursividade?',30,1),
('Qual estrutura usa FIFO?',30,1),
('Complexidade do Bubble Sort?',30,1),
('O que é abstração?',30,1),
('Melhor busca em lista ordenada?',30,1);

-- =========================================================
-- DISCIPLINA 2
-- BANCO DE DADOS I
-- =========================================================

INSERT INTO questao (enunciado, pontuacao, id_disciplina) VALUES
('O que é banco de dados?',10,2),
('Comando para consultar dados?',10,2),
('Comando para inserir dados?',10,2),
('O que é chave primária?',10,2),
('Qual comando cria tabela?',10,2),

('Qual comando altera registros?',20,2),
('O que significa SQL?',20,2),
('Cláusula usada para filtrar?',20,2),
('Qual comando remove registros?',20,2),
('O que é chave estrangeira?',20,2),

('O que é normalização?',30,2),
('Qual JOIN retorna registros relacionados?',30,2),
('Qual JOIN traz todos da esquerda?',30,2),
('Função que conta registros?',30,2),
('O que é índice?',30,2);

-- =========================================================
-- DISCIPLINA 3
-- ANÁLISE E PROJETO DE SISTEMAS
-- =========================================================

INSERT INTO questao (enunciado, pontuacao, id_disciplina) VALUES
('O que é requisito funcional?',10,3),
('O que é UML?',10,3),
('Qual diagrama mostra casos de uso?',10,3),
('O que representa um ator?',10,3),
('Qual objetivo da análise?',10,3),

('O que é caso de uso?',20,3),
('Qual diagrama mostra classes?',20,3),
('O que é levantamento de requisitos?',20,3),
('O que é prototipação?',20,3),
('Qual objetivo do projeto?',20,3),

('O que é encapsulamento?',30,3),
('O que é herança?',30,3),
('O que é polimorfismo?',30,3),
('O que é acoplamento?',30,3),
('O que é coesão?',30,3);

-- =========================================================
-- DISCIPLINA 4
-- DESIGN DIGITAL
-- =========================================================

INSERT INTO questao (enunciado, pontuacao, id_disciplina) VALUES
('O que é RGB?',10,4),
('O que é resolução?',10,4),
('Qual programa edita imagens?',10,4),
('O que é tipografia?',10,4),
('O que é layout?',10,4),

('O que é contraste?',20,4),
('O que é alinhamento?',20,4),
('Qual formato possui transparência?',20,4),
('O que é UX?',20,4),
('O que é UI?',20,4),

('O que é identidade visual?',30,4),
('O que é wireframe?',30,4),
('O que é mockup?',30,4),
('O que é design responsivo?',30,4),
('O que é hierarquia visual?',30,4);

-- =========================================================
-- DISCIPLINA 5
-- PROGRAMAÇÃO WEB I
-- =========================================================

INSERT INTO questao (enunciado, pontuacao, id_disciplina) VALUES
('O que significa HTML?',10,5),
('Qual tag cria parágrafo?',10,5),
('Qual tag cria link?',10,5),
('Qual linguagem estiliza páginas?',10,5),
('Qual linguagem adiciona interatividade?',10,5),

('O que é CSS?',20,5),
('O que é JavaScript?',20,5),
('Qual tag cria tabela?',20,5),
('O que é responsividade?',20,5),
('O que faz o flexbox?',20,5),

('O que é DOM?',30,5),
('O que é API?',30,5),
('O que é JSON?',30,5),
('O que é requisição GET?',30,5),
('O que é SPA?',30,5);

-- =========================================================
-- DISCIPLINA 6
-- FUNDAMENTOS DA INFORMÁTICA
-- =========================================================

INSERT INTO questao (enunciado, pontuacao, id_disciplina) VALUES
('O que é hardware?',10,6),
('O que é software?',10,6),
('Qual componente processa dados?',10,6),
('O que é memória RAM?',10,6),
('O que é sistema operacional?',10,6),

('Qual função do HD?',20,6),
('O que é periférico?',20,6),
('Qual diferença entre RAM e ROM?',20,6),
('O que é BIOS?',20,6),
('O que é placa-mãe?',20,6),

('O que é virtualização?',30,6),
('O que é SSD?',30,6),
('O que é overclock?',30,6),
('O que é kernel?',30,6),
('O que é computação em nuvem?',30,6);

-- =========================================================
-- DISCIPLINA 7
-- TÉCNICAS DE PROGRAMAÇÃO
-- =========================================================

INSERT INTO questao (enunciado, pontuacao, id_disciplina) VALUES
('O que é compilação?',10,7),
('O que é depuração?',10,7),
('O que é sintaxe?',10,7),
('O que é pseudocódigo?',10,7),
('O que é IDE?',10,7),

('O que é modularização?',20,7),
('O que é função?',20,7),
('O que é parâmetro?',20,7),
('O que é retorno?',20,7),
('O que é escopo?',20,7),

('O que é programação estruturada?',30,7),
('O que é programação orientada a objetos?',30,7),
('O que é herança múltipla?',30,7),
('O que é sobrecarga?',30,7),
('O que é interface?',30,7);

-- =========================================================
-- DISCIPLINA 8
-- DESENVOLVIMENTO DE SISTEMAS
-- =========================================================

INSERT INTO questao (enunciado, pontuacao, id_disciplina) VALUES
('O que é sistema?',10,8),
('O que é software?',10,8),
('O que é requisito?',10,8),
('O que é usuário final?',10,8),
('O que é manutenção?',10,8),

('O que é metodologia ágil?',20,8),
('O que é Scrum?',20,8),
('O que é sprint?',20,8),
('O que é backlog?',20,8),
('O que é versionamento?',20,8),

('O que é integração contínua?',30,8),
('O que é deploy?',30,8),
('O que é microsserviço?',30,8),
('O que é arquitetura MVC?',30,8),
('O que é escalabilidade?',30,8);

-- =========================================================
-- DISCIPLINA 9
-- BANCO DE DADOS II
-- =========================================================

INSERT INTO questao (enunciado, pontuacao, id_disciplina) VALUES
('O que é VIEW?',10,9),
('O que é PROCEDURE?',10,9),
('O que é TRIGGER?',10,9),
('O que é índice?',10,9),
('O que é backup?',10,9),

('O que é transação?',20,9),
('O que significa COMMIT?',20,9),
('O que significa ROLLBACK?',20,9),
('O que é modelagem lógica?',20,9),
('O que é modelagem física?',20,9),

('O que é deadlock?',30,9),
('O que é cardinalidade?',30,9),
('O que é integridade referencial?',30,9),
('O que é banco distribuído?',30,9),
('O que é otimização de consultas?',30,9);

-- =========================================================
-- DISCIPLINA 10
-- INTERNET E PROTOCOLOS
-- =========================================================

INSERT INTO questao (enunciado, pontuacao, id_disciplina) VALUES
('O que é internet?',10,10),
('O que significa HTTP?',10,10),
('Qual protocolo envia emails?',10,10),
('O que é IP?',10,10),
('O que é DNS?',10,10),

('O que é TCP?',20,10),
('O que é UDP?',20,10),
('Qual porta padrão HTTPS?',20,10),
('O que é roteador?',20,10),
('O que é firewall?',20,10),

('O que é NAT?',30,10),
('O que é VPN?',30,10),
('O que é IPv6?',30,10),
('O que é máscara de rede?',30,10),
('O que é protocolo SSL/TLS?',30,10);

-- =========================================================
-- DISCIPLINA 11
-- PAM I
-- =========================================================

INSERT INTO questao (enunciado, pontuacao, id_disciplina) VALUES
('O que é aplicativo mobile?',10,11),
('O que é Android?',10,11),
('O que é APK?',10,11),
('O que é Activity?',10,11),
('O que é interface gráfica?',10,11),

('O que é Intent?',20,11),
('O que é RecyclerView?',20,11),
('O que é SQLite?',20,11),
('O que é API mobile?',20,11),
('O que é emulador?',20,11),

('O que é ciclo de vida Activity?',30,11),
('O que é Firebase?',30,11),
('O que é persistência local?',30,11),
('O que é arquitetura MVVM?',30,11),
('O que é responsividade mobile?',30,11);

-- =========================================================
-- DISCIPLINA 12
-- PROGRAMAÇÃO WEB II
-- =========================================================

INSERT INTO questao (enunciado, pontuacao, id_disciplina) VALUES
('O que é PHP?',10,12),
('O que é backend?',10,12),
('O que é frontend?',10,12),
('O que é formulário HTML?',10,12),
('O que é servidor web?',10,12),

('O que é sessão?',20,12),
('O que é cookie?',20,12),
('O que é autenticação?',20,12),
('O que é CRUD?',20,12),
('O que é conexão com banco?',20,12),

('O que é API REST?',30,12),
('O que é token JWT?',30,12),
('O que é ORM?',30,12),
('O que é middleware?',30,12),
('O que é arquitetura cliente-servidor?',30,12);

-- =========================================================
-- ALTERNATIVAS
-- =========================================================


-- DISCIPLINA 1 ==========================

INSERT INTO alternativa(id_questao, perguntas, correta)VALUES 
(1, 'Um conjunto de instruções ordenadas para resolver um problema.', true),
(1, 'Um equipamento usado para armazenar dados.', false),
(1, 'Um programa que acessa a internet.', false),
(1, 'Um tipo de linguagem de marcação.', false),
(1, 'Um componente físico do computador.', false),

(2, 'Estrutura de repetição.', true),
(2, 'Estrutura condicional.', false),
(2, 'Declaração de variável.', false),
(2, 'Operador lógico.', false),
(2, 'Tipo de dado.', false),

(3, 'Um espaço na memória que armazena valores.', true),
(3, 'Um laço de repetição.', false),
(3, 'Um operador matemático.', false),
(3, 'Um comando de saída.', false),
(3, 'Uma estrutura condicional.', false),

(4, '=', true),
(4, '==', false),
(4, '!=', false),
(4, '&&', false),
(4, '||', false),

(5, 'Escreva.', true),
(5, 'Leia.', false),
(5, 'Enquanto.', false),
(5, 'Se.', false),
(5, 'Para.', false),

(6, 'Estrutura condicional.', true),
(6, 'Estrutura de repetição.', false),
(6, 'Declaração de variável.', false),
(6, 'Comentário.', false),
(6, 'Operador aritmético.', false),

(7, 'Uma estrutura que armazena vários valores do mesmo tipo.', true),
(7, 'Um comando de decisão.', false),
(7, 'Um operador lógico.', false),
(7, 'Um tipo de laço.', false),
(7, 'Uma função matemática.', false),

(8, '||', true),
(8, '&&', false),
(8, '==', false),
(8, '!=', false),
(8, '=', false),

(9, 'Faça...enquanto.', true),
(9, 'Enquanto.', false),
(9, 'Para.', false),
(9, 'Se.', false),
(9, 'Escolha.', false),

(10, 'Interromper a execução do laço.', true),
(10, 'Repetir o laço.', false),
(10, 'Declarar variável.', false),
(10, 'Comparar valores.', false),
(10, 'Exibir texto.', false),

(11, 'Quando uma função chama a si mesma.', true),
(11, 'Quando um laço repete infinitamente.', false),
(11, 'Quando duas variáveis recebem o mesmo valor.', false),
(11, 'Quando um programa gera erro.', false),
(11, 'Quando um vetor é percorrido.', false),

(12, 'Fila.', true),
(12, 'Pilha.', false),
(12, 'Vetor.', false),
(12, 'Matriz.', false),
(12, 'Lista encadeada.', false),

(13, 'O(n²)', true),
(13, 'O(log n)', false),
(13, 'O(n)', false),
(13, 'O(1)', false),
(13, 'O(n log n)', false),

(14, 'Ocultar detalhes internos e mostrar apenas o essencial.', true),
(14, 'Repetir blocos de código.', false),
(14, 'Ordenar dados em memória.', false),
(14, 'Armazenar valores em vetor.', false),
(14, 'Criar variáveis globais.', false),

(15, 'Busca binária.', true),
(15, 'Busca sequencial.', false),
(15, 'Bubble Sort.', false),
(15, 'Busca linear.', false),
(15, 'Insertion Sort.', false),

-- DISCIPLINA 2 =====================================

(16, 'Um conjunto organizado de dados armazenados.', true),
(16, 'Um programa de edição de texto.', false),
(16, 'Um sistema operacional.', false),
(16, 'Um componente físico.', false),
(16, 'Uma linguagem de programação.', false),

(17, 'SELECT', true),
(17, 'INSERT', false),
(17, 'UPDATE', false),
(17, 'DELETE', false),
(17, 'CREATE', false),

(18, 'INSERT', true),
(18, 'SELECT', false),
(18, 'UPDATE', false),
(18, 'DROP', false),
(18, 'ALTER', false),

(19, 'Um campo que identifica cada registro de forma única.', true),
(19, 'Um campo usado para repetir dados.', false),
(19, 'Uma tabela auxiliar.', false),
(19, 'Um tipo de consulta.', false),
(19, 'Um comando SQL.', false),

(20, 'CREATE TABLE', true),
(20, 'INSERT INTO', false),
(20, 'SELECT *', false),
(20, 'ALTER TABLE', false),
(20, 'DROP TABLE', false),

(21, 'UPDATE', true),
(21, 'INSERT', false),
(21, 'DELETE', false),
(21, 'SELECT', false),
(21, 'CREATE', false),

(22, 'Structured Query Language', true),
(22, 'System Query Language', false),
(22, 'Simple Question Language', false),
(22, 'Storage Query Logic', false),
(22, 'Server Query Language', false),

(23, 'WHERE', true),
(23, 'ORDER BY', false),
(23, 'GROUP BY', false),
(23, 'HAVING', false),
(23, 'FROM', false),

(24, 'DELETE', true),
(24, 'DROP', false),
(24, 'REMOVE', false),
(24, 'UPDATE', false),
(24, 'TRUNCATE', false),

(25, 'Um campo que relaciona uma tabela com outra.', true),
(25, 'O identificador principal da tabela.', false),
(25, 'Um campo obrigatório.', false),
(25, 'Uma consulta SQL.', false),
(25, 'Um índice de busca.', false),

(26, 'Processo de organizar dados para reduzir redundância.', true),
(26, 'Processo de apagar registros duplicados.', false),
(26, 'Forma de ordenar resultados.', false),
(26, 'Tipo de backup.', false),
(26, 'Estrutura de consulta.', false),

(27, 'INNER JOIN', true),
(27, 'LEFT JOIN', false),
(27, 'RIGHT JOIN', false),
(27, 'FULL JOIN', false),
(27, 'CROSS JOIN', false),

(28, 'LEFT JOIN', true),
(28, 'INNER JOIN', false),
(28, 'RIGHT JOIN', false),
(28, 'FULL JOIN', false),
(28, 'CROSS JOIN', false),

(29, 'COUNT()', true),
(29, 'SUM()', false),
(29, 'AVG()', false),
(29, 'MAX()', false),
(29, 'MIN()', false),

(30, 'Estrutura que acelera a busca de dados.', true),
(30, 'Uma tabela temporária.', false),
(30, 'Um tipo de chave estrangeira.', false),
(30, 'Um comando de atualização.', false),
(30, 'Um campo obrigatório.', false),

-- DISCIPLINA 3 =======================================

(31, 'Um requisito que descreve o que o sistema deve fazer.', true),
(31, 'Um requisito ligado apenas ao visual.', false),
(31, 'Um tipo de banco de dados.', false),
(31, 'Um erro de programação.', false),
(31, 'Um componente de hardware.', false),

(32, 'Linguagem de modelagem unificada.', true),
(32, 'Linguagem de programação web.', false),
(32, 'Um banco de dados relacional.', false),
(32, 'Um sistema operacional.', false),
(32, 'Um framework de desenvolvimento.', false),

(33, 'Diagrama de casos de uso.', true),
(33, 'Diagrama de classes.', false),
(33, 'Diagrama de sequência.', false),
(33, 'Diagrama de atividades.', false),
(33, 'Diagrama de estados.', false),

(34, 'Uma entidade externa que interage com o sistema.', true),
(34, 'Uma tabela do banco de dados.', false),
(34, 'Um requisito funcional.', false),
(34, 'Um processo interno.', false),
(34, 'Um tipo de diagrama.', false),

(35, 'Entender o problema e definir necessidades do sistema.', true),
(35, 'Criar a interface gráfica.', false),
(35, 'Escrever o código final.', false),
(35, 'Instalar o sistema.', false),
(35, 'Testar o hardware.', false),

(36, 'Descrição de uma interação entre usuário e sistema.', true),
(36, 'Um tipo de linguagem de programação.', false),
(36, 'Um modelo de banco de dados.', false),
(36, 'Um comando SQL.', false),
(36, 'Um componente físico.', false),

(37, 'Diagrama de classes.', true),
(37, 'Diagrama de casos de uso.', false),
(37, 'Diagrama de sequência.', false),
(37, 'Diagrama de estados.', false),
(37, 'Diagrama de atividades.', false),

(38, 'Processo de identificar necessidades dos usuários.', true),
(38, 'Processo de apagar requisitos antigos.', false),
(38, 'Processo de compilar código.', false),
(38, 'Processo de testar software.', false),
(38, 'Processo de instalar sistema.', false),

(39, 'Criação de uma representação inicial do sistema.', true),
(39, 'Criação do banco de dados final.', false),
(39, 'Correção de erros do programa.', false),
(39, 'Execução do sistema.', false),
(39, 'Documentação do hardware.', false),

(40, 'Definir como o sistema será construído.', true),
(40, 'Executar o sistema em produção.', false),
(40, 'Cadastrar usuários.', false),
(40, 'Corrigir bugs de código.', false),
(40, 'Apagar requisitos antigos.', false),

(41, 'Ocultar detalhes internos e controlar acesso aos dados.', true),
(41, 'Permitir múltiplas heranças.', false),
(41, 'Repetir blocos de código.', false),
(41, 'Criar variáveis globais.', false),
(41, 'Dividir tabelas em colunas.', false),

(42, 'Quando uma classe herda características de outra.', true),
(42, 'Quando uma função chama a si mesma.', false),
(42, 'Quando duas classes têm o mesmo nome.', false),
(42, 'Quando um objeto é apagado.', false),
(42, 'Quando um método retorna valor.', false),

(43, 'Capacidade de um mesmo método ter comportamentos diferentes.', true),
(43, 'Capacidade de armazenar vários valores.', false),
(43, 'Capacidade de repetir instruções.', false),
(43, 'Capacidade de ordenar dados.', false),
(43, 'Capacidade de criar tabelas.', false),

(44, 'Grau de dependência entre módulos.', true),
(44, 'Quantidade de linhas de código.', false),
(44, 'Número de classes do sistema.', false),
(44, 'Velocidade de execução.', false),
(44, 'Quantidade de variáveis.', false),

(45, 'Grau em que os elementos de um módulo estão relacionados.', true),
(45, 'Quantidade de tabelas no banco.', false),
(45, 'Número de usuários do sistema.', false),
(45, 'Tempo de resposta do sistema.', false),
(45, 'Quantidade de loops do programa.', false),

-- DISCIPLINA 4 ======================================

(46, 'Sistema de cores formado por vermelho, verde e azul.', true),
(46, 'Formato de arquivo de imagem.', false),
(46, 'Técnica de edição de vídeo.', false),
(46, 'Tipo de fonte digital.', false),
(46, 'Ferramenta de alinhamento.', false),

(47, 'Quantidade de pixels que compõem uma imagem.', true),
(47, 'Tamanho físico do monitor.', false),
(47, 'Número de páginas de um documento.', false),
(47, 'Velocidade de carregamento da imagem.', false),
(47, 'Tipo de cor utilizada.', false),

(48, 'Adobe Photoshop', true),
(48, 'MySQL', false),
(48, 'Visual Studio Code', false),
(48, 'Node.js', false),
(48, 'Google Chrome', false),

(49, 'Estudo e uso das fontes e da composição de textos.', true),
(49, 'Organização de tabelas em banco de dados.', false),
(49, 'Técnica de programação orientada a objetos.', false),
(49, 'Processo de compactação de imagens.', false),
(49, 'Modelo de rede de computadores.', false),

(50, 'Organização visual dos elementos em uma composição.', true),
(50, 'Tipo de linguagem de programação.', false),
(50, 'Formato de exportação de arquivos.', false),
(50, 'Sistema de cores digitais.', false),
(50, 'Técnica de compressão de dados.', false),

(51, 'Diferença visual entre elementos para destacar informações.', true),
(51, 'Espaçamento entre linhas de texto.', false),
(51, 'Quantidade de cores usadas no projeto.', false),
(51, 'Tamanho do arquivo final.', false),
(51, 'Tipo de resolução da tela.', false),

(52, 'Posicionamento organizado dos elementos em relação entre si.', true),
(52, 'Aumento da nitidez da imagem.', false),
(52, 'Definição do tamanho da fonte.', false),
(52, 'Aplicação de efeitos de sombra.', false),
(52, 'Escolha do formato do arquivo.', false),

(53, 'PNG', true),
(53, 'JPG', false),
(53, 'BMP', false),
(53, 'TXT', false),
(53, 'MP3', false),

(54, 'Experiência do usuário ao utilizar um produto.', true),
(54, 'Linguagem de marcação para páginas.', false),
(54, 'Programa de edição gráfica.', false),
(54, 'Sistema de armazenamento de dados.', false),
(54, 'Modelo de banco relacional.', false),

(55, 'Interface visual com a qual o usuário interage.', true),
(55, 'Banco de dados do sistema.', false),
(55, 'Código-fonte do servidor.', false),
(55, 'Estrutura lógica do programa.', false),
(55, 'Protocolo de internet.', false),

(56, 'Conjunto de elementos visuais que representam uma marca.', true),
(56, 'Técnica para aumentar resolução.', false),
(56, 'Modelo de diagrama de classes.', false),
(56, 'Processo de compilação.', false),
(56, 'Tipo de banco de dados.', false),

(57, 'Esboço simples da estrutura de uma interface.', true),
(57, 'Imagem final pronta para publicação.', false),
(57, 'Modelo de programação.', false),
(57, 'Técnica de compressão de arquivos.', false),
(57, 'Sistema de tipografia automática.', false),

(58, 'Representação visual detalhada de um layout.', true),
(58, 'Esboço inicial sem detalhes.', false),
(58, 'Linguagem de estilização.', false),
(58, 'Estrutura de dados.', false),
(58, 'Tipo de algoritmo.', false),

(59, 'Design que se adapta a diferentes tamanhos de tela.', true),
(59, 'Design feito apenas para celulares.', false),
(59, 'Design com animações automáticas.', false),
(59, 'Design com alta resolução.', false),
(59, 'Design criado apenas em HTML.', false),

(60, 'Organização visual que orienta a atenção do usuário.', true),
(60, 'Escolha do tipo de arquivo.', false),
(60, 'Quantidade de páginas do projeto.', false),
(60, 'Tamanho físico do monitor.', false),
(60, 'Tipo de linguagem utilizada.', false),

-- DISCIPLINA 5 ==============================

(61, 'HyperText Markup Language', true),
(61, 'HighText Machine Language', false),
(61, 'Hyper Transfer Markup Language', false),
(61, 'Home Tool Markup Language', false),
(61, 'HyperText Markdown Language', false),

(62, '<p>', true),
(62, '<h1>', false),
(62, '<div>', false),
(62, '<span>', false),
(62, '<br>', false),

(63, '<a>', true),
(63, '<link>', false),
(63, '<href>', false),
(63, '<url>', false),
(63, '<nav>', false),

(64, 'CSS', true),
(64, 'HTML', false),
(64, 'Java', false),
(64, 'SQL', false),
(64, 'PHP', false),

(65, 'JavaScript', true),
(65, 'CSS', false),
(65, 'HTML', false),
(65, 'SQL', false),
(65, 'XML', false),

(66, 'Linguagem usada para estilizar páginas web.', true),
(66, 'Linguagem usada para criar banco de dados.', false),
(66, 'Linguagem usada apenas no servidor.', false),
(66, 'Protocolo de internet.', false),
(66, 'Sistema operacional para web.', false),

(67, 'Linguagem de programação usada para interatividade na web.', true),
(67, 'Linguagem de marcação para estruturar páginas.', false),
(67, 'Banco de dados relacional.', false),
(67, 'Protocolo de transferência de arquivos.', false),
(67, 'Editor de código.', false),

(68, '<table>', true),
(68, '<tr>', false),
(68, '<td>', false),
(68, '<thead>', false),
(68, '<tbody>', false),

(69, 'Capacidade de adaptar a interface a diferentes telas.', true),
(69, 'Capacidade de aumentar a velocidade do site.', false),
(69, 'Capacidade de armazenar dados localmente.', false),
(69, 'Capacidade de executar scripts no servidor.', false),
(69, 'Capacidade de criptografar páginas.', false),

(70, 'Organizar e alinhar elementos em layouts flexíveis.', true),
(70, 'Criar conexões com banco de dados.', false),
(70, 'Executar código JavaScript.', false),
(70, 'Definir rotas do sistema.', false),
(70, 'Gerar arquivos HTML automaticamente.', false),

(71, 'Estrutura que representa os elementos de uma página.', true),
(71, 'Banco de dados usado em navegadores.', false),
(71, 'Linguagem de programação orientada a objetos.', false),
(71, 'Protocolo para envio de páginas.', false),
(71, 'Sistema de autenticação web.', false),

(72, 'Interface que permite comunicação entre sistemas.', true),
(72, 'Editor visual de páginas.', false),
(72, 'Banco de dados em nuvem.', false),
(72, 'Estrutura de layout em CSS.', false),
(72, 'Comando HTML para links.', false),

(73, 'Formato de dados baseado em pares chave e valor.', true),
(73, 'Linguagem de estilização de páginas.', false),
(73, 'Banco de dados relacional.', false),
(73, 'Tipo de servidor web.', false),
(73, 'Protocolo de rede.', false),

(74, 'Requisição usada para obter dados de um servidor.', true),
(74, 'Requisição usada para apagar dados.', false),
(74, 'Requisição usada para atualizar dados.', false),
(74, 'Requisição usada para criar tabelas.', false),
(74, 'Requisição usada para compilar código.', false),

(75, 'Aplicação web que funciona como uma única página dinâmica.', true),
(75, 'Sistema de banco de dados distribuído.', false),
(75, 'Programa de edição de imagens.', false),
(75, 'Servidor dedicado para APIs.', false),
(75, 'Biblioteca de estilos CSS.', false),

-- DISCIPLINA 6 ==========================================

(76, 'Parte física do computador e seus componentes.', true),
(76, 'Conjunto de programas instalados.', false),
(76, 'Sistema operacional do computador.', false),
(76, 'Programa usado para navegar na internet.', false),
(76, 'Banco de dados do sistema.', false),

(77, 'Conjunto de programas e instruções executados pelo computador.', true),
(77, 'Parte física do computador.', false),
(77, 'Dispositivo de armazenamento externo.', false),
(77, 'Placa responsável pelo vídeo.', false),
(77, 'Rede local de computadores.', false),

(78, 'Processador (CPU).', true),
(78, 'Monitor.', false),
(78, 'Teclado.', false),
(78, 'Mouse.', false),
(78, 'Gabinete.', false),

(79, 'Memória temporária usada durante a execução dos programas.', true),
(79, 'Memória permanente do sistema.', false),
(79, 'Disco rígido externo.', false),
(79, 'Processador gráfico.', false),
(79, 'Tipo de sistema operacional.', false),

(80, 'Software que gerencia hardware e programas do computador.', true),
(80, 'Programa usado apenas para editar textos.', false),
(80, 'Componente físico da placa-mãe.', false),
(80, 'Dispositivo de armazenamento.', false),
(80, 'Linguagem de programação.', false),

(81, 'Armazenar dados de forma permanente.', true),
(81, 'Executar cálculos lógicos.', false),
(81, 'Exibir imagens na tela.', false),
(81, 'Controlar a memória RAM.', false),
(81, 'Conectar o computador à internet.', false),

(82, 'Dispositivo de entrada ou saída conectado ao computador.', true),
(82, 'Programa de gerenciamento de arquivos.', false),
(82, 'Parte central do processador.', false),
(82, 'Tipo de memória interna.', false),
(82, 'Sistema operacional.', false),

(83, 'RAM é volátil e ROM é permanente.', true),
(83, 'RAM é permanente e ROM é volátil.', false),
(83, 'RAM e ROM são iguais.', false),
(83, 'RAM é usada apenas para vídeo.', false),
(83, 'ROM é usada apenas para internet.', false),

(84, 'Software básico que inicializa o hardware do computador.', true),
(84, 'Programa de edição de imagens.', false),
(84, 'Sistema de arquivos do HD.', false),
(84, 'Memória temporária.', false),
(84, 'Componente responsável pelo som.', false),

(85, 'Placa principal que conecta os componentes do computador.', true),
(85, 'Dispositivo de armazenamento externo.', false),
(85, 'Programa de inicialização.', false),
(85, 'Memória de acesso rápido.', false),
(85, 'Tipo de processador.', false),

(86, 'Execução de máquinas virtuais em um mesmo hardware.', true),
(86, 'Aumento da velocidade do processador.', false),
(86, 'Criação de backups automáticos.', false),
(86, 'Processo de formatação do HD.', false),
(86, 'Uso simultâneo de vários monitores.', false),

(87, 'Unidade de armazenamento mais rápida que HD tradicional.', true),
(87, 'Tipo de memória RAM.', false),
(87, 'Processador gráfico.', false),
(87, 'Sistema operacional portátil.', false),
(87, 'Protocolo de rede.', false),

(88, 'Aumento da frequência de operação de um componente.', true),
(88, 'Redução do consumo de energia.', false),
(88, 'Criação de uma máquina virtual.', false),
(88, 'Compactação de arquivos.', false),
(88, 'Troca do sistema operacional.', false),

(89, 'Parte central do sistema operacional que gerencia recursos.', true),
(89, 'Programa para edição de texto.', false),
(89, 'Memória principal do computador.', false),
(89, 'Componente responsável pelo vídeo.', false),
(89, 'Sistema de arquivos em nuvem.', false),

(90, 'Uso de recursos computacionais pela internet.', true),
(90, 'Conexão física entre computadores.', false),
(90, 'Armazenamento apenas em HD externo.', false),
(90, 'Execução local de programas sem rede.', false),
(90, 'Instalação manual de drivers.', false),

-- DISCIPLINA 7 ===================================================

(91, 'Processo de transformar código-fonte em código executável.', true),
(91, 'Processo de encontrar erros no código.', false),
(91, 'Processo de executar o programa passo a passo.', false),
(91, 'Processo de armazenar dados em banco.', false),
(91, 'Processo de documentar o sistema.', false),

(92, 'Processo de localizar e corrigir erros em um programa.', true),
(92, 'Processo de compilar código-fonte.', false),
(92, 'Processo de criar banco de dados.', false),
(92, 'Processo de gerar interface gráfica.', false),
(92, 'Processo de instalar o sistema.', false),

(93, 'Conjunto de regras para escrever comandos corretamente.', true),
(93, 'Conjunto de testes automáticos.', false),
(93, 'Conjunto de arquivos do sistema.', false),
(93, 'Conjunto de componentes físicos.', false),
(93, 'Conjunto de tabelas do banco.', false),

(94, 'Descrição lógica de um algoritmo em linguagem informal.', true),
(94, 'Código executável pronto para uso.', false),
(94, 'Linguagem de programação compilada.', false),
(94, 'Banco de dados relacional.', false),
(94, 'Modelo de interface gráfica.', false),

(95, 'Ambiente de desenvolvimento integrado.', true),
(95, 'Sistema operacional para programação.', false),
(95, 'Banco de dados local.', false),
(95, 'Tipo de linguagem de programação.', false),
(95, 'Ferramenta de compactação.', false),

(96, 'Dividir o programa em partes menores e organizadas.', true),
(96, 'Executar vários programas ao mesmo tempo.', false),
(96, 'Criar várias variáveis globais.', false),
(96, 'Transformar código em executável.', false),
(96, 'Ordenar dados automaticamente.', false),

(97, 'Bloco de código que executa uma tarefa específica.', true),
(97, 'Variável usada para armazenar dados.', false),
(97, 'Comando de repetição.', false),
(97, 'Estrutura condicional.', false),
(97, 'Tipo de dado numérico.', false),

(98, 'Valor recebido por uma função para ser utilizado.', true),
(98, 'Valor devolvido ao final da função.', false),
(98, 'Nome da função.', false),
(98, 'Comando de saída.', false),
(98, 'Estrutura de repetição.', false),

(99, 'Valor que a função devolve após executar.', true),
(99, 'Valor usado apenas na entrada da função.', false),
(99, 'Nome dado à função.', false),
(99, 'Tipo de variável global.', false),
(99, 'Conjunto de parâmetros.', false),

(100, 'Região do código onde uma variável pode ser acessada.', true),
(100, 'Velocidade de execução do programa.', false),
(100, 'Tipo de retorno da função.', false),
(100, 'Quantidade de memória usada.', false),
(100, 'Número de linhas de código.', false),

(101, 'Forma de programar usando sequência, decisão e repetição.', true),
(101, 'Forma de programar baseada em objetos apenas.', false),
(101, 'Forma de programar sem lógica definida.', false),
(101, 'Forma de programar apenas para web.', false),
(101, 'Forma de programar sem funções.', false),

(102, 'Paradigma baseado em objetos com atributos e métodos.', true),
(102, 'Paradigma baseado apenas em tabelas.', false),
(102, 'Paradigma usado apenas para banco de dados.', false),
(102, 'Paradigma sem reutilização de código.', false),
(102, 'Paradigma exclusivo de sistemas operacionais.', false),

(103, 'Quando uma classe herda de mais de uma classe.', true),
(103, 'Quando uma função chama outra função.', false),
(103, 'Quando duas variáveis têm o mesmo valor.', false),
(103, 'Quando um objeto é destruído.', false),
(103, 'Quando uma classe possui vários métodos.', false),

(104, 'Uso do mesmo nome para métodos com comportamentos diferentes.', true),
(104, 'Uso de várias classes em um sistema.', false),
(104, 'Uso de variáveis globais no código.', false),
(104, 'Uso de herança múltipla.', false),
(104, 'Uso de repetição automática.', false),

(105, 'Contrato que define métodos que devem ser implementados.', true),
(105, 'Classe que já possui código completo.', false),
(105, 'Banco de dados usado em APIs.', false),
(105, 'Tipo de variável global.', false),
(105, 'Estrutura usada para repetição.', false),

-- DISCIPLINA 8 ==============================================

(106, 'Conjunto de elementos que trabalham juntos para um objetivo.', true),
(106, 'Programa usado apenas para editar textos.', false),
(106, 'Parte física do computador.', false),
(106, 'Banco de dados relacional.', false),
(106, 'Linguagem de programação.', false),

(107, 'Conjunto de programas e instruções executados pelo computador.', true),
(107, 'Parte física do computador.', false),
(107, 'Dispositivo de entrada.', false),
(107, 'Sistema de rede.', false),
(107, 'Placa principal do computador.', false),

(108, 'Necessidade ou condição que o sistema deve atender.', true),
(108, 'Erro encontrado no sistema.', false),
(108, 'Comando de programação.', false),
(108, 'Componente físico.', false),
(108, 'Tipo de banco de dados.', false),

(109, 'Pessoa que utiliza o sistema no dia a dia.', true),
(109, 'Pessoa que programa o sistema.', false),
(109, 'Administrador do banco de dados.', false),
(109, 'Responsável pela rede.', false),
(109, 'Fabricante do hardware.', false),

(110, 'Processo de correção, atualização ou melhoria do sistema.', true),
(110, 'Criação inicial do software.', false),
(110, 'Instalação do sistema operacional.', false),
(110, 'Formatação do computador.', false),
(110, 'Criação de usuários.', false),

(111, 'Método de desenvolvimento iterativo e adaptável.', true),
(111, 'Método de desenvolvimento feito em uma única etapa.', false),
(111, 'Método exclusivo para banco de dados.', false),
(111, 'Método de instalação de software.', false),
(111, 'Método de programação orientada a objetos.', false),

(112, 'Framework ágil baseado em papéis, eventos e artefatos.', true),
(112, 'Linguagem de programação para web.', false),
(112, 'Banco de dados em nuvem.', false),
(112, 'Sistema operacional para servidores.', false),
(112, 'Modelo de rede local.', false),

(113, 'Período curto de trabalho para desenvolver parte do projeto.', true),
(113, 'Documento de requisitos do sistema.', false),
(113, 'Ferramenta de versionamento.', false),
(113, 'Tipo de banco de dados.', false),
(113, 'Processo de compilação.', false),

(114, 'Lista priorizada de tarefas ou requisitos do projeto.', true),
(114, 'Relatório final do sistema.', false),
(114, 'Código-fonte principal do projeto.', false),
(114, 'Banco de dados temporário.', false),
(114, 'Diagrama de classes.', false),

(115, 'Controle de alterações feitas no código ao longo do tempo.', true),
(115, 'Processo de executar o sistema.', false),
(115, 'Criação automática de interfaces.', false),
(115, 'Armazenamento em nuvem.', false),
(115, 'Estrutura de banco de dados.', false),

(116, 'Prática de integrar código frequentemente com testes automáticos.', true),
(116, 'Processo de apagar versões antigas.', false),
(116, 'Criação manual de backups.', false),
(116, 'Modelo de programação orientada a objetos.', false),
(116, 'Técnica de design responsivo.', false),

(117, 'Publicação de uma aplicação em ambiente de uso.', true),
(117, 'Execução de testes unitários.', false),
(117, 'Criação de banco de dados.', false),
(117, 'Compilação do código-fonte.', false),
(117, 'Documentação do sistema.', false),

(118, 'Arquitetura em que o sistema é dividido em serviços independentes.', true),
(118, 'Arquitetura baseada em uma única classe.', false),
(118, 'Arquitetura usada apenas em banco de dados.', false),
(118, 'Arquitetura exclusiva para aplicativos mobile.', false),
(118, 'Arquitetura de hardware.', false),

(119, 'Padrão que separa modelo, visualização e controle.', true),
(119, 'Padrão que une banco e interface no mesmo módulo.', false),
(119, 'Padrão usado apenas para redes.', false),
(119, 'Padrão exclusivo de aplicativos Android.', false),
(119, 'Padrão de compressão de arquivos.', false),

(120, 'Capacidade do sistema de crescer sem perder desempenho.', true),
(120, 'Capacidade do sistema de funcionar offline.', false),
(120, 'Capacidade de armazenar arquivos grandes.', false),
(120, 'Capacidade de usar várias linguagens.', false),
(120, 'Capacidade de gerar relatórios.', false),

-- DISCIPLINA 9 =============================

(121, 'Tabela virtual baseada em uma consulta.', true),
(121, 'Tabela física criada manualmente.', false),
(121, 'Comando para apagar registros.', false),
(121, 'Tipo de índice.', false),
(121, 'Banco de dados temporário.', false),

(122, 'Conjunto de comandos SQL armazenados para execução.', true),
(122, 'Consulta usada apenas para leitura.', false),
(122, 'Tabela com chave primária.', false),
(122, 'Índice de pesquisa.', false),
(122, 'Comando para excluir tabelas.', false),

(123, 'Bloco de código executado automaticamente por um evento.', true),
(123, 'Comando usado para criar tabelas.', false),
(123, 'Consulta de leitura de dados.', false),
(123, 'Tipo de chave estrangeira.', false),
(123, 'Procedimento de backup.', false),

(124, 'Estrutura que acelera consultas de dados.', true),
(124, 'Tabela usada para armazenar logs.', false),
(124, 'Comando para alterar registros.', false),
(124, 'Relacionamento entre tabelas.', false),
(124, 'Tipo de transação.', false),

(125, 'Cópia de segurança dos dados.', true),
(125, 'Processo de exclusão de registros.', false),
(125, 'Tabela auxiliar de sistema.', false),
(125, 'Consulta de leitura.', false),
(125, 'Procedimento de ordenação.', false),

(126, 'Conjunto de operações tratadas como uma unidade.', true),
(126, 'Comando para apagar tabela.', false),
(126, 'Tipo de chave primária.', false),
(126, 'Consulta que usa JOIN.', false),
(126, 'Índice usado em ordenação.', false),

(127, 'Confirma definitivamente as alterações da transação.', true),
(127, 'Cancela a transação atual.', false),
(127, 'Inicia uma nova transação.', false),
(127, 'Cria uma tabela temporária.', false),
(127, 'Executa backup automático.', false),

(128, 'Desfaz alterações ainda não confirmadas.', true),
(128, 'Salva permanentemente alterações.', false),
(128, 'Cria um índice na tabela.', false),
(128, 'Ordena registros da consulta.', false),
(128, 'Apaga uma tabela inteira.', false),

(129, 'Representação da estrutura do banco em tabelas e relacionamentos.', true),
(129, 'Representação física dos arquivos em disco.', false),
(129, 'Consulta de leitura de dados.', false),
(129, 'Processo de backup automático.', false),
(129, 'Comando para inserir registros.', false),

(130, 'Implementação real do banco considerando o SGBD.', true),
(130, 'Esboço inicial sem tabelas.', false),
(130, 'Modelo conceitual com entidades apenas.', false),
(130, 'Consulta SQL com filtros.', false),
(130, 'Estrutura usada apenas em memória.', false),

(131, 'Situação em que transações ficam bloqueadas entre si.', true),
(131, 'Processo de salvar dados permanentemente.', false),
(131, 'Erro de sintaxe em SQL.', false),
(131, 'Tipo de índice duplicado.', false),
(131, 'Falha de conexão com o banco.', false),

(132, 'Quantidade de ocorrências entre entidades em um relacionamento.', true),
(132, 'Quantidade de colunas em uma tabela.', false),
(132, 'Quantidade de índices de uma tabela.', false),
(132, 'Número de backups armazenados.', false),
(132, 'Número de transações simultâneas.', false),

(133, 'Garantia de consistência entre chaves primárias e estrangeiras.', true),
(133, 'Garantia de que não haverá índices duplicados.', false),
(133, 'Garantia de ordenação automática dos dados.', false),
(133, 'Garantia de acesso remoto ao banco.', false),
(133, 'Garantia de backup em nuvem.', false),

(134, 'Banco de dados armazenado em mais de um local.', true),
(134, 'Banco de dados com várias tabelas.', false),
(134, 'Banco de dados sem chave primária.', false),
(134, 'Banco de dados em memória apenas.', false),
(134, 'Banco de dados usado só em aplicativos móveis.', false),

(135, 'Melhoria de consultas para maior desempenho.', true),
(135, 'Processo de apagar registros antigos.', false),
(135, 'Criação de novas tabelas automaticamente.', false),
(135, 'Compactação física do banco.', false),
(135, 'Criação de backups incrementais.', false),


-- DISCIPLINA 10 =============================

(136, 'Rede mundial de computadores interligados.', true),
(136, 'Programa usado para navegar em sites.', false),
(136, 'Dispositivo que conecta redes.', false),
(136, 'Sistema operacional para servidores.', false),
(136, 'Banco de dados distribuído.', false),

(137, 'HyperText Transfer Protocol', true),
(137, 'High Transfer Text Protocol', false),
(137, 'Hyper Terminal Transfer Process', false),
(137, 'Host Text Transmission Protocol', false),
(137, 'Hyper Transfer Tool Process', false),

(138, 'SMTP', true),
(138, 'HTTP', false),
(138, 'FTP', false),
(138, 'DNS', false),
(138, 'TCP', false),

(139, 'Endereço que identifica um dispositivo na rede.', true),
(139, 'Programa que gerencia páginas web.', false),
(139, 'Sistema de envio de emails.', false),
(139, 'Comando para testar conexão.', false),
(139, 'Dispositivo de armazenamento.', false),

(140, 'Sistema que traduz nomes de domínio em endereços IP.', true),
(140, 'Protocolo usado para enviar emails.', false),
(140, 'Tipo de endereço físico do computador.', false),
(140, 'Programa de proteção contra vírus.', false),
(140, 'Dispositivo que distribui internet.', false),

(141, 'Protocolo confiável orientado à conexão.', true),
(141, 'Protocolo rápido sem garantia de entrega.', false),
(141, 'Protocolo de envio de emails.', false),
(141, 'Sistema de nomes de domínio.', false),
(141, 'Endereço lógico de rede.', false),

(142, 'Protocolo rápido sem garantia de entrega.', true),
(142, 'Protocolo confiável orientado à conexão.', false),
(142, 'Protocolo usado em páginas web.', false),
(142, 'Sistema de resolução de nomes.', false),
(142, 'Tipo de endereço IP.', false),

(143, '443', true),
(143, '80', false),
(143, '21', false),
(143, '25', false),
(143, '110', false),

(144, 'Dispositivo que encaminha pacotes entre redes.', true),
(144, 'Programa que protege contra vírus.', false),
(144, 'Sistema operacional de rede.', false),
(144, 'Cabo usado para internet.', false),
(144, 'Servidor de emails.', false),

(145, 'Sistema que controla e filtra o tráfego de rede.', true),
(145, 'Dispositivo que converte nomes em IP.', false),
(145, 'Programa usado para enviar emails.', false),
(145, 'Tipo de protocolo de transporte.', false),
(145, 'Ferramenta de compactação.', false),

(146, 'Técnica que converte endereços privados em públicos.', true),
(146, 'Protocolo de envio seguro de dados.', false),
(146, 'Sistema de resolução de nomes.', false),
(146, 'Tipo de roteamento interno.', false),
(146, 'Ferramenta de monitoramento de rede.', false),

(147, 'Conexão privada e criptografada sobre a internet.', true),
(147, 'Rede local usada em empresas.', false),
(147, 'Protocolo de transferência de arquivos.', false),
(147, 'Servidor que distribui IP.', false),
(147, 'Programa de navegação web.', false),

(148, 'Nova versão do protocolo IP com mais endereços.', true),
(148, 'Versão criptografada do IPv4.', false),
(148, 'Sistema de nomes de domínio.', false),
(148, 'Protocolo de envio de emails.', false),
(148, 'Tipo de firewall.', false),

(149, 'Valor usado para identificar a parte de rede e host do IP.', true),
(149, 'Número da porta usada em conexão segura.', false),
(149, 'Endereço físico da placa de rede.', false),
(149, 'Nome do provedor de internet.', false),
(149, 'Protocolo de roteamento.', false),

(150, 'Protocolos que criptografam a comunicação na internet.', true),
(150, 'Protocolos usados apenas para envio de email.', false),
(150, 'Protocolos de armazenamento em nuvem.', false),
(150, 'Protocolos de acesso local ao computador.', false),
(150, 'Protocolos de edição de páginas web.', false),

-- DISCIPLINA 11 ===============================================

(151, 'Aplicação desenvolvida para dispositivos móveis.', true),
(151, 'Programa usado apenas em computadores de mesa.', false),
(151, 'Sistema operacional de servidores.', false),
(151, 'Banco de dados em nuvem.', false),
(151, 'Protocolo de internet.', false),

(152, 'Sistema operacional para dispositivos móveis.', true),
(152, 'Linguagem de programação para web.', false),
(152, 'Aplicativo de mensagens.', false),
(152, 'Banco de dados local.', false),
(152, 'Editor de código.', false),

(153, 'Arquivo de instalação de aplicativos Android.', true),
(153, 'Banco de dados usado em celulares.', false),
(153, 'Componente físico do smartphone.', false),
(153, 'Sistema operacional do Android.', false),
(153, 'Arquivo de backup do sistema.', false),

(154, 'Tela ou componente que representa uma interface no Android.', true),
(154, 'Banco de dados local do aplicativo.', false),
(154, 'Sistema de arquivos do celular.', false),
(154, 'Arquivo de instalação.', false),
(154, 'Processador do dispositivo.', false),

(155, 'Parte visual com a qual o usuário interage.', true),
(155, 'Código responsável pelo banco de dados.', false),
(155, 'Sistema operacional do dispositivo.', false),
(155, 'Protocolo de rede.', false),
(155, 'Memória interna do aparelho.', false),

(156, 'Mecanismo usado para comunicação entre componentes do Android.', true),
(156, 'Banco de dados nativo do sistema.', false),
(156, 'Tipo de layout responsivo.', false),
(156, 'Arquivo de instalação do app.', false),
(156, 'Comando para depuração.', false),

(157, 'Componente usado para exibir listas de forma eficiente.', true),
(157, 'Ferramenta para editar imagens.', false),
(157, 'Banco de dados em nuvem.', false),
(157, 'Sistema de notificações.', false),
(157, 'Componente de autenticação.', false),

(158, 'Banco de dados relacional leve usado localmente.', true),
(158, 'Sistema operacional do Android.', false),
(158, 'Biblioteca de interface gráfica.', false),
(158, 'Serviço de hospedagem em nuvem.', false),
(158, 'Protocolo de internet.', false),

(159, 'Interface que permite comunicação entre app e serviços externos.', true),
(159, 'Banco de dados interno do aplicativo.', false),
(159, 'Sistema de navegação entre telas.', false),
(159, 'Ferramenta para compilar código.', false),
(159, 'Editor visual de layouts.', false),

(160, 'Programa que simula um dispositivo móvel no computador.', true),
(160, 'Aplicativo publicado na loja.', false),
(160, 'Banco de dados local.', false),
(160, 'Componente físico do celular.', false),
(160, 'Sistema de notificações.', false),

(161, 'Conjunto de estados pelos quais uma Activity passa.', true),
(161, 'Lista de permissões do aplicativo.', false),
(161, 'Estrutura de banco de dados local.', false),
(161, 'Processo de instalação do APK.', false),
(161, 'Sistema de autenticação do usuário.', false),

(162, 'Plataforma de serviços em nuvem para apps.', true),
(162, 'Banco de dados local do Android.', false),
(162, 'Sistema operacional móvel.', false),
(162, 'Editor de código.', false),
(162, 'Tipo de emulador.', false),

(163, 'Armazenamento de dados diretamente no dispositivo.', true),
(163, 'Armazenamento apenas em servidores externos.', false),
(163, 'Processo de compilação do app.', false),
(163, 'Comunicação com APIs externas.', false),
(163, 'Criação de interfaces gráficas.', false),

(164, 'Arquitetura que separa modelo, visualização e lógica de apresentação.', true),
(164, 'Arquitetura baseada apenas em banco de dados.', false),
(164, 'Arquitetura usada só para sites.', false),
(164, 'Arquitetura exclusiva de sistemas operacionais.', false),
(164, 'Arquitetura de rede local.', false),

(165, 'Capacidade da interface se adaptar a diferentes telas móveis.', true),
(165, 'Capacidade do app funcionar sem internet.', false),
(165, 'Capacidade de armazenar mais dados.', false),
(165, 'Capacidade de usar múltiplos bancos de dados.', false),
(165, 'Capacidade de compilar mais rápido.', false),

-- DISCIPLINA 12 ====================================================

(166, 'Linguagem de programação usada principalmente no backend web.', true),
(166, 'Linguagem usada apenas para estilizar páginas.', false),
(166, 'Banco de dados relacional.', false),
(166, 'Sistema operacional para servidores.', false),
(166, 'Protocolo de internet.', false),

(167, 'Parte do sistema que roda no servidor e trata lógica e dados.', true),
(167, 'Parte visual exibida ao usuário no navegador.', false),
(167, 'Banco de dados usado pela aplicação.', false),
(167, 'Sistema operacional do servidor.', false),
(167, 'Programa de edição de código.', false),

(168, 'Parte visual da aplicação com a qual o usuário interage.', true),
(168, 'Parte responsável pelo banco de dados.', false),
(168, 'Parte que executa no servidor.', false),
(168, 'Parte usada para configurar rede.', false),
(168, 'Parte responsável por compilar código.', false),

(169, 'Conjunto de campos usados para enviar dados do usuário.', true),
(169, 'Tabela usada em banco de dados.', false),
(169, 'Comando para criar páginas HTML.', false),
(169, 'Estrutura usada apenas em CSS.', false),
(169, 'Arquivo de configuração do servidor.', false),

(170, 'Programa que hospeda e entrega páginas e aplicações web.', true),
(170, 'Programa usado apenas para editar imagens.', false),
(170, 'Banco de dados distribuído.', false),
(170, 'Sistema de versionamento.', false),
(170, 'Linguagem de marcação.', false),

(171, 'Mecanismo que mantém dados do usuário entre requisições.', true),
(171, 'Arquivo usado para estilizar páginas.', false),
(171, 'Comando SQL para consultar dados.', false),
(171, 'Programa de autenticação do sistema.', false),
(171, 'Tipo de API para mobile.', false),

(172, 'Pequeno dado armazenado no navegador do usuário.', true),
(172, 'Arquivo de configuração do servidor.', false),
(172, 'Tabela temporária do banco de dados.', false),
(172, 'Método de criptografia.', false),
(172, 'Componente visual do frontend.', false),

(173, 'Processo de verificar a identidade de um usuário.', true),
(173, 'Processo de apagar sessões antigas.', false),
(173, 'Processo de criar tabelas no banco.', false),
(173, 'Processo de estilizar páginas.', false),
(173, 'Processo de compilar código.', false),

(174, 'Operações de criar, ler, atualizar e excluir dados.', true),
(174, 'Operações de compilar e executar código.', false),
(174, 'Operações de criptografar arquivos.', false),
(174, 'Operações de monitorar servidores.', false),
(174, 'Operações de desenhar interfaces.', false),

(175, 'Ligação da aplicação com o banco para manipular dados.', true),
(175, 'Ligação entre frontend e CSS.', false),
(175, 'Ligação entre duas páginas HTML.', false),
(175, 'Ligação entre teclado e monitor.', false),
(175, 'Ligação entre rede e firewall.', false),

(176, 'Interface que segue princípios de recursos e métodos HTTP.', true),
(176, 'Banco de dados usado apenas em APIs.', false),
(176, 'Linguagem de programação para frontend.', false),
(176, 'Servidor de hospedagem de arquivos.', false),
(176, 'Framework visual para HTML.', false),

(177, 'Token usado para autenticação e troca segura de informações.', true),
(177, 'Banco de dados em memória.', false),
(177, 'Arquivo de configuração do servidor.', false),
(177, 'Método de estilização de páginas.', false),
(177, 'Tipo de sessão armazenada em navegador.', false),

(178, 'Técnica que mapeia objetos da aplicação para tabelas do banco.', true),
(178, 'Método de criptografia de senhas.', false),
(178, 'Modelo de arquitetura cliente-servidor.', false),
(178, 'Sistema de cache de páginas.', false),
(178, 'Framework de design responsivo.', false),

(179, 'Camada intermediária que processa requisições e respostas.', true),
(179, 'Componente visual usado em formulários.', false),
(179, 'Tabela auxiliar do banco de dados.', false),
(179, 'Arquivo de configuração do navegador.', false),
(179, 'Sistema de autenticação local.', false),

(180, 'Modelo em que cliente faz requisições e servidor responde.', true),
(180, 'Modelo em que banco de dados controla a interface.', false),
(180, 'Modelo em que frontend substitui o backend.', false),
(180, 'Modelo de armazenamento em nuvem.', false),
(180, 'Modelo usado apenas em aplicativos mobile.', false);


DELIMITER //

-- =========================================================
-- PROCEDURES
-- =========================================================

CREATE PROCEDURE AtualizarQuiz(
    IN p_id INT,
    IN p_pontuacao INT
)
BEGIN
    UPDATE quiz
    SET pontuacao = p_pontuacao
    WHERE id = p_id;
END //

CREATE PROCEDURE DeleteQuiz(IN p_id INT)
BEGIN
    DELETE FROM quiz
    WHERE id = p_id;
END //

CREATE PROCEDURE SelectQuiz(IN p_id INT)
BEGIN
    SELECT *
    FROM quiz
    WHERE id = p_id;
END //

CREATE PROCEDURE Escolher_Disciplina_por_Curso(
    IN p_id_curso INT
)
BEGIN
    SELECT id, nome, sigla
    FROM disciplina
    WHERE id_curso = p_id_curso;
END //

CREATE PROCEDURE Consultar_disciplina_por_modulo (
	IN p_id_curso INT, 
    IN p_modulo INT
)
BEGIN
	SELECT nome, sigla
    FROM disciplina
    WHERE id_curso = p_id_curso and
    modulo = p_modulo;
END //

CREATE PROCEDURE Escolher_uma_Alternativa_Questao(
    IN p_id_questao INT
)
BEGIN
    SELECT id, enunciado, correta
    FROM alternativa
    WHERE id_questao = p_id_questao;
END //

CREATE PROCEDURE Escolher_cinco_questoes_Aleatoria_Disciplina(
    IN p_id_disciplina INT
)
BEGIN
    SELECT id, enunciado, pontuacao
    FROM questao
    WHERE id_disciplina = p_id_disciplina
    ORDER BY RAND()
    LIMIT 5;
END //

CREATE PROCEDURE Escolher_Quizes_de_Usuario(
    IN p_id_usuario INT
)
BEGIN
    SELECT *
    FROM quiz
    WHERE id_usuario = p_id_usuario
    ORDER BY data DESC;
END //

CREATE PROCEDURE escolher_Usuario_ordenados_por_pontos()
BEGIN
    SELECT id, nome, pontuacao
    FROM usuario
    ORDER BY pontuacao DESC;
END //

CREATE PROCEDURE Verificar_Se_Login_Existe_e_Senha_Bate(
    IN p_email VARCHAR(100),
    IN p_senha VARCHAR(255)
)
BEGIN
    SELECT id, nome, email
    FROM usuario
    WHERE email = p_email
    AND senha = p_senha;
END //

CREATE PROCEDURE Verificar_Login_Existente(
    IN p_email VARCHAR(100)
)
BEGIN
    SELECT COUNT(*) AS existe
    FROM usuario
    WHERE email = p_email;
END //

CREATE PROCEDURE AtualizarPontuacaoUsuario(
    IN p_id_usuario INT,
    IN p_pontos_novos INT
)
BEGIN
    UPDATE usuario
    SET pontuacao = pontuacao + p_pontos_novos
    WHERE id = p_id_usuario;
END //

CREATE PROCEDURE RankingUsuarios()
BEGIN
    SELECT nome, pontuacao
    FROM usuario
    ORDER BY pontuacao DESC
    LIMIT 10;
END //

CREATE PROCEDURE RankingUsuariosComInsignia()
BEGIN
    SELECT
        nome,
        pontuacao,
        CASE
            WHEN pontuacao >= 1000 THEN 'Diamante'
            WHEN pontuacao >= 500 THEN 'Ouro'
            WHEN pontuacao >= 200 THEN 'Prata'
            ELSE 'Bronze'
        END AS insignia
    FROM usuario
    ORDER BY pontuacao DESC;
END //

DELIMITER ;