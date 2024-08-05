
import 'package:equatable/equatable.dart';

class AddUserModel extends Equatable {
  final String? name;
  final String? job;
  final String? id;
  final String? createdAt;

  const AddUserModel({this.name, this.job, this.id, this.createdAt});

  factory AddUserModel.fromJson(Map<String, dynamic> json) {
    return AddUserModel(
      name: json['name'] as String?,
      job: json['job'] as String?,
      id: json['id'] as String?,
      createdAt: json['createdAt'] as String?,
    );
  }

  @override
  List<Object?> get props => [name, job, id, createdAt];
}