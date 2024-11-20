import 'package:deep_search_news/viewmodels/global_article_viewmodel.dart';
import 'package:deep_search_news/views/detail_view/detail_view.dart';
import 'package:deep_search_news/views/home_view/widgets/article_card_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class HomeView extends ConsumerStatefulWidget {
  const HomeView({super.key});

  @override
  ConsumerState<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends ConsumerState<HomeView> {
  final _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_onScroll);
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  void _onScroll() {}

  @override
  Widget build(BuildContext context) {
    final articlesState = ref.watch(globalArticleProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('뉴스'),
      ),
      body: RefreshIndicator(
        onRefresh: () =>
            ref.read(globalArticleProvider.notifier).refreshArticles(),
        child: articlesState.when(
            data: (response) {
              if (response.data.isEmpty) {
                return const Center(
                  child: Text('검색 결과가 없습니다.'),
                );
              }
              return ListView.builder(
                controller: _scrollController,
                itemCount: response.data.length + 1,
                itemBuilder: (context, index) {
                  final article = response.data[index];
                  return ArticleCard(
                    article: article,
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => DetailView(article: article),
                        ),
                      );
                    },
                  );
                },
              );
            },
            loading: () => const Center(
                  child: CircularProgressIndicator(),
                ),
            error: (error, stack) {
              print(error);
              return Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text('에러가 발생했습니다: $error'),
                  ],
                ),
              );
            }),
      ),
    );
  }
}
