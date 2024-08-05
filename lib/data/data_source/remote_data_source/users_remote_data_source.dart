import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:linkyou_task/core/network/dio_helper.dart';

import '../../../core/error/error_exception.dart';
import '../../../core/network/api_end_points.dart';
import '../../../core/network/error_message_model.dart';
import '../../../core/parameters/user_parameters.dart';
import '../../models/users_models/add_user_model.dart';
import '../../models/users_models/get_users_list_model.dart';

class UsersRemoteDataSource {
  final DioHelper _dioHelper = DioHelper();

  Future<Either<ErrorException, GetUsersListModel>> getUsersList({
    required String page,
}) async {
    try {
      final response = await _dioHelper.getData(
        url: EndPoints.users,
        query: {
          "per_page":10,
          "page":page,
        }
      );
      return Right(
        GetUsersListModel.fromJson(
          response.data,
        ),
      );
    } catch (e) {
      if (e is DioException) {
        return Left(
          ErrorException(
            baseErrorModel: BaseErrorModel(
              message: e.message ?? "",
              success: false,
              code: e.response?.statusCode ?? 0,
              errors: [e.message ?? ""],
            ),
          ),
        );
      } else {
        return Left(
          ErrorException(
            baseErrorModel: BaseErrorModel(
              message: "Error ${e.toString()}",
              success: false,
              code: 300,
              errors: ["Error ${e.toString()}"],
            ),
          ),
        );
      }
    }
  }

  Future<Either<ErrorException, AddUserModel>> addUser({
    required AddUserParameters addUserParameters,
  }) async {
    try {
      final response = await _dioHelper.postData(
        url: EndPoints.users,
        data: addUserParameters.toJson(),
      );
      return Right(
        AddUserModel.fromJson(
          response.data,
        ),
      );
    } catch (e) {
      if (e is DioException) {
        return Left(
          ErrorException(
            baseErrorModel: BaseErrorModel(
              message: e.message ?? "",
              success: false,
              code: e.response?.statusCode ?? 0,
              errors: [e.message ?? ""],
            ),
          ),
        );
      } else {
        return Left(
          ErrorException(
            baseErrorModel: BaseErrorModel(
              message: "Error ${e.toString()}",
              success: false,
              code: 0,
              errors: ["Error ${e.toString()}"],
            ),
          ),
        );
      }
    }
  }
}
