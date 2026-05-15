const express = require("express");
const path = require("path");

const app = express();
const PORT = 3000;

const userRoutes = require("../routes/routes");

// Permite receber JSON e formulário
app.use(express.json());
app.use(express.urlencoded({ extended: true }));

// Arquivos estáticos
app.use(express.static(__dirname));
app.use("/css", express.static(path.join(__dirname, "../css")));
app.use("/imgs", express.static(path.join(__dirname, "imgs")));

// ROTAS

app.get("/", (req, res) => {
    res.sendFile(path.join(__dirname, "../views/login.html"));
});

app.get("/login", (req, res) => {
    res.sendFile(path.join(__dirname, "../views/login.html"));
});

app.get("/cadastro", (req, res) => {
    res.sendFile(path.join(__dirname, "../views/cadastro.html"));
});

app.get("/redefinir", (req, res) => {
    res.sendFile(path.join(__dirname, "../views/redefinir.html"));
});

app.get("/trocarSenha", (req, res) => {
    res.sendFile(path.join(__dirname, "../views/trocarSenha.html"));
});

app.use("/", userRoutes);

module.exports = app;