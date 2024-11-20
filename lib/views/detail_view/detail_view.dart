import 'package:deep_search_news/models/global_article_model.dart';
import 'package:flutter/material.dart';

class DetailView extends StatelessWidget {
  final GlobalArticle article;

  const DetailView({
    super.key,
    required this.article,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('뉴스 상세'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // 제목 (한글)
              Text(
                article.title,
                style: const TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 8),

              // 원문 제목
              Text(
                article.title,
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.grey[600],
                  fontStyle: FontStyle.italic,
                ),
              ),
              const SizedBox(height: 16),

              // 섹션 태그들
              Wrap(
                spacing: 8,
                runSpacing: 8,
                children: article.sections
                    .map(
                      (section) => Chip(
                        label: Text(
                          section.toUpperCase(),
                          style: const TextStyle(fontSize: 12),
                        ),
                        backgroundColor:
                            Theme.of(context).colorScheme.primaryContainer,
                      ),
                    )
                    .toList(),
              ),
              const SizedBox(height: 24),

              // 본문 내용
              Text(
                article.summary,
                style: const TextStyle(
                  fontSize: 16,
                  height: 1.6,
                ),
              ),
              const SizedBox(height: 32),

              // 메타 정보
              Card(
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        '문서 정보',
                        style: Theme.of(context).textTheme.titleMedium,
                      ),
                      const SizedBox(height: 8),
                      Text('문서 ID: ${article.id}'),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pop(context);
        },
        child: const Icon(Icons.arrow_back),
      ),
    );
  }
}
