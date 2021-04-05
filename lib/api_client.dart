import 'package:json_annotation/json_annotation.dart';
import 'package:retrofit/retrofit.dart';
import 'package:dio/dio.dart';

part 'api_client.g.dart';

@RestApi(baseUrl: "https://5d42a6e2bc64f90014a56ca0.mockapi.io/api/v1/")
abstract class RestClient {
  factory RestClient(Dio dio, {String baseUrl}) = _RestClient;

  @GET("/tasks")
  Future<List<Task>> getTasks();
}

@JsonSerializable()
class Task {
  String id;
  String name;
  String avatar;
  String createdAt;

  Task({this.id, this.name, this.avatar, this.createdAt});

  factory Task.fromJson(Map<String, dynamic> json) {
    return Task(
      id: json['id'],
      name: json['name'],
      avatar: json['avatar'],
      createdAt: json['createdAt'],
    );
  }

  // factory Task.fromJson(Map<String, dynamic> json) => _$TaskFromJson(json);
  // Map<String, dynamic> toJson() => _$TaskToJson(this);
}

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
