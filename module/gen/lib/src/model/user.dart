import 'package:vexana/vexana.dart';
import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
part 'user.g.dart';

@JsonSerializable()
class User extends INetworkModel<User> with EquatableMixin {
  final String? id;
  final String? name;
  final String? email;
  final String? photoUrl;
  final String? token;

  User({
    this.id,
    this.name,
    this.email,
    this.photoUrl,
    this.token,
  });

  @override
  User fromJson(Map<String, dynamic> json) => User.fromJson(json);

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);

  @override
  Map<String, dynamic>? toJson() => _$UserToJson(this);

  @override
  List<Object?> get props => [id, id, name, email, photoUrl, token];

  User copyWith({
    String? id,
    String? name,
    String? email,
    String? photoUrl,
    String? token,
  }) {
    return User(
      id: id ?? this.id,
      name: name ?? this.name,
      email: email ?? this.email,
      photoUrl: photoUrl ?? this.photoUrl,
      token: token ?? this.token,
    );
  }
}
