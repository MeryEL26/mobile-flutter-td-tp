class StockInsuffisantException implements Exception {
  String message;
  StockInsuffisantException(this.message);
  @override
  String toString() => "Erreur : $message";
}

class CommandeVideException implements Exception {
  String message;
  CommandeVideException(this.message);
  @override
  String toString() => "Erreur : $message";
}
