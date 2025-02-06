class CreditCardModel {

  /// Converts JSON (e.g., from API or SharedPreferences) to `CreditCardModel`
  factory CreditCardModel.fromJson(Map<String, dynamic> json) {
    return CreditCardModel(
      id: json['id'],
      cardNumber: json['cardNumber'],
      cardType: json['cardType'],
      encryptedFirst12: json['encryptedFirst12'],
      last4: json['last4'],
      cardholderName: json['cardholderName'],
      encryptedCVV: json['encryptedCVV'],
      expiryDate: json['expiryDate'],
    );
  }

  /// Converts a database map into a `CreditCardModel` instance
  factory CreditCardModel.fromMap(Map<String, dynamic> map) {
    return CreditCardModel(
      id: map['id'],
      cardNumber: "${map['encryptedFirst12']}${map['last4']}", // Reconstructing full number
      cardType: map['cardType'] ?? '',
      encryptedFirst12: map['encryptedFirst12'],
      last4: map['last4'],
      cardholderName: map['cardholderName'] ?? '',
      encryptedCVV: map['encryptedCVV'],
      expiryDate: map['expiryDate'],
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
  final String cardNumber;
  final String cardType;
  final String encryptedFirst12;
  final String last4;
  final String cardholderName;
  final String encryptedCVV;
  final String expiryDate;

  /// Converts `CreditCardModel` to a map for database storage
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'encryptedFirst12': encryptedFirst12, // Only store encrypted part
      'last4': last4, // Store only last 4 for display
      'cardType': cardType,
      'cardholderName': cardholderName,
      'encryptedCVV': encryptedCVV,
      'expiryDate': expiryDate,
    };
  }

  /// Converts `CreditCardModel` to JSON format
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
