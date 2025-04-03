import 'dart:convert';
import 'package:http/http.dart' as http;

Future<void> recupererProduits() async {
  var response = await http.get(Uri.parse('http://localhost:3000/produits'));
  print(jsonDecode(response.body));
}

Future<void> ajouterProduit(Map<String, dynamic> produit) async {
  await http.post(
    Uri.parse('http://localhost:3000/produits'),
    headers: {'Content-Type': 'application/json'},
    body: jsonEncode(produit),
  );
}

Future<void> recupererCommandes() async {
  var response = await http.get(Uri.parse('http://localhost:3000/commandes'));
  print(jsonDecode(response.body));
}

Future<void> ajouterCommande(Map<String, dynamic> commande) async {
  await http.post(
    Uri.parse('http://localhost:3000/commandes'),
    headers: {'Content-Type': 'application/json'},
    body: jsonEncode(commande),
  );
}
