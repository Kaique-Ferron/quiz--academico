
const mysql = require("mysql2");

const conexao = mysql.createConnection({
    host: "localhost",
    user: "root",
    password: "",
    database: "quiz"
});

conexao.connect((erro) => {
    if (erro) {
        console.log("Erro ao conectar ao banco:", erro);
    } else {
        console.log("Banco conectado com sucesso!");
    }
});

module.exports = conexao;

