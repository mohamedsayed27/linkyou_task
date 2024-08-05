import 'package:equatable/equatable.dart';

class UserModel extends Equatable {
  final int? id;
  final String? email;
  final String? firstName;
  final String? lastName;
  final String? avatar;

  const UserModel({this.id, this.email, this.firstName, this.lastName, this.avatar});

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
      id: json['id'] as int?,
      email: json['email'] as String?,
      firstName: json['first_name'] as String?,
      lastName: json['last_name'] as String?,
      avatar: json['avatar'] as String?,
    );
  }

  @override
  List<Object?> get props => [id, email, firstName, lastName, avatar];
}

class Support extends Equatable {
  final String? url;
  final String? text;

  const Support({this.url, this.text});

  factory Support.fromJson(Map<String, dynamic> json) {
    return Support(
      url: json['url'] as String?,
      text: json['text'] as String?,
    );
  }

  @override
  List<Object?> get props => [url, text];
}

class GetUsersListModel extends Equatable {
  final int? page;
  final int? perPage;
  final int? total;
  final int? totalPages;
  final List<UserModel>? data;
  final Support? support;

  const GetUsersListModel({
    this.page,
    this.perPage,
    this.total,
    this.totalPages,
    this.data,
    this.support,
  });

  factory GetUsersListModel.fromJson(Map<String, dynamic> json) {
    return GetUsersListModel(
      page: json['page'] as int?,
      perPage: json['per_page'] as int?,
      total: json['total'] as int?,
      totalPages: json['total_pages'] as int?,
      data: (json['data'] as List<dynamic>?)
          ?.map((e) => UserModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      support: json['support'] != null
          ? Support.fromJson(json['support'] as Map<String, dynamic>)
          : null,
    );
  }

  @override
  List<Object?> get props => [page, perPage, total, totalPages, data, support];
}
