import 'package:json_annotation/json_annotation.dart';
import 'package:retrofit/retrofit.dart';
import 'package:dio/dio.dart';

part 'api_client.g.dart';

part 'api_startups_client.dart';

// @RestApi(baseUrl: "https://192.168.30.63/admin/")
@RestApi(baseUrl: "http://uat-aws-api.fundsup.co/")
abstract class RestInvestorClient {
  factory RestInvestorClient(Dio dio, {String baseUrl}) = _RestInvestorClient;

  @GET("/investors/startups")
  // Future<Startups> getStartups(@Header('token') String token);
  Future<Startups> getStartups(
    @Header('access_token') String token,
    @Query('limit') int limit,
    @Query('offset') int offset,
  );

  @POST('/auth/refresh/accesstoken')
  // @FormUrlEncoded()
  Future<RefreshTokenResponse> refreshToken(
    @Field() String refreshToken,
  );
}

@JsonSerializable()
class RefreshTokenResponse {
  bool result;
  RefreshTokenData? data;
  String error_message;
  int? error_code;

  RefreshTokenResponse({
    required this.result,
    this.data,
    required this.error_message,
    this.error_code,
  });

  factory RefreshTokenResponse.fromJson(Map<String, dynamic> json) => _$RefreshTokenResponseFromJson(json);
  Map<String, dynamic> toJson() => _$RefreshTokenResponseToJson(this);
}

@JsonSerializable()
class RefreshTokenData {
  String access_token;
  String access_token_expiration_date;

  RefreshTokenData({
    required this.access_token,
    required this.access_token_expiration_date,
  });

  factory RefreshTokenData.fromJson(Map<String, dynamic> json) => _$RefreshTokenDataFromJson(json);
  Map<String, dynamic> toJson() => _$RefreshTokenDataToJson(this);
}
