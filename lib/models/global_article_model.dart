import 'package:json_annotation/json_annotation.dart';

part 'global_article_model.g.dart';

@JsonSerializable()
class GlobalArticleResponse {
  final Detail detail;

  @JsonKey(name: 'total_items', defaultValue: 0)
  final int totalItems;

  @JsonKey(name: 'total_pages', defaultValue: 0)
  final int totalPages;

  @JsonKey(defaultValue: 0)
  final int page;

  @JsonKey(name: 'page_size', defaultValue: 0)
  final int pageSize;

  @JsonKey(defaultValue: [])
  final List<GlobalArticle> data;

  GlobalArticleResponse({
    required this.detail,
    required this.totalItems,
    required this.totalPages,
    required this.page,
    required this.pageSize,
    required this.data,
  });

  factory GlobalArticleResponse.fromJson(Map<String, dynamic> json) =>
      _$GlobalArticleResponseFromJson(json);
  Map<String, dynamic> toJson() => _$GlobalArticleResponseToJson(this);
}

@JsonSerializable()
class Detail {
  @JsonKey(defaultValue: '')
  final String message;

  @JsonKey(defaultValue: '')
  final String code;

  @JsonKey(defaultValue: false)
  final bool ok;

  Detail({
    required this.message,
    required this.code,
    required this.ok,
  });

  factory Detail.fromJson(Map<String, dynamic> json) => _$DetailFromJson(json);
  Map<String, dynamic> toJson() => _$DetailToJson(this);
}

@JsonSerializable()
class GlobalArticle {
  @JsonKey(defaultValue: 0)
  final int id;

  @JsonKey(defaultValue: [])
  final List<String> sections;

  @JsonKey(defaultValue: '')
  final String title;

  @JsonKey(name: 'title_ko', defaultValue: '')
  final String titleKo;

  @JsonKey(defaultValue: '')
  final String summary;

  @JsonKey(name: 'summary_ko', defaultValue: '')
  final String summaryKo;

  @JsonKey(name: 'image_url')
  final String? imageUrl;

  @JsonKey(name: 'content_url')
  final String? contentUrl;

  @JsonKey(name: 'thumbnail_url')
  final String? thumbnailUrl;

  @JsonKey(defaultValue: '')
  final String publisher;

  @JsonKey(defaultValue: '')
  final String reason;

  @JsonKey(defaultValue: '')
  final String importance;

  @JsonKey(defaultValue: [])
  final List<ESG> esg;

  @JsonKey(defaultValue: [])
  final List<Companies> companies;

  @JsonKey(name: 'published_at', defaultValue: '')
  final String publishedAt;

  GlobalArticle({
    required this.id,
    required this.sections,
    required this.title,
    required this.titleKo,
    required this.summary,
    required this.summaryKo,
    this.imageUrl,
    this.contentUrl,
    this.thumbnailUrl,
    required this.publisher,
    required this.reason,
    required this.importance,
    required this.esg,
    required this.companies,
    required this.publishedAt,
  });

  factory GlobalArticle.fromJson(Map<String, dynamic> json) =>
      _$GlobalArticleFromJson(json);
  Map<String, dynamic> toJson() => _$GlobalArticleToJson(this);
}

@JsonSerializable()
class ESG {
  @JsonKey(defaultValue: '')
  final String category;

  @JsonKey(defaultValue: 0)
  final double score;

  @JsonKey(name: 'confidence_score', defaultValue: 0)
  final double confidenceScore;

  @JsonKey(defaultValue: '')
  final String reason;

  ESG({
    required this.category,
    required this.score,
    required this.confidenceScore,
    required this.reason,
  });

  factory ESG.fromJson(Map<String, dynamic> json) => _$ESGFromJson(json);
  Map<String, dynamic> toJson() => _$ESGToJson(this);
}

@JsonSerializable()
class Companies {
  @JsonKey(defaultValue: '')
  final String name;

  @JsonKey(name: 'name_ko', defaultValue: '')
  final String nameKo;

  @JsonKey(defaultValue: '')
  final String symbol;

  @JsonKey(defaultValue: '')
  final String exchange;

  @JsonKey(defaultValue: '')
  final String importance;

  @JsonKey(defaultValue: '')
  final String sentiment;

  @JsonKey(defaultValue: '')
  final String reason;

  @JsonKey(name: 'stock_info')
  final StockInfo? stockInfo;

  Companies({
    required this.name,
    required this.exchange,
    required this.symbol,
    required this.importance,
    required this.sentiment,
    required this.reason,
    required this.nameKo,
    this.stockInfo,
  });

  factory Companies.fromJson(Map<String, dynamic> json) =>
      _$CompaniesFromJson(json);
  Map<String, dynamic> toJson() => _$CompaniesToJson(this);
}

@JsonSerializable()
class StockInfo {
  @JsonKey(defaultValue: '')
  final String date;

  @JsonKey(defaultValue: 0)
  final double open;

  @JsonKey(defaultValue: 0)
  final double high;

  @JsonKey(defaultValue: 0)
  final double low;

  @JsonKey(defaultValue: 0)
  final double close;

  @JsonKey(defaultValue: 0)
  final double volume;

  @JsonKey(defaultValue: 0)
  final double change;

  @JsonKey(name: 'change_percent', defaultValue: 0)
  final double changePercent;

  StockInfo({
    required this.date,
    required this.open,
    required this.high,
    required this.low,
    required this.close,
    required this.volume,
    required this.change,
    required this.changePercent,
  });

  factory StockInfo.fromJson(Map<String, dynamic> json) =>
      _$StockInfoFromJson(json);
  Map<String, dynamic> toJson() => _$StockInfoToJson(this);
}
