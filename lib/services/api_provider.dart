import 'package:deep_search_news/constants.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:dio/dio.dart';
import 'api_service.dart';

final dioProvider = Provider((ref) {
  final dio = Dio();
  dio.options.headers['Accept'] = 'application/json';

  // 로깅 추가
  dio.interceptors.add(LogInterceptor(
    requestBody: true,
    responseBody: true,
    responseHeader: true,
    requestHeader: true,
  ));

  return dio;
});

final apiKeyProvider = Provider((ref) => apiKey);

final apiServiceProvider = Provider((ref) {
  final dio = ref.watch(dioProvider);
  return ApiService(dio);
});
