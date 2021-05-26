// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'api_client.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RefreshTokenResponse _$RefreshTokenResponseFromJson(Map<String, dynamic> json) {
  return RefreshTokenResponse(
    result: json['result'] as bool,
    data: json['data'] == null
        ? null
        : RefreshTokenData.fromJson(json['data'] as Map<String, dynamic>),
    error_message: json['error_message'] as String,
    error_code: json['error_code'] as int?,
  );
}

Map<String, dynamic> _$RefreshTokenResponseToJson(
        RefreshTokenResponse instance) =>
    <String, dynamic>{
      'result': instance.result,
      'data': instance.data,
      'error_message': instance.error_message,
      'error_code': instance.error_code,
    };

RefreshTokenData _$RefreshTokenDataFromJson(Map<String, dynamic> json) {
  return RefreshTokenData(
    access_token: json['access_token'] as String,
    access_token_expiration_date:
        json['access_token_expiration_date'] as String,
  );
}

Map<String, dynamic> _$RefreshTokenDataToJson(RefreshTokenData instance) =>
    <String, dynamic>{
      'access_token': instance.access_token,
      'access_token_expiration_date': instance.access_token_expiration_date,
    };

Startups _$StartupsFromJson(Map<String, dynamic> json) {
  return Startups(
    result: json['result'] as bool,
    data: json['data'] == null
        ? null
        : StartupsData.fromJson(json['data'] as Map<String, dynamic>),
    error_message: json['error_message'] as String,
    error_code: json['error_code'] as int?,
  );
}

Map<String, dynamic> _$StartupsToJson(Startups instance) => <String, dynamic>{
      'result': instance.result,
      'data': instance.data,
      'error_message': instance.error_message,
      'error_code': instance.error_code,
    };

StartupsData _$StartupsDataFromJson(Map<String, dynamic> json) {
  return StartupsData(
    chunk: (json['chunk'] as List<dynamic>)
        .map((e) => ChunkItem.fromJson(e as Map<String, dynamic>))
        .toList(),
  );
}

Map<String, dynamic> _$StartupsDataToJson(StartupsData instance) =>
    <String, dynamic>{
      'chunk': instance.chunk,
    };

ChunkItem _$ChunkItemFromJson(Map<String, dynamic> json) {
  return ChunkItem(
    startup_id: json['startup_id'] as String,
    company_details: CompanyDetails.fromJson(
        json['company_details'] as Map<String, dynamic>),
    status: json['status'] as String,
    screening:
        ChunkItemScreening.fromJson(json['screening'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$ChunkItemToJson(ChunkItem instance) => <String, dynamic>{
      'startup_id': instance.startup_id,
      'company_details': instance.company_details,
      'status': instance.status,
      'screening': instance.screening,
    };

ChunkItemScreening _$ChunkItemScreeningFromJson(Map<String, dynamic> json) {
  return ChunkItemScreening(
    partner: ScreeningPartner.fromJson(json['partner'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$ChunkItemScreeningToJson(ChunkItemScreening instance) =>
    <String, dynamic>{
      'partner': instance.partner,
    };

ScreeningPartner _$ScreeningPartnerFromJson(Map<String, dynamic> json) {
  return ScreeningPartner(
    name: json['name'] as String,
  );
}

Map<String, dynamic> _$ScreeningPartnerToJson(ScreeningPartner instance) =>
    <String, dynamic>{
      'name': instance.name,
    };

CompanyDetails _$CompanyDetailsFromJson(Map<String, dynamic> json) {
  return CompanyDetails(
    logo: CompanyLogo.fromJson(json['logo'] as Map<String, dynamic>),
    address: CompanyAddress.fromJson(json['address'] as Map<String, dynamic>),
    name: json['name'] as String,
    elevator_pitch: json['elevator_pitch'] as String,
    industry:
        (json['industry'] as List<dynamic>).map((e) => e as String).toList(),
  );
}

Map<String, dynamic> _$CompanyDetailsToJson(CompanyDetails instance) =>
    <String, dynamic>{
      'logo': instance.logo,
      'address': instance.address,
      'name': instance.name,
      'elevator_pitch': instance.elevator_pitch,
      'industry': instance.industry,
    };

CompanyLogo _$CompanyLogoFromJson(Map<String, dynamic> json) {
  return CompanyLogo(
    url: json['url'] as String,
  );
}

Map<String, dynamic> _$CompanyLogoToJson(CompanyLogo instance) =>
    <String, dynamic>{
      'url': instance.url,
    };

CompanyAddress _$CompanyAddressFromJson(Map<String, dynamic> json) {
  return CompanyAddress(
    country: json['country'] as String,
    city: json['city'] as String,
  );
}

Map<String, dynamic> _$CompanyAddressToJson(CompanyAddress instance) =>
    <String, dynamic>{
      'country': instance.country,
      'city': instance.city,
    };

// **************************************************************************
// RetrofitGenerator
// **************************************************************************

class _RestInvestorClient implements RestInvestorClient {
  _RestInvestorClient(this._dio, {this.baseUrl}) {
    baseUrl ??= 'http://uat-aws-api.fundsup.co/';
  }

  final Dio _dio;

  String? baseUrl;

  @override
  Future<Startups> getStartups(token, limit, offset) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{
      r'limit': limit,
      r'offset': offset
    };
    final _data = <String, dynamic>{};
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<Startups>(Options(
                method: 'GET',
                headers: <String, dynamic>{r'access_token': token},
                extra: _extra)
            .compose(_dio.options, '/investors/startups',
                queryParameters: queryParameters, data: _data)
            .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = Startups.fromJson(_result.data!);
    return value;
  }

  @override
  Future<RefreshTokenResponse> refreshToken(refreshToken) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _data = {'refreshToken': refreshToken};
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<RefreshTokenResponse>(
            Options(method: 'POST', headers: <String, dynamic>{}, extra: _extra)
                .compose(_dio.options, '/auth/refresh/accesstoken',
                    queryParameters: queryParameters, data: _data)
                .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = RefreshTokenResponse.fromJson(_result.data!);
    return value;
  }

  RequestOptions _setStreamType<T>(RequestOptions requestOptions) {
    if (T != dynamic &&
        !(requestOptions.responseType == ResponseType.bytes ||
            requestOptions.responseType == ResponseType.stream)) {
      if (T == String) {
        requestOptions.responseType = ResponseType.plain;
      } else {
        requestOptions.responseType = ResponseType.json;
      }
    }
    return requestOptions;
  }
}
