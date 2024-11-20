import 'package:deep_search_news/models/global_article_model.dart';
import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

part 'api_service.g.dart';

@RestApi(baseUrl: "https://api-v2.deepsearch.com/v1/")
abstract class ApiService {
  factory ApiService(Dio dio, {String baseUrl}) = _ApiService;

  @GET("/global-articles")
  Future<GlobalArticleResponse> getGlobalArticles({
    @Query("api_key") required String apiKey,
    @Query("page") int? page,
    @Query("page_size") int? pageSize,
    @Query("keyword") String? keyword,
    @Query("company_name") String? companyName,
    @Query("symbols") String? symbols,
    @Query("date_from") String? dateFrom,
    @Query("date_to") String? dateTo,
  });
}
