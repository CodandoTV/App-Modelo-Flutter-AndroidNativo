import 'package:equatable/equatable.dart';

class User extends Equatable {
  final int code;
  final String name;
  final String description;

  User({required this.code, required this.name, required this.description});

  List<Object?> get props => [];
}
