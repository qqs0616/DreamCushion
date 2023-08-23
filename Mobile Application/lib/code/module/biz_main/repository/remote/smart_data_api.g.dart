// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'smart_data_api.dart';

// **************************************************************************
// RetrofitGenerator
// **************************************************************************

// ignore_for_file: unnecessary_brace_in_string_interps,no_leading_underscores_for_local_identifiers

class _SmartDataApi implements SmartDataApi {
  _SmartDataApi(
    this._dio, {
    this.baseUrl,
  }) {
    baseUrl ??= 'http://121.40.31.87:9200';
  }

  final Dio _dio;

  String? baseUrl;

  @override
  Future<ResultEntity> getListByDate(targetDate) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{r'targetDate': targetDate};
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{};
    final _result = await _dio
        .fetch<Map<String, dynamic>>(_setStreamType<ResultEntity>(Options(
      method: 'GET',
      headers: _headers,
      extra: _extra,
    )
            .compose(
              _dio.options,
              '/blade-smart/dev_data/getListByDate',
              queryParameters: queryParameters,
              data: _data,
            )
            .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = ResultEntity.fromJson(_result.data!);
    return value;
  }

  @override
  Future<ResultEntity> getListByDate2(targetDate) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{r'targetDate': targetDate};
    final _headers = <String, dynamic>{};
    final _data = <String, dynamic>{};
    final _result = await _dio
        .fetch<Map<String, dynamic>>(_setStreamType<ResultEntity>(Options(
      method: 'GET',
      headers: _headers,
      extra: _extra,
    )
            .compose(
              _dio.options,
              '/blade-smart/dev_data/getListByDate2',
              queryParameters: queryParameters,
              data: _data,
            )
            .copyWith(baseUrl: baseUrl ?? _dio.options.baseUrl)));
    final value = ResultEntity.fromJson(_result.data!);
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
