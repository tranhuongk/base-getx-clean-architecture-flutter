import 'package:equatable/equatable.dart';

class UserModel extends Equatable {
  final int? id;
  final String? name;

  const UserModel({
    this.id,
    this.name,
  });

  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
        id: int.tryParse(json["id"].toString()),
        name: json["name"]?.toString(),
      );

  Map<String, dynamic> toJson() {
    return {
      "id": id,
      "name": name,
    };
  }

  @override
  List<Object?> get props => [id];
}
