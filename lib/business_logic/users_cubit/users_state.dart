part of 'users_cubit.dart';

sealed class UsersState {}

final class UsersInitial extends UsersState {}
final class Loading extends UsersState {}
final class Success extends UsersState {}
final class Error extends UsersState {}

final class AddUserLoading extends UsersState {}
final class AddUserSuccess extends UsersState {}
final class AddUserError extends UsersState {}

final class GetUserLoading extends UsersState {}
final class GetUserPaginationLoading extends UsersState {}
final class GetUserSuccess extends UsersState {}
final class GetUserError extends UsersState {}
