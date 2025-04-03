import 'lib/produit_commande.dart';
import 'lib/exceptions.dart';
import 'lib/api_client.dart';

void main() async {
  List<Produit> produits = [
    Produit("Téléphone", 5000, 10, "Phone"),
    Produit("Ordinateur", 12000, 5, "Electronics"),
    Produit("Casque", 800, 20, "Accessories")
  ];

  Commande commande1 = Commande(1);

  try {
    commande1.ajouterProduit(produits[0], 2);
    commande1.ajouterProduit(produits[1], 1);
    commande1.afficherCommande();
  } catch (e) {
    print(e);
  }

  print("\n📡 Test API REST (Node.js Express)");
  await recupererProduits();
  await ajouterProduit({"nom": "Tablette", "prix": 3000, "stock": 15, "categorie": "Electronics"});
  await recupererCommandes();
  await ajouterCommande({"id": 2, "produits": {"Téléphone": 1}});
}
