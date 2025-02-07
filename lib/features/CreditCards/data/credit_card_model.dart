class CreditCardModel {
  // Constructor
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
  final String cardNumber; // Full card number
  final String cardType;
  final String encryptedFirst12; // First 12 digits of the card (encrypted)
  final String last4; // Last 4 digits of the card
  final String cardholderName;
  final String encryptedCVV; // Encrypted CVV
  final String expiryDate;

  /// ✅ **Added copyWith method**
  CreditCardModel copyWith({
    String? id,
    String? cardNumber,
    String? cardType,
    String? encryptedFirst12,
    String? last4,
    String? cardholderName,
    String? encryptedCVV,
    String? expiryDate,
  }) {
    return CreditCardModel(
      id: id ?? this.id,
      cardNumber: cardNumber ?? this.cardNumber,
      cardType: cardType ?? this.cardType,
      encryptedFirst12: encryptedFirst12 ?? this.encryptedFirst12,
      last4: last4 ?? this.last4,
      cardholderName: cardholderName ?? this.cardholderName,
      encryptedCVV: encryptedCVV ?? this.encryptedCVV,
      expiryDate: expiryDate ?? this.expiryDate,
    );
  }

  /// Converts JSON (e.g., from API or SharedPreferences) to `CreditCardModel`
  factory CreditCardModel.fromJson(Map<String, dynamic> json) {
    return CreditCardModel(
      id: json['id'] ?? '',
      cardNumber: json['cardNumber'] ?? '',
      cardType: json['cardType'] ?? '',
      encryptedFirst12: json['encryptedFirst12'] ?? '',
      last4: json['last4'] ?? '',
      cardholderName: json['cardholderName'] ?? '',
      encryptedCVV: json['encryptedCVV'] ?? '',
      expiryDate: json['expiryDate'] ?? '',
    );
  }

  /// Converts a database map into a `CreditCardModel` instance
  factory CreditCardModel.fromMap(Map<String, dynamic> map) {
    return CreditCardModel(
      id: map['id'] ?? '',
      cardNumber: "${map['encryptedFirst12'] ?? ''}${map['last4'] ?? ''}",
      cardType: map['cardType'] ?? '',
      encryptedFirst12: map['encryptedFirst12'] ?? '',
      last4: map['last4'] ?? '',
      cardholderName: map['cardholderName'] ?? '',
      encryptedCVV: map['encryptedCVV'] ?? '',
      expiryDate: map['expiryDate'] ?? '',
    );
  }

  /// Converts `CreditCardModel` to a map for database storage
  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'encryptedFirst12': encryptedFirst12, // Store encrypted part of the card number
      'last4': last4, // Only store last 4 digits
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
      'cardNumber': cardNumber, // Full card number (unsafe, only for API responses)
      'cardType': cardType,
      'encryptedFirst12': encryptedFirst12,
      'last4': last4,
      'cardholderName': cardholderName,
      'encryptedCVV': encryptedCVV,
      'expiryDate': expiryDate,
    };
  }
}
