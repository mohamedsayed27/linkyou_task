part of 'auth_cubit.dart';

sealed class AuthState {}

final class AuthInitial extends AuthState {}
final class GoogleLoginLoading extends AuthState {}
final class GoogleLoginSuccess extends AuthState {
  final GoogleSignInAccount? googleSignInAccount;

  GoogleLoginSuccess({required this.googleSignInAccount});
}
final class GoogleLoginError extends AuthState {
  final String error;

  GoogleLoginError({required this.error});
}
