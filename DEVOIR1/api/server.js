const express = require("express");
const fs = require("fs");

const app = express();
app.use(express.json());

const produitsFile = "produits.json";
const commandesFile = "commandes.json";

const lireFichier = (file) => JSON.parse(fs.readFileSync(file, "utf-8"));
const ecrireFichier = (file, data) => fs.writeFileSync(file, JSON.stringify(data, null, 2));

app.get("/produits", (req, res) => {
    const produits = lireFichier(produitsFile);
    res.json(produits);
});

app.post("/produits", (req, res) => {
    let produits = lireFichier(produitsFile);
    produits.push(req.body);
    ecrireFichier(produitsFile, produits);
    res.json({ message: "Produit ajouté !" });
});

app.get("/commandes", (req, res) => {
    const commandes = lireFichier(commandesFile);
    res.json(commandes);
});

app.post("/commandes", (req, res) => {
    let commandes = lireFichier(commandesFile);
    commandes.push(req.body);
    ecrireFichier(commandesFile, commandes);
    res.json({ message: "Commande ajoutée !" });
});

app.listen(3000, () => console.log("Serveur lancé sur le port 3000"));
