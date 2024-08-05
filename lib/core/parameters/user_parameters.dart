import 'package:equatable/equatable.dart';

class AddUserParameters extends Equatable {
  final String name;
  final String job;

  const AddUserParameters({
    required this.name,
    required this.job,
  });

  Map<String, dynamic> toJson() => {
        "name": name,
        "job": job,
      };

  @override
  // TODO: implement props
  List<Object?> get props => [
        name,
        job,
      ];
}
