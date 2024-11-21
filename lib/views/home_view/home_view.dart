import 'package:deep_search_news/viewmodels/global_article_viewmodel.dart';
import 'package:deep_search_news/views/detail_view/detail_view.dart';
import 'package:deep_search_news/views/home_view/widgets/recent_article_item_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class HomeView extends ConsumerStatefulWidget {
  const HomeView({super.key});

  @override
  ConsumerState<HomeView> createState() => _HomeViewState();
}

class _HomeViewState extends ConsumerState<HomeView> {
  @override
  Widget build(BuildContext context) {
    final articlesState = ref.watch(globalArticleProvider);

    return Scaffold(
      appBar: AppBar(),
      backgroundColor: Colors.grey[100],
      body: RefreshIndicator(
        onRefresh: () =>
            ref.read(globalArticleProvider.notifier).refreshGlobalArticles(),
        child: articlesState.when(
          data: (response) {
            if (response.data.isEmpty) {
              return const Center(
                child: Text('검색 결과가 없습니다.'),
              );
            }

            return CustomScrollView(
              slivers: [
                const SliverToBoxAdapter(
                  child: Padding(
                    padding: EdgeInsets.all(16.0),
                    child: Text(
                      '최신뉴스',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'Pretendard',
                      ),
                    ),
                  ),
                ),
                // 뉴스 리스트
                SliverList(
                  delegate: SliverChildBuilderDelegate(
                    (context, index) {
                      final article = response.data[index];
                      return GlobalArticleItemWidget(
                        globalArticle: article,
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) =>
                                  DetailView(article: article),
                            ),
                          );
                        },
                      );
                    },
                    childCount: response.data.length,
                  ),
                ),
                // 더보기 버튼
                if (response.page < response.totalPages)
                  SliverToBoxAdapter(
                    child: Padding(
                      padding: const EdgeInsets.all(16.0),
                      child: ElevatedButton(
                        onPressed: () {
                          ref
                              .read(globalArticleProvider.notifier)
                              .loadNextPage();
                        },
                        child: const Text('더보기'),
                      ),
                    ),
                  ),
              ],
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
          },
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: 0,
        backgroundColor: Theme.of(context).colorScheme.surface,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.public),
            label: '해외',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: '국내',
          ),
        ],
      ),
    );
  }
}
