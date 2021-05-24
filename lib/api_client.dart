import 'package:json_annotation/json_annotation.dart';
import 'package:retrofit/retrofit.dart';
import 'package:dio/dio.dart';

part 'api_client.g.dart';

@RestApi(baseUrl: "https://5d42a6e2bc64f90014a56ca0.mockapi.io/api/v1/")
abstract class RestTaskClient {
  factory RestTaskClient(Dio dio, {String baseUrl}) = _RestTaskClient;

  @GET("/tasks")
  Future<List<Task>> getTasks();
}

@JsonSerializable()
class Task {
  String id;
  String name;
  String avatar;
  String createdAt;

  Task({
    required this.id,
    required this.name,
    required this.avatar,
    required this.createdAt,
  });

  factory Task.fromJson(Map<String, dynamic> json) => _$TaskFromJson(json);
  Map<String, dynamic> toJson() => _$TaskToJson(this);
}

@RestApi(baseUrl: "https://60a786943b1e130017176658.mockapi.io/")
abstract class RestUserClient {
  factory RestUserClient(Dio dio, {String baseUrl}) = _RestUserClient;

  @GET("/userdata")
  Future<List<User>> getUsers();

  @GET("/userdata/{id}")
  Future<User> getUser(@Path("id") int userId);
}

@JsonSerializable()
class User {
  String id;
  String username;
  String firstname;
  String lastname;

  User({
    required this.id,
    required this.username,
    required this.firstname,
    required this.lastname,
  });

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);
  Map<String, dynamic> toJson() => _$UserToJson(this);
}
