import 'package:json_annotation/json_annotation.dart';
import 'package:retrofit/retrofit.dart';
import 'package:dio/dio.dart';

part 'api_client.g.dart';

@RestApi(baseUrl: "https://192.168.30.63/admin/auth/")
abstract class RestUserClient {
  factory RestUserClient(Dio dio, {String baseUrl}) = _RestUserClient;

  @GET("/userdata")
  Future<List<User>> getUsers();

  @GET("/userdata?userId={id}")
  Future<User> getUser(@Path("id") int userId);
}

@JsonSerializable()
class User {
  int id;
  String username;
  String firstname;
  String lastname;

  User({this.id, this.username, this.firstname, this.lastname});

  factory User.fromJson(Map<String, dynamic> json) {
    // return null;

    return User(
      id: json['id'],
      username: json['username'],
      firstname: json['firstname'],
      lastname: json['lastname'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': this.id,
      'firstname': this.firstname,
      'lastname': this.lastname,
      'username': this.username
    };
  }
}
