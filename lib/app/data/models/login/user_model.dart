import '../../../domain/entities/user_entity.dart';

class UserModel extends UserEntity {
  UserModel({
    int? id,
    String? name,
  }) : super(id: id, name: name);

  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
        id: json["id"],
        name: json["name"],
      );
}
