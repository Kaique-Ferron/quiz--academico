import express from "express";
import produtoRoutes from "./routes/produtoRoutes.js";
import userRoutes from "./routes/userRoutes.js";
import { pool } from "./config/database.js";
import path from "path";

const app = express();

app.use(express.json());
app.use(express.urlencoded({ extended: true }));

// Arquivos estáticos
app.use(express.static(path.join(process.cwd(), "views")));
app.use("/css", express.static(path.join(process.cwd(), "css")));
app.use("/imgs", express.static(path.join(process.cwd(), "imgs")));

// ROTAS DAS PÁGINAS
app.get("/", (req, res) => {
  res.sendFile(path.join(process.cwd(), "views/login.html"));
});

app.get("/login", (req, res) => {
  res.sendFile(path.join(process.cwd(), "views/login.html"));
});

app.get("/cadastro", (req, res) => {
  res.sendFile(path.join(process.cwd(), "views/cadastro.html"));
});

app.get("/redefinir", (req, res) => {
  res.sendFile(path.join(process.cwd(), "views/redefinir.html"));
});

app.get("/trocarSenha", (req, res) => {
  res.sendFile(path.join(process.cwd(), "views/trocarSenha.html"));
});

// ROTAS
app.use("/api", produtoRoutes);
app.use("/", userRoutes);

const PORT = process.env.PORT || 3000;

// Conexão com banco
pool.getConnection()
  .then(() => {
    console.log("Conectado ao MySQL.");

    app.listen(PORT, () => {
      console.log(`Servidor rodando em http://localhost:${PORT}`);
    });
  })
  .catch((erro) => {
    console.error("Erro ao conectar ao banco:", erro);
  });