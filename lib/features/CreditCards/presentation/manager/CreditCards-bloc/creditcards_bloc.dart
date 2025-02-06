import 'package:banking_app2/features/CreditCards/data/credit_card_model.dart';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'creditcards_event.dart';
part 'creditcards_state.dart';

class CreditcardsBloc extends Bloc<CreditcardsEvent, CreditcardsState> {
  CreditcardsBloc() : super(CreditcardsInitialState()) {
    on<CreditcardsEvent>((event, emit) {
      // TODO: implement event handler
    });
  }
}
