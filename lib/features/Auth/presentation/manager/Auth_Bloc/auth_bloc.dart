import 'package:banking_app2/features/Auth/data/repos/auth_repo.dart';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'auth_event.dart';
part 'auth_state.dart';

class AuthBloc extends Bloc<AuthEvent, AuthState> {
  final AuthRepo _authRepo;
  AuthBloc(this._authRepo) : super(AuthInitial()) {
    on<AuthEvent>((event, emit) async {
      if (event is RegisterEvent) {
        emit(RegisterLoading());

        final result = await _authRepo.createAccount(
          emailAddress: event.emailAddress,
          password: event.password,
          username: event.username,
          birthDate: event.birthDate,
          phoneNumber: event.phoneNumber,
          city: event.city,
          totalSalary: event.salary,
          reminingSalary: event.salary,
          monthlyLimit: 0,
          saving: 0,
        );
        result.fold(
          (failure) =>
              emit(RegisterFailure(errorMessage: failure.errorMessage)),
          (user) => emit(RegisterSuccess(userName: user.displayName!)),
        );
      }
////////////////////////////////////////////////////////////////
      else if (event is LoginEvent) {
        emit(LoginLoading());

        final result = await _authRepo.signIn(
          emailAddress: event.email,
          password: event.password,
        );

        result.fold(
          (failure) => emit(LoginFailure(errorMessage: failure.errorMessage)),
          (user) => emit(LoginSuccess(userName: user.displayName!)),
        );
      }
////////////////////////////////////////////////////////////////
      else if (event is ResetPassEvent) {
        emit(ResetPassLoading());
        final result = await _authRepo.resetPassword(emailAddress: event.email);

        result.fold(
          (failure) =>
              emit(ResetPassFailure(errorMessage: failure.errorMessage)),
          (success) => emit(ResetPassSuccess()),
        );
      } else if (event is SignOutEvent) {
        emit(SignOutLoading());
        final result = await _authRepo.signOut();

        result.fold(
          (failure) => emit(SignOutFailure(errorMessage: failure.errorMessage)),
          (success) => emit(SignOutSuccess()),
        );
      }
    });
  }
}
