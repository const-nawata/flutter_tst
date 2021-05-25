// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'api_client.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Task _$TaskFromJson(Map<String, dynamic> json) {
  return Task(
    id: json['id'] as String,
    name: json['name'] as String,
    avatar: json['avatar'] as String,
    createdAt: json['createdAt'] as String,
  );
}

Map<String, dynamic> _$TaskToJson(Task instance) => <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'avatar': instance.avatar,
      'createdAt': instance.createdAt,
    };

User _$UserFromJson(Map<String, dynamic> json) {
  return User(
    id: json['id'] as String,
    username: json['username'] as String,
    firstname: json['firstname'] as String,
    lastname: json['lastname'] as String,
  );
}

Map<String, dynamic> _$UserToJson(User instance) => <String, dynamic>{
      'id': instance.id,
      'username': instance.username,
      'firstname': instance.firstname,
      'lastname': instance.lastname,
    };

Startups _$StartupsFromJson(Map<String, dynamic> json) {
  return Startups(
    result: json['result'] as bool,
    data: StartupsData.fromJson(json['data'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$StartupsToJson(Startups instance) => <String, dynamic>{
      'result': instance.result,
      'data': instance.data,
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
  );
}

Map<String, dynamic> _$ChunkItemToJson(ChunkItem instance) => <String, dynamic>{
      'startup_id': instance.startup_id,
      'company_details': instance.company_details,
    };

CompanyDetails _$CompanyDetailsFromJson(Map<String, dynamic> json) {
  return CompanyDetails(
    logo: CompanyLogo.fromJson(json['logo'] as Map<String, dynamic>),
    address: CompanyAddress.fromJson(json['address'] as Map<String, dynamic>),
    name: json['name'] as String,
    elevator_pitch: json['elevator_pitch'] as String,
  );
}

Map<String, dynamic> _$CompanyDetailsToJson(CompanyDetails instance) =>
    <String, dynamic>{
      'logo': instance.logo,
      'address': instance.address,
      'name': instance.name,
      'elevator_pitch': instance.elevator_pitch,
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

class _RestTaskClient implements RestTaskClient {
  _RestTaskClient(this._dio, {this.baseUrl}) {
    baseUrl ??= 'https://5d42a6e2bc64f90014a56ca0.mockapi.io/api/v1/';
  }

  final Dio _dio;

  String? baseUrl;

  @override
  Future<List<Task>> getTasks() async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _data = <String, dynamic>{};
    final _result = await _dio.fetch<List<dynamic>>(_setStreamType<List<Task>>(
        Options(method: 'GET', headers: <String, dynamic>{}, extra: _extra)
            .compose(_dio.options, '/tasks',
                queryParameters: queryParameters, data: _data)
            .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    var value = _result.data!
        .map((dynamic i) => Task.fromJson(i as Map<String, dynamic>))
        .toList();
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

class _RestUserClient implements RestUserClient {
  _RestUserClient(this._dio, {this.baseUrl}) {
    baseUrl ??= 'https://60a786943b1e130017176658.mockapi.io/';
  }

  final Dio _dio;

  String? baseUrl;

  @override
  Future<List<User>> getUsers() async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _data = <String, dynamic>{};
    final _result = await _dio.fetch<List<dynamic>>(_setStreamType<List<User>>(
        Options(method: 'GET', headers: <String, dynamic>{}, extra: _extra)
            .compose(_dio.options, '/userdata',
                queryParameters: queryParameters, data: _data)
            .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    var value = _result.data!
        .map((dynamic i) => User.fromJson(i as Map<String, dynamic>))
        .toList();
    return value;
  }

  @override
  Future<User> getUser(userId) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _data = <String, dynamic>{};
    final _result = await _dio.fetch<Map<String, dynamic>>(_setStreamType<User>(
        Options(method: 'GET', headers: <String, dynamic>{}, extra: _extra)
            .compose(_dio.options, '/userdata/$userId',
                queryParameters: queryParameters, data: _data)
            .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = User.fromJson(_result.data!);
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

class _RestInvestorClient implements RestInvestorClient {
  _RestInvestorClient(this._dio, {this.baseUrl}) {
    baseUrl ??= 'https://192.168.30.63/admin/';
  }

  final Dio _dio;

  String? baseUrl;

  @override
  Future<Startups> getStartups() async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _data = <String, dynamic>{};
    final _result = await _dio.fetch<Map<String, dynamic>>(
        _setStreamType<Startups>(
            Options(method: 'GET', headers: <String, dynamic>{}, extra: _extra)
                .compose(_dio.options, '/investors/startups',
                    queryParameters: queryParameters, data: _data)
                .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = Startups.fromJson(_result.data!);
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
