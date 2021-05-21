import 'company.dart';

class CompanyResponse {
  final List<Company> results;
  final String error;

  CompanyResponse(this.results, this.error);

  CompanyResponse.fromJson(Map<String, dynamic> json)
      : results = (json["results"] as List).map((i) => new Company.fromJson(i)).toList(),
        error = "";

  CompanyResponse.withError(String errorValue)
      : results = [],
        error = errorValue;
}
