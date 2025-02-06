import 'package:dartz/dartz.dart';
import 'package:banking_app2/core/errors/failures.dart';
import 'package:banking_app2/features/CreditCards/data/credit_card_model.dart';

abstract class CreditCardRepo {
  Future<Either<Failures, void>> saveCard(CreditCardModel card);
  Future<Either<Failures, void>> deleteCard(String cardId);
  Future<Either<Failures, List<CreditCardModel>>> loadCards();
  Future<Either<Failures, Map<String, String?>>> loadEncryptedCardData(String cardId);
}