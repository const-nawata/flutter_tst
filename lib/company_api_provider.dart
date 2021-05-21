import 'package:dio/dio.dart';

import 'company_response.dart';

class CompanyApiProvider {
  final String _endpoint = "https://60a786943b1e130017176658.mockapi.io/fundsupmock/companies";
  final Dio _dio = Dio();

  Future<CompanyResponse> getCompanies() async {
    try {
      Response response = await _dio.get(_endpoint);
      return CompanyResponse.fromJson(response.data);
    } catch (error, stacktrace) {
      print("Exception occured: $error stackTrace: $stacktrace");
      return CompanyResponse.withError("$error");
    }
  }
}
