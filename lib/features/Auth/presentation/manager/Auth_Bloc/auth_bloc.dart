import 'package:banking_app2/features/Auth/data/repos/auth_repo.dart';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final AuthRepo _authRepo; // Injecting AuthRepo (AuthRepoImpl)

  AuthBloc(this._authRepo) : super(AuthInitial()) {
    on<AuthEvent>((event, emit) async {
      if (event is RegisterEvent) {
        emit(RegisterLoading());

        // Call the createAccount method of AuthRepoImpl
        final result = await _authRepo.createAccount(
          emailAddress: event.emailAddress,
          password: event.password,
          username: event.username,
          birthDate: event.birthDate,
          phoneNumber: event.phoneNumber,
          city: event.city,
          totalSalary: event.salary,
          reminingSalary: event.salary,
        );
        result.fold(
          (failure) {
            emit(RegisterFailure(errorMessage: failure.errorMessage));
          },
          (user) {
            emit(RegisterSuccess(userName: user.displayName!));
          },
        );
      }
////////////////////////////////////////////////////////////////
      else if (event is LoginEvent) {
        emit(LoginLoading());

        // Call the signIn method of AuthRepoImpl
        final result = await _authRepo.signIn(
          emailAddress: event.email,
          password: event.password,
        );

        // Handling the result with fold
        result.fold(
          (failure) {
            // If failure, emit LoginFailure with the error message
            emit(LoginFailure(errorMessage: failure.errorMessage));
          },
          (user) {
            // If success, emit LoginSuccess with the user name
            emit(LoginSuccess(userName: user.displayName!));
          },
        );
      }
////////////////////////////////////////////////////////////////
      else if (event is ResetPassEvent) {
        emit(ResetPassLoading());
        final result = await _authRepo.resetPassword(emailAddress: event.email);

        result.fold(
          (failure) {
            emit(ResetPassFailure(errorMessage: failure.errorMessage));
          },
          (success) {
            emit(ResetPassSuccess());
          },
        );
      }
    });
  }
}
