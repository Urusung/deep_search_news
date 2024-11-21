// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'global_article_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

GlobalArticleResponse _$GlobalArticleResponseFromJson(
        Map<String, dynamic> json) =>
    GlobalArticleResponse(
      detail: Detail.fromJson(json['detail'] as Map<String, dynamic>),
      totalItems: (json['total_items'] as num?)?.toInt() ?? 0,
      totalPages: (json['total_pages'] as num?)?.toInt() ?? 0,
      page: (json['page'] as num?)?.toInt() ?? 0,
      pageSize: (json['page_size'] as num?)?.toInt() ?? 0,
      data: (json['data'] as List<dynamic>?)
              ?.map((e) => GlobalArticle.fromJson(e as Map<String, dynamic>))
              .toList() ??
          [],
    );

Map<String, dynamic> _$GlobalArticleResponseToJson(
        GlobalArticleResponse instance) =>
    <String, dynamic>{
      'detail': instance.detail,
      'total_items': instance.totalItems,
      'total_pages': instance.totalPages,
      'page': instance.page,
      'page_size': instance.pageSize,
      'data': instance.data,
    };

Detail _$DetailFromJson(Map<String, dynamic> json) => Detail(
      message: json['message'] as String? ?? '',
      code: json['code'] as String? ?? '',
      ok: json['ok'] as bool? ?? false,
    );

Map<String, dynamic> _$DetailToJson(Detail instance) => <String, dynamic>{
      'message': instance.message,
      'code': instance.code,
      'ok': instance.ok,
    };

GlobalArticle _$GlobalArticleFromJson(Map<String, dynamic> json) =>
    GlobalArticle(
      id: (json['id'] as num?)?.toInt() ?? 0,
      sections: (json['sections'] as List<dynamic>?)
              ?.map((e) => e as String)
              .toList() ??
          [],
      title: json['title'] as String? ?? '',
      titleKo: json['title_ko'] as String? ?? '',
      summary: json['summary'] as String? ?? '',
      summaryKo: json['summary_ko'] as String? ?? '',
      imageUrl: json['image_url'] as String?,
      contentUrl: json['content_url'] as String?,
      thumbnailUrl: json['thumbnail_url'] as String?,
      publisher: json['publisher'] as String? ?? '',
      reason: json['reason'] as String? ?? '',
      importance: json['importance'] as String? ?? '',
      esg: (json['esg'] as List<dynamic>?)
              ?.map((e) => ESG.fromJson(e as Map<String, dynamic>))
              .toList() ??
          [],
      companies: (json['companies'] as List<dynamic>?)
              ?.map((e) => Companies.fromJson(e as Map<String, dynamic>))
              .toList() ??
          [],
      publishedAt: json['published_at'] as String? ?? '',
    );

Map<String, dynamic> _$GlobalArticleToJson(GlobalArticle instance) =>
    <String, dynamic>{
      'id': instance.id,
      'sections': instance.sections,
      'title': instance.title,
      'title_ko': instance.titleKo,
      'summary': instance.summary,
      'summary_ko': instance.summaryKo,
      'image_url': instance.imageUrl,
      'content_url': instance.contentUrl,
      'thumbnail_url': instance.thumbnailUrl,
      'publisher': instance.publisher,
      'reason': instance.reason,
      'importance': instance.importance,
      'esg': instance.esg,
      'companies': instance.companies,
      'published_at': instance.publishedAt,
    };

ESG _$ESGFromJson(Map<String, dynamic> json) => ESG(
      category: json['category'] as String? ?? '',
      score: (json['score'] as num?)?.toDouble() ?? 0,
      confidenceScore: (json['confidence_score'] as num?)?.toDouble() ?? 0,
      reason: json['reason'] as String? ?? '',
    );

Map<String, dynamic> _$ESGToJson(ESG instance) => <String, dynamic>{
      'category': instance.category,
      'score': instance.score,
      'confidence_score': instance.confidenceScore,
      'reason': instance.reason,
    };

Companies _$CompaniesFromJson(Map<String, dynamic> json) => Companies(
      name: json['name'] as String? ?? '',
      exchange: json['exchange'] as String? ?? '',
      symbol: json['symbol'] as String? ?? '',
      importance: json['importance'] as String? ?? '',
      sentiment: json['sentiment'] as String? ?? '',
      reason: json['reason'] as String? ?? '',
      nameKo: json['name_ko'] as String? ?? '',
      stockInfo: json['stock_info'] == null
          ? null
          : StockInfo.fromJson(json['stock_info'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$CompaniesToJson(Companies instance) => <String, dynamic>{
      'name': instance.name,
      'name_ko': instance.nameKo,
      'symbol': instance.symbol,
      'exchange': instance.exchange,
      'importance': instance.importance,
      'sentiment': instance.sentiment,
      'reason': instance.reason,
      'stock_info': instance.stockInfo,
    };

StockInfo _$StockInfoFromJson(Map<String, dynamic> json) => StockInfo(
      date: json['date'] as String? ?? '',
      open: (json['open'] as num?)?.toDouble() ?? 0,
      high: (json['high'] as num?)?.toDouble() ?? 0,
      low: (json['low'] as num?)?.toDouble() ?? 0,
      close: (json['close'] as num?)?.toDouble() ?? 0,
      volume: (json['volume'] as num?)?.toDouble() ?? 0,
      change: (json['change'] as num?)?.toDouble() ?? 0,
      changePercent: (json['change_percent'] as num?)?.toDouble() ?? 0,
    );

Map<String, dynamic> _$StockInfoToJson(StockInfo instance) => <String, dynamic>{
      'date': instance.date,
      'open': instance.open,
      'high': instance.high,
      'low': instance.low,
      'close': instance.close,
      'volume': instance.volume,
      'change': instance.change,
      'change_percent': instance.changePercent,
    };
