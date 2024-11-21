import 'package:deep_search_news/models/global_article_model.dart';
import 'package:deep_search_news/services/api_provider.dart';
import 'package:deep_search_news/services/api_service.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final globalArticleProvider = StateNotifierProvider<GlobalArticleViewModel,
    AsyncValue<GlobalArticleResponse>>((ref) {
  final apiService = ref.watch(apiServiceProvider);
  final apiKey = ref.watch(apiKeyProvider);
  return GlobalArticleViewModel(apiService, apiKey);
});

class GlobalArticleViewModel
    extends StateNotifier<AsyncValue<GlobalArticleResponse>> {
  final ApiService _apiService;
  final String _apiKey;
  int _currentPage = 1;
  static const int _pageSize = 20;
  final List<GlobalArticle> _articles = [];

  GlobalArticleViewModel(this._apiService, this._apiKey)
      : super(const AsyncValue.loading()) {
    getGlobalArticle();
  }

  Future<void> getGlobalArticle({
    int? page,
    String? keyword,
    String? companyName,
    String? symbols,
    String? dateFrom,
    String? dateTo,
  }) async {
    try {
      state = const AsyncValue.loading();
      final response = await _apiService.getGlobalArticles(
        apiKey: _apiKey,
        page: page ?? _currentPage,
        pageSize: _pageSize,
        keyword: keyword,
        companyName: companyName,
        symbols: symbols,
        dateFrom: dateFrom,
        dateTo: dateTo,
      );

      if (page == 1) {
        _articles.clear();
      }
      _articles.addAll(response.data);
      _currentPage = (page ?? _currentPage) + 1;

      final updatedResponse = GlobalArticleResponse(
        detail: response.detail,
        totalItems: response.totalItems,
        totalPages: response.totalPages,
        page: response.page,
        pageSize: response.pageSize,
        data: List.from(_articles),
      );

      state = AsyncValue.data(updatedResponse);
    } catch (e, st) {
      print('Error: $e');
      state = AsyncValue.error(e, st);
    }
  }

  // 새로고침
  Future<void> refreshGlobalArticles() async {
    _currentPage = 1;
    await getGlobalArticle(page: 1);
  }

  // 검색
  Future<void> searchGlobalArticles({
    String? keyword,
    String? companyName,
    String? symbols,
  }) async {
    _currentPage = 1;
    await getGlobalArticle(
      page: 1,
      keyword: keyword,
      companyName: companyName,
      symbols: symbols,
    );
  }

  // 다음 페이지 로드
  Future<void> loadNextPage() async {
    final currentState = state;
    if (currentState is AsyncData<GlobalArticleResponse>) {
      if (_currentPage <= currentState.value.totalPages) {
        await getGlobalArticle(page: _currentPage);
      }
    }
  }
}
