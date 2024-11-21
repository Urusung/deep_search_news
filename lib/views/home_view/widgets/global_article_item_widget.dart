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
    return Padding(
      padding: const EdgeInsets.only(
        left: 16,
        right: 16,
      ),
      child: GestureDetector(
        onTap: onTap,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Gap(12),
            if (globalArticle.imageUrl != null)
              Padding(
                padding: const EdgeInsets.only(bottom: 12),
                child: ClipRRect(
                  borderRadius: const BorderRadius.all(Radius.circular(4)),
                  child: Image.network(
                    globalArticle.imageUrl!,
                    height: (MediaQuery.of(context).size.width - 32) * 0.5,
                    width: MediaQuery.of(context).size.width - 32,
                    fit: BoxFit.cover,
                    errorBuilder: (context, error, stackTrace) {
                      return const SizedBox(height: 100);
                    },
                  ),
                ),
              ),
            Row(
              children: [
                Text(
                  globalArticle.publisher,
                  style: TextStyle(color: Colors.grey[800], fontSize: 14),
                ),
                const Gap(8),
                globalArticle.importance == 'high'
                    ? const Icon(Icons.show_chart, color: Colors.red)
                    : const SizedBox(),
              ],
            ),
            const Gap(12),
            Text(
              globalArticle.title.isNotEmpty ? globalArticle.title : '',
              style: const TextStyle(
                height: 1.2,
                fontSize: 18,
                fontWeight: FontWeight.w600,
              ),
            ),
            globalArticle.imageUrl == null
                ? Padding(
                    padding: const EdgeInsets.only(top: 16.0),
                    child: Text(
                      globalArticle.summary.isNotEmpty
                          ? globalArticle.summary
                          : '',
                      maxLines: 3,
                      style: TextStyle(
                        color: Colors.grey[800],
                        fontSize: 14,
                        height: 1.5,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                  )
                : const SizedBox(),
            const Gap(12),
            Text(
              formatDate(globalArticle.publishedAt),
              style: TextStyle(color: Colors.grey[800], fontSize: 14),
            ),
            const Gap(12),
            if (globalArticle.sections.isNotEmpty) ...[
              Wrap(
                spacing: 8,
                children: globalArticle.sections.map(
                  (section) {
                    return Container(
                      padding: const EdgeInsets.only(
                        left: 12,
                        right: 12,
                        top: 4,
                        bottom: 4,
                      ),
                      decoration: BoxDecoration(
                        color: Colors.grey[100],
                        borderRadius: BorderRadius.circular(32),
                      ),
                      child: Text(section),
                    );
                  },
                ).toList(),
              ),
            ],
            // if (globalArticle.reason.isNotEmpty) ...[
            //   const Gap(12),
            //   Container(
            //     padding: const EdgeInsets.all(12),
            //     decoration: BoxDecoration(
            //       color: Colors.grey[100],
            //       borderRadius: BorderRadius.circular(8),
            //     ),
            //     child: Column(
            //       crossAxisAlignment: CrossAxisAlignment.start,
            //       children: [
            //         const Text(
            //           '주요 내용',
            //           style: TextStyle(
            //             fontWeight: FontWeight.w600,
            //             fontSize: 14,
            //           ),
            //         ),
            //         const Gap(4),
            //         Text(
            //           globalArticle.reason,
            //           style: const TextStyle(fontSize: 13),
            //         ),
            //       ],
            //     ),
            //   ),
            // ],

            // if (globalArticle.companies.isNotEmpty) ...[
            //   const Gap(12),
            //   const Text(
            //     '관련 기업',
            //     style: TextStyle(
            //       fontWeight: FontWeight.w600,
            //       fontSize: 14,
            //     ),
            //   ),
            //   const Gap(8),
            //   ...globalArticle.companies.map((company) => Padding(
            //         padding: const EdgeInsets.only(bottom: 8),
            //         child: Column(
            //           crossAxisAlignment: CrossAxisAlignment.start,
            //           children: [
            //             Row(
            //               children: [
            //                 _buildCompanyChip(company),
            //                 const Gap(8),
            //                 Text(
            //                   '${company.exchange} · ${company.importance}',
            //                   style: TextStyle(
            //                     fontSize: 12,
            //                     color: Colors.grey[600],
            //                   ),
            //                 ),
            //               ],
            //             ),
            //             if (company.reason.isNotEmpty) ...[
            //               const Gap(4),
            //               Text(
            //                 company.reason,
            //                 style: const TextStyle(fontSize: 13),
            //               ),
            //             ],
            //             if (company.stockInfo != null) ...[
            //               const Gap(8),
            //               _buildStockInfo(company.stockInfo!),
            //             ],
            //           ],
            //         ),
            //       )),
            // ],
            const Gap(12),
            Divider(color: Colors.grey[300]),
          ],
        ),
      ),
    );
  }

  Widget _buildStockInfo(StockInfo info) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.grey[100],
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Text(
                formatDate(info.date),
                style: const TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w600,
                ),
              ),
              const Spacer(),
              Text(
                '${info.changePercent >= 0 ? '+' : ''}${info.changePercent.toStringAsFixed(2)}%',
                style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w600,
                  color: info.changePercent > 0
                      ? Colors.red
                      : info.changePercent < 0
                          ? Colors.blue
                          : Colors.grey,
                ),
              ),
            ],
          ),
          const Gap(8),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              _buildStockField('시가', info.open),
              _buildStockField('고가', info.high),
              _buildStockField('저가', info.low),
              _buildStockField('종가', info.close),
            ],
          ),
          const Gap(4),
          _buildStockField('거래량', info.volume),
        ],
      ),
    );
  }

  Widget _buildStockField(String label, double value) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: TextStyle(
            fontSize: 11,
            color: Colors.grey[600],
          ),
        ),
        Text(
          value.toStringAsFixed(0),
          style: const TextStyle(fontSize: 12),
        ),
      ],
    );
  }

  Color _getSentimentColor(String sentiment) {
    switch (sentiment.toLowerCase()) {
      case 'positive':
        return Colors.green[100]!;
      case 'negative':
        return Colors.red[100]!;
      case 'neutral':
        return Colors.grey[100]!;
      default:
        return Colors.grey[100]!;
    }
  }

  Widget _buildESGChip(ESG esg) {
    return Chip(
      label: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            esg.category,
            style: const TextStyle(fontSize: 12),
          ),
          const Gap(4),
          Text(
            '${esg.score.toStringAsFixed(1)}점',
            style: const TextStyle(
              fontSize: 11,
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
      backgroundColor: _getESGColor(esg.score),
      padding: const EdgeInsets.symmetric(horizontal: 8),
    );
  }

  Widget _buildCompanyChip(Companies company) {
    return Chip(
      label: Text(
        company.nameKo.isNotEmpty ? company.nameKo : company.name,
        style: const TextStyle(fontSize: 12),
      ),
      backgroundColor: _getSentimentColor(company.sentiment),
      padding: const EdgeInsets.symmetric(horizontal: 8),
    );
  }

  Color _getESGColor(double score) {
    if (score >= 4.0) {
      return Colors.green[100]!;
    } else if (score >= 3.0) {
      return Colors.yellow[100]!;
    } else if (score >= 2.0) {
      return Colors.orange[100]!;
    } else if (score >= 1.0) {
      return Colors.red[100]!;
    } else {
      return Colors.grey[100]!;
    }
  }
}
