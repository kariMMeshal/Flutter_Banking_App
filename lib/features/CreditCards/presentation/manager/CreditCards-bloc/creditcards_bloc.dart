import 'package:banking_app2/features/CreditCards/data/credit_card_model.dart';
import 'package:banking_app2/features/CreditCards/data/repos/credit_card_repo.dart';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'creditcards_event.dart';
part 'creditcards_state.dart';

class CreditcardsBloc extends Bloc<CreditcardsEvent, CreditcardsState> {
  final CreditCardRepo _creditCardRepo;

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
        });
      }
      if (event is DeleteCardEvent) {
        emit(CreditcardsLoadingState());
        final reslt = await _creditCardRepo.deleteCard(event.cardId);
        reslt.fold((failure) {
          emit(ErrorState(errorMessage: failure.errorMessage));
        }, (success) {
          emit(CardDeletedState(cardId: event.cardId));
        });
      }
      if (event is LoadCardsEvent) {
        emit(CreditcardsLoadingState());
        final result = await _creditCardRepo.loadCards();
        result.fold((failure) {
          emit(ErrorState(errorMessage: failure.errorMessage));
        }, (cards) {
          emit(CardsLoadedState(cards: cards));
        });
      }
      if (event is LoadEncryptedCardDataEvent) {
        emit(CreditcardsLoadingState());
        final result =
            await _creditCardRepo.loadEncryptedCardData(event.cardId);
        result.fold((failure) {
          emit(ErrorState(errorMessage: failure.errorMessage));
        }, (encryptedData) {
          emit(EncryptedCardDataLoadedState(encryptedData: encryptedData));
        });
      }
    });
  }
}
