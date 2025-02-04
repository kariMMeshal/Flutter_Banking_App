class CreditCardModel {
  factory CreditCardModel.fromJson(Map<String, dynamic> json) {
    return CreditCardModel(
      id: json['id'],
      cardNumber: json['cardNumber'],
      cardType: json['cardType'],
      encryptedFirst12: json['encryptedFirst12'],
      last4: json['last4'],
      cardholderName: json['cardholderName'],
      encryptedCVV: json['encryptedCVV'], // Encrypted CVV
      expiryDate: json['expiryDate'], // Expiry date in MM/YY format
    );
  }

  CreditCardModel({
    required this.id,
    required this.cardNumber,
    required this.cardType,
    required this.encryptedFirst12,
    required this.last4,
    required this.cardholderName,
    required this.encryptedCVV,
    required this.expiryDate,
  });

  final String id;
  final String cardNumber; // (first 12 encrypted and last 4 plain)
  final String cardType;
  final String encryptedFirst12;
  final String last4;
  final String cardholderName;
  final String encryptedCVV; // CVV should always be encrypted
  final String expiryDate; // Expiry date (e.g., "12/26")

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'cardNumber': cardNumber,
      'cardType': cardType,
      'encryptedFirst12': encryptedFirst12,
      'last4': last4,
      'cardholderName': cardholderName,
      'encryptedCVV': encryptedCVV,
      'expiryDate': expiryDate,
    };
  }
}
