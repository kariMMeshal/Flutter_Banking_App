import 'package:banking_app2/features/CreditCards/data/credit_card_model.dart';
import 'package:banking_app2/features/CreditCards/data/repos/credit_card_repo.dart';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'creditcards_event.dart';
part 'creditcards_state.dart';

class CreditcardsBloc extends Bloc<CreditcardsEvent, CreditcardsState> {
  final CreditCardRepo _creditCardRepo;
  List<CreditCardModel> _cards = [];

  CreditcardsBloc(this._creditCardRepo) : super(CreditcardsInitialState()) {
    on<CreditcardsEvent>((event, emit) async {
      if (event is SaveCardEvent) {
        emit(CreditcardsLoadingState());

        final card = CreditCardModel(
          id: event.cardId,
          cardNumber: event.cardNumber,
          cardType: event.cardType,
          encryptedFirst12:
              event.cardNumber.substring(0, event.cardNumber.length - 4),
          last4: event.cardNumber.substring(event.cardNumber.length - 4),
          cardholderName: event.cardholderName,
          encryptedCVV: event.cvv,
          expiryDate: event.expiryDate,
        );

        final result = await _creditCardRepo.saveCard(card);
        result.fold((failure) {
          emit(ErrorState(errorMessage: failure.errorMessage));
        }, (success) {
          emit(CardSavedState(cardId: event.cardId));
          add(LoadCardsEvent()); // Refresh the cards after saving
        });
      }

      if (event is DeleteCardEvent) {
        emit(CreditcardsLoadingState());
        final result = await _creditCardRepo.deleteCard(event.cardId);
        result.fold((failure) {
          emit(ErrorState(errorMessage: failure.errorMessage));
        }, (success) {
          emit(CardDeletedState(cardId: event.cardId));
          add(LoadCardsEvent()); // Refresh the cards after deletion
        });
      }

      if (event is LoadCardsEvent) {
        emit(CreditcardsLoadingState());
        final result = await _creditCardRepo.loadCards();
        result.fold((failure) {
          emit(ErrorState(errorMessage: failure.errorMessage));
        }, (cards) {
          _cards = cards; // Store the loaded cards
          emit(CreditCardsLoadedState(cards: cards));
        });
      }

      if (event is LoadEncryptedCardDataEvent) {
        final result =
            await _creditCardRepo.loadEncryptedCardData(event.cardId);
        result.fold((failure) {
          emit(ErrorState(errorMessage: failure.errorMessage));
        }, (encryptedData) {
          // Find the index of the card
          final index = _cards.indexWhere((card) => card.id == event.cardId);
          if (index != -1) {
            // Update the card number with encrypted value
            _cards[index] = _cards[index].copyWith(
              cardNumber: encryptedData["encryptedCardNumber"] ??
                  _cards[index].cardNumber,
            );
          }
          emit(CreditCardsLoadedState(cards: List.from(_cards)));
        });
      }
    });
  }
}
