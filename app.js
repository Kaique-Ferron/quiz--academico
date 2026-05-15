import express from "express";
import produtoRoutes from "./routes/produtoRoutes.js";
import { pool } from "./config/database.js";
import path from "path";

const app = express();

app.use(express.json());

app.use(express.static(path.join(process.cwd(), "views")));

app.use("/api", produtoRoutes);

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