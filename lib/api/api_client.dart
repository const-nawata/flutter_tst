import 'package:json_annotation/json_annotation.dart';
import 'package:retrofit/retrofit.dart';
import 'package:dio/dio.dart';

part 'api_client.g.dart';

part 'api_startups_client.dart';

@RestApi(baseUrl: "https://192.168.30.63/admin/")
abstract class RestInvestorClient {
  factory RestInvestorClient(Dio dio, {String baseUrl}) = _RestInvestorClient;

  @GET("/investors/startups")
  Future<Startups> getStartups();
}
