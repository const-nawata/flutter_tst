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

@RestApi(baseUrl: "https://192.168.30.63/admin/")
abstract class RestInvestorClient {
  factory RestInvestorClient(Dio dio, {String baseUrl}) = _RestInvestorClient;

  @GET("/investors/startups")
  Future<Startups> getStartups();
}

@JsonSerializable()
class Startups {
  bool result;
  StartupsData data;

  Startups({
    required this.result,
    required this.data,
  });

  factory Startups.fromJson(Map<String, dynamic> json) => _$StartupsFromJson(json);
  Map<String, dynamic> toJson() => _$StartupsToJson(this);
}

@JsonSerializable()
class StartupsData {
  List<ChunkItem> chunk;
  StartupsData({
    required this.chunk,
  });

  factory StartupsData.fromJson(Map<String, dynamic> json) => _$StartupsDataFromJson(json);
  Map<String, dynamic> toJson() => _$StartupsDataToJson(this);
}

@JsonSerializable()
class ChunkItem {
  String startup_id;
  CompanyDetails company_details;

  ChunkItem({
    required this.startup_id,
    required this.company_details,
  });

  factory ChunkItem.fromJson(Map<String, dynamic> json) => _$ChunkItemFromJson(json);
  Map<String, dynamic> toJson() => _$ChunkItemToJson(this);
}

@JsonSerializable()
class CompanyDetails {
  CompanyLogo logo;
  CompanyAddress address;
  String name;
  String elevator_pitch;

  CompanyDetails({
    required this.logo,
    required this.address,
    required this.name,
    required this.elevator_pitch,
  });

  factory CompanyDetails.fromJson(Map<String, dynamic> json) => _$CompanyDetailsFromJson(json);
  Map<String, dynamic> toJson() => _$CompanyDetailsToJson(this);
}

@JsonSerializable()
class CompanyLogo {
  String url;

  CompanyLogo({
    required this.url,
  });

  factory CompanyLogo.fromJson(Map<String, dynamic> json) => _$CompanyLogoFromJson(json);
  Map<String, dynamic> toJson() => _$CompanyLogoToJson(this);
}

@JsonSerializable()
class CompanyAddress {
  String country;
  String city;

  CompanyAddress({
    required this.country,
    required this.city,
  });

  factory CompanyAddress.fromJson(Map<String, dynamic> json) => _$CompanyAddressFromJson(json);
  Map<String, dynamic> toJson() => _$CompanyAddressToJson(this);
}
