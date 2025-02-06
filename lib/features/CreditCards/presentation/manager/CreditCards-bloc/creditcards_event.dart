part of 'creditcards_bloc.dart';

@immutable
sealed class CreditcardsEvent {}

final class SaveCardEvent extends CreditcardsEvent {
  SaveCardEvent({
    required this.cardId,
    required this.cardType,
    required this.cardholderName,
    required this.cardNumber,
    required this.cvv,
    required this.expiryDate,
  });
  final String cardId;
  final String cardType;
  final String cardholderName;
  final String cardNumber;
  final String cvv;
  final String expiryDate;
}

final class DeleteCardEvent extends CreditcardsEvent {
  DeleteCardEvent({required this.cardId});
  final String cardId;
}

final class LoadCardsEvent extends CreditcardsEvent {}

final class LoadEncryptedCardDataEvent extends CreditcardsEvent {
  LoadEncryptedCardDataEvent({required this.cardId});

  final String cardId;
}
