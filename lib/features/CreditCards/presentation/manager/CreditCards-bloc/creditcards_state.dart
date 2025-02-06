part of 'creditcards_bloc.dart';


@immutable
sealed class CreditcardsState {}

final class CreditcardsInitialState extends CreditcardsState {}

final class CardsLoadedState extends CreditcardsState {
  CardsLoadedState({required this.cards});
  final List<CreditCardModel> cards;
}

final class CardSavedState extends CreditcardsState {
  CardSavedState({required this.cardId});
  final String cardId;
}

final class CardDeletedState extends CreditcardsState {
  CardDeletedState({required this.cardId});
  final String cardId;
}

final class ErrorState extends CreditcardsState {
  ErrorState({required this.errorMessage});
  final String errorMessage;
}
