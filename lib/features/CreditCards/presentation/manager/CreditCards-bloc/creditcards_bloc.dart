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
    on<SaveCardEvent>(_onSaveCard);
    on<DeleteCardEvent>(_onDeleteCard);
    on<LoadCardsEvent>(_onLoadCards);
    on<LoadEncryptedCardDataEvent>(_onLoadEncryptedCardData);
  }

  Future<void> _onSaveCard(
      SaveCardEvent event, Emitter<CreditcardsState> emit) async {
    emit(CreditcardsLoadingState());

    final card = CreditCardModel(
      id: event.cardId,
      cardNumber: event.cardNumber,
      cardType: event.cardType,
      encryptedFirst12: event.cardNumber.substring(0, event.cardNumber.length - 4),
      last4: event.cardNumber.substring(event.cardNumber.length - 4),
      cardholderName: event.cardholderName,
      encryptedCVV: event.cvv,
      expiryDate: event.expiryDate,
    );

    final result = await _creditCardRepo.saveCard(card);
    result.fold(
      (failure) => emit(ErrorState(errorMessage: failure.errorMessage)),
      (_) {
        emit(CardSavedState(cardId: event.cardId));
        add(LoadCardsEvent()); // Reload cards after saving
      },
    );
  }

  Future<void> _onDeleteCard(
      DeleteCardEvent event, Emitter<CreditcardsState> emit) async {
    emit(CreditcardsLoadingState());
    
    final result = await _creditCardRepo.deleteCard(event.cardId);
    result.fold(
      (failure) => emit(ErrorState(errorMessage: failure.errorMessage)),
      (_) {
        emit(CardDeletedState(cardId: event.cardId));
        add(LoadCardsEvent()); // Reload cards after deletion
      },
    );
  }

  Future<void> _onLoadCards(
      LoadCardsEvent event, Emitter<CreditcardsState> emit) async {
    emit(CreditcardsLoadingState());
    
    final result = await _creditCardRepo.loadCards();
    result.fold(
      (failure) => emit(ErrorState(errorMessage: failure.errorMessage)),
      (cards) {
        _cards = List.from(cards); // Ensure immutability
        emit(CreditCardsLoadedState(cards: _cards));
      },
    );
  }

  Future<void> _onLoadEncryptedCardData(
      LoadEncryptedCardDataEvent event, Emitter<CreditcardsState> emit) async {
    final result = await _creditCardRepo.loadEncryptedCardData(event.cardId);
    result.fold(
      (failure) => emit(ErrorState(errorMessage: failure.errorMessage)),
      (encryptedData) {
        final index = _cards.indexWhere((card) => card.id == event.cardId);
        if (index != -1) {
          _cards = List.from(_cards); // Ensure immutability
          _cards[index] = _cards[index].copyWith(
            encryptedFirst12: encryptedData["encryptedFirst12"] ?? "************",
          );
          emit(CreditCardsLoadedState(cards: List.from(_cards)));
        }
      },
    );
  }
}
