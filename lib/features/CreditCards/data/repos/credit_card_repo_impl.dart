import 'package:banking_app2/features/CreditCards/data/credit_card_secure_storage.dart';
import 'package:banking_app2/features/CreditCards/data/repos/credit_card_repo.dart';
import 'package:dartz/dartz.dart';
import 'package:banking_app2/features/CreditCards/data/credit_card_model.dart';
import 'package:banking_app2/features/CreditCards/data/credit_cards_sqflite_helper.dart';
import 'package:banking_app2/core/errors/failures.dart';

class CreditCardRepoImpl implements CreditCardRepo {
  @override
  Future<Either<Failures, void>> saveCard(CreditCardModel card) async {
    try {
      await SecureStorageHelper.saveEncryptedData(card.id, 'encryptedFirst12',
          card.cardNumber.substring(0, card.cardNumber.length - 4));
      await SecureStorageHelper.saveEncryptedData(
          card.id, 'encryptedCVV', card.encryptedCVV);

      await CreditCardsSqfliteHelper.insertCard({
        'id': card.id,
        'cardType': card.cardType,
        'last4': card.cardNumber.substring(card.cardNumber.length - 4),
        'cardholderName': card.cardholderName,
        'expiryDate': card.expiryDate,
      });

      return const Right(null);
    } catch (e) {
      return Left(DatabaseFailures('Failed to save card: $e'));
    }
  }

  @override
  Future<Either<Failures, void>> deleteCard(String cardId) async {
    try {
      await SecureStorageHelper.deleteEncryptedData(cardId, 'encryptedFirst12');
      await SecureStorageHelper.deleteEncryptedData(cardId, 'encryptedCVV');
      await CreditCardsSqfliteHelper.deleteCard(cardId);
      return const Right(null);
    } catch (e) {
      return Left(DatabaseFailures('Failed to delete card: $e'));
    }
  }

  @override
  Future<Either<Failures, List<CreditCardModel>>> loadCards() async {
    try {
      final data = await CreditCardsSqfliteHelper.getCards();
      final cards = data.map((e) => CreditCardModel.fromMap(e)).toList();
      return Right(cards);
    } catch (e) {
      return Left(DatabaseFailures('Failed to load cards: $e'));
    }
  }

  @override
  Future<Either<Failures, Map<String, String?>>> loadEncryptedCardData(
      String cardId) async {
    try {
      final encryptedFirst12 = await SecureStorageHelper.getEncryptedData(
          cardId, 'encryptedFirst12');
      final encryptedCVV =
          await SecureStorageHelper.getEncryptedData(cardId, 'encryptedCVV');

      if (encryptedFirst12 == null || encryptedCVV == null) {
        return const Left(
            DatabaseFailures('Failed to retrieve encrypted data.'));
      }

      return Right({
        'encryptedFirst12': encryptedFirst12,
        'encryptedCVV': encryptedCVV,
      });
    } catch (e) {
      return Left(
          DatabaseFailures('Failed to retrieve encrypted card data: $e'));
    }
  }
}
