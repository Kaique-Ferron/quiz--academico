const db = require("../config/db");

function criarUsuario(nome, email, senha) {
    const sql = "INSERT INTO usuarios (nome, email, senha) VALUES (?, ?, ?)";

    return db.promise().query(sql, [nome, email, senha]);
}

function buscarUsuarioPorEmail(email) {
    const sql = "SELECT * FROM usuarios WHERE email = ?";

    return db.promise().query(sql, [email]);
}

module.exports = {
    criarUsuario,
    buscarUsuarioPorEmail
};