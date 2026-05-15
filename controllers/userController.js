const path = require("path");

function abrirLogin(req, res) {
    res.sendFile(path.join(__dirname, "../views/login.html"));
}

function abrirCadastro(req, res) {
    res.sendFile(path.join(__dirname, "../views/cadastro.html"));
}

module.exports = {
    abrirLogin,
    abrirCadastro
};