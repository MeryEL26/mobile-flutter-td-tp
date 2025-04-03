class Produit {
  String nom;
  double prix;
  int stock;
  String categorie;

  Produit(this.nom, this.prix, this.stock, this.categorie);

  void afficherDetails() {
    print("Produit : $nom | Prix : $prix DH | Stock : $stock | Catégorie : $categorie");
  }
}

class Commande {
  int id;
  Map<Produit, int> produits = {};
  double total = 0.0;

  Commande(this.id);

  void ajouterProduit(Produit produit, int quantite) {
    if (produit.stock < quantite) {
      throw StockInsuffisantException("Stock insuffisant pour ${produit.nom}");
    }
    produit.stock -= quantite;
    produits[produit] = (produits[produit] ?? 0) + quantite;
    calculerTotal();
  }

  void calculerTotal() {
    total = produits.entries.map((entry) => entry.key.prix * entry.value).reduce((a, b) => a + b);
  }

  void afficherCommande() {
    if (produits.isEmpty) {
      throw CommandeVideException("La commande est vide.");
    }
    print("Commande ID : $id | Total : $total DH");
    produits.forEach((produit, quantite) {
      print("${produit.nom} - Quantité : $quantite - Prix : ${produit.prix * quantite} DH");
    });
  }
}
