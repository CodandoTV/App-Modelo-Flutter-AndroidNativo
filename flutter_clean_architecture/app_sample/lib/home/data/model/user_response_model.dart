import 'package:json_annotation/json_annotation.dart';

part 'user_response_model.g.dart';

@JsonSerializable()
class UserResponse {
  @JsonKey(name: 'id')
  final int code;
  @JsonKey(name: 'name')
  final String name;
  @JsonKey(name: 'description')
  final String? description;

  UserResponse({
    required this.code,
    required this.name,
    this.description,
  });

  factory UserResponse.fromJson(Map<String, dynamic> json) =>
      _$UserResponseFromJson(json);
  Map<String, dynamic> toJson() => _$UserResponseToJson(this);
}
