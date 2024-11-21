import 'package:deep_search_news/models/global_article_model.dart';
import 'package:deep_search_news/utils/format_date.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class GlobalArticleItemWidget extends StatelessWidget {
  final GlobalArticle globalArticle;
  final VoidCallback onTap;

  const GlobalArticleItemWidget({
    super.key,
    required this.globalArticle,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width - 32,
      height: 122,
      padding: const EdgeInsets.all(16),
      margin: const EdgeInsets.only(
        left: 16,
        right: 16,
        bottom: 16,
      ),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.surface,
        borderRadius: BorderRadius.circular(12),
      ),
      child: GestureDetector(
        onTap: onTap,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            globalArticle.imageUrl != null
                ? ClipRRect(
                    borderRadius: const BorderRadius.all(Radius.circular(8)),
                    child: Image.network(
                      globalArticle.imageUrl!,
                      width: 120,
                      height: 90,
                      fit: BoxFit.cover,
                      errorBuilder: (context, error, stackTrace) {
                        return const SizedBox(
                          width: 120,
                          height: 90,
                        );
                      },
                    ),
                  )
                : const SizedBox(
                    width: 120,
                    height: 90,
                  ),
            const Gap(16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    globalArticle.titleKo.isNotEmpty
                        ? globalArticle.titleKo
                        : globalArticle.title,
                    style: const TextStyle(
                      height: 1.2,
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                    ),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                  ),
                  const Spacer(),
                  Text(
                    formatDate(globalArticle.publisher),
                    style: TextStyle(
                      color: Colors.grey[800],
                      fontSize: 12,
                      height: 1.2,
                    ),
                  ),
                  const Gap(4),
                  Text(
                    formatDate(globalArticle.publishedAt),
                    style: TextStyle(
                      color: DateTime.now()
                                  .difference(
                                      DateTime.parse(globalArticle.publishedAt))
                                  .inHours <
                              1
                          ? Theme.of(context).colorScheme.primary
                          : Colors.grey[800],
                      fontSize: 12,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
