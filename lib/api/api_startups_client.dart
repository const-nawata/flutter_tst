part of 'api_client.dart';

@JsonSerializable()
class Startups {
  bool result;
  StartupsData? data;
  String error_message;
  int? error_code;

  Startups({
    required this.result,
    this.data,
    required this.error_message,
    this.error_code,
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
  String status;
  ChunkItemScreening screening;

  ChunkItem({
    required this.startup_id,
    required this.company_details,
    required this.status,
    required this.screening,
  });

  factory ChunkItem.fromJson(Map<String, dynamic> json) => _$ChunkItemFromJson(json);
  Map<String, dynamic> toJson() => _$ChunkItemToJson(this);
}

@JsonSerializable()
class ChunkItemScreening {
  ScreeningPartner partner;

  ChunkItemScreening({
    required this.partner,
  });

  factory ChunkItemScreening.fromJson(Map<String, dynamic> json) => _$ChunkItemScreeningFromJson(json);
  Map<String, dynamic> toJson() => _$ChunkItemScreeningToJson(this);
}

@JsonSerializable()
class ScreeningPartner {
  String name;

  ScreeningPartner({
    required this.name,
  });

  factory ScreeningPartner.fromJson(Map<String, dynamic> json) => _$ScreeningPartnerFromJson(json);
  Map<String, dynamic> toJson() => _$ScreeningPartnerToJson(this);
}

@JsonSerializable()
class CompanyDetails {
  CompanyLogo logo;
  CompanyAddress address;
  String name;
  String elevator_pitch;
  List<String> industry;

  CompanyDetails({
    required this.logo,
    required this.address,
    required this.name,
    required this.elevator_pitch,
    required this.industry,
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
