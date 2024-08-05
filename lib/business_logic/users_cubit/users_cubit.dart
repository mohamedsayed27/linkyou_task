import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../core/parameters/user_parameters.dart';
import '../../data/data_source/remote_data_source/users_remote_data_source.dart';
import '../../data/models/users_models/get_users_list_model.dart';

part 'users_state.dart';

class UsersCubit extends Cubit<UsersState> {
  final UsersRemoteDataSource _usersRemoteDataSource = UsersRemoteDataSource();

  UsersCubit() : super(UsersInitial());

  static UsersCubit get(context) => BlocProvider.of(context);
  final ScrollController usersListScrollController = ScrollController();

  void initializeUserListScrollController() {
    usersListScrollController.addListener(() {
      if (usersListScrollController.position.maxScrollExtent ==
              usersListScrollController.offset &&
          usersListScrollController.position.atEdge) {
        if (pageNumber <= totalPages!) getUsersList();
      }
    });
  }

  int pageNumber = 1;
  int? totalPages;

  List<UserModel> usersList = [];

  Future<void> addUser({required AddUserParameters addUserParameters}) async {
    emit(AddUserLoading());
    final response = await _usersRemoteDataSource.addUser(
      addUserParameters: addUserParameters,
    );
    response.fold(
      (l) {
        emit(AddUserError());
      },
      (r) {
        emit(AddUserSuccess());
      },
    );
  }

  Future<void> getUsersList() async {
    if (pageNumber == 1) {
      emit(GetUserLoading());
    } else {
      if (pageNumber <= totalPages!) {
        emit(GetUserPaginationLoading());
      }
    }
    final response = await _usersRemoteDataSource.getUsersList(
      page: "$pageNumber",
    );
    response.fold(
      (l) {
        emit(GetUserError());
      },
      (r) {
        for (var element in r.data ?? []) {
          usersList.add(element);
        }
        totalPages = r.totalPages;
        pageNumber++;
        emit(GetUserSuccess());
      },
    );
  }
}
