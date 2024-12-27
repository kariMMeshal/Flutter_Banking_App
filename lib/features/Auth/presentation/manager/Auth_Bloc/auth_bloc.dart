import 'package:banking_app2/core/Helpers/authFunctionsHelper/create_account.dart';
import 'package:bloc/bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:meta/meta.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  AuthBloc() : super(AuthInitial()) {
    on<AuthEvent>((event, emit) async {
      if (event is RegisterEvent) {
        emit(RegisterLoading());
        try {
          await createAccount(
            emailAddress: event.emailAddress,
            password: event.password,
            username: event.username,
            birthDate: event.birthDate,
            phoneNumber: event.phoneNumber,
            city: event.city,
          );
          emit(RegisterSuccess(userName: event.username));
        } on FirebaseAuthException catch (ex) {
          if (ex.code == 'weak-password') {
            emit(RegisterFailure(errorMessage: "Weak-Pass"));
          } else if (ex.code == 'email-already-in-use') {
            emit(RegisterFailure(errorMessage: "email-already-in-use"));
          } else {
            emit(RegisterFailure(errorMessage: "Invalid Credentials"));
          }
        } catch (ex) {
          emit(RegisterFailure(
            errorMessage: " Something Went Wrong please try again :/",
          ));
        }
      }
    });
  }
}
