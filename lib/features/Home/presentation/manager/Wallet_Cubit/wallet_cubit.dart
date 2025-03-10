import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:meta/meta.dart';

part 'wallet_state.dart';

class WalletCubit extends Cubit<WalletState> {
  WalletCubit(this._firebaseAuth) : super(WalletInitial());

  final FirebaseAuth _firebaseAuth;
  num currentAmount = 0.0;
  num totalSalary = 0.0;
  num monthlyLimit = 0.0;
  num saving = 0.0;

  // Fetch salary from Firestore
  Future<void> fetchSalary() async {
    emit(WalletLoading());
    try {
      DocumentSnapshot userDoc = await FirebaseFirestore.instance
          .collection('users')
          .doc(_firebaseAuth.currentUser!.uid)
          .get();

      final userData = userDoc.data() as Map<String, dynamic>?;

      if (userData != null && userData.containsKey('totalSalary')) {
        totalSalary = userData['totalSalary'] as num;
        currentAmount = userData['remainingAmount'] as num;
        emit(WalletUpdated(
            totalSalary: totalSalary, remainingAmount: currentAmount));
      } else {
        emit(WalletError(message: 'Salary field does not exist'));
      }
    } catch (e) {
      emit(WalletError(message: 'Error fetching salary: $e'));
    }
  }

  // Increase the amount
  void increaseAmount({required num value}) async {
    currentAmount += value;
    await _updateFirestore(remainingAmount: currentAmount);
    emit(WalletUpdated(
        totalSalary: totalSalary, remainingAmount: currentAmount));
  }

  // Decrease the amount
  void decreaseAmount({required num value}) async {
    if (currentAmount >= value) {
      currentAmount -= value;
      await _updateFirestore(remainingAmount: currentAmount);
      emit(WalletUpdated(
          totalSalary: totalSalary, remainingAmount: currentAmount));
    } else {
      emit(WalletError(message: 'No enough money you broke'));
    }
  }

  // Update the salary
  void updateSalary({required num newSalary}) async {
    totalSalary = newSalary;
    await _updateFirestore(totalSalary: newSalary);
    emit(WalletUpdated(totalSalary: newSalary, remainingAmount: currentAmount));
  }

  //Update Monthly limit
  void updateMonthlyLimit({required num newLimit}) async {
    monthlyLimit = newLimit;
    _updateFirestore(monthlyLimit: newLimit);
  }

  //Update saving
  void updateSaving({required num newSaving}) {
    saving = newSaving;
    _updateFirestore(saving: newSaving);
  }

  // Helper method to update Firestore
  Future<void> _updateFirestore({
    num? totalSalary,
    num? remainingAmount,
    num? saving,
    num? monthlyLimit,
  }) async {
    try {
      final Map<String, dynamic> updateData = {};
      if (totalSalary != null) updateData['totalSalary'] = totalSalary;
      if (remainingAmount != null) {
        updateData['remainingAmount'] = remainingAmount;
      }
      if (saving != null) updateData['saving'] = saving;
      if (monthlyLimit != null) updateData['monthlyLimit'] = monthlyLimit;
      await FirebaseFirestore.instance
          .collection('users')
          .doc(_firebaseAuth.currentUser!.uid)
          .update(updateData);
    } catch (e) {
      emit(WalletError(message: 'Error updating Firestore: $e'));
    }
  }
}
