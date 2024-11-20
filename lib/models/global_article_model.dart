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

  @JsonKey(defaultValue: '')
  final String publisher;

  @JsonKey(defaultValue: '')
  final String author;

  @JsonKey(defaultValue: '')
  final String summary;

  @JsonKey(name: 'image_url')
  final String? imageUrl;

  @JsonKey(name: 'thumbnail_url')
  final String? thumbnailUrl;

  @JsonKey(name: 'content_url')
  final String? contentUrl;

  @JsonKey(defaultValue: null)
  final List<dynamic>? esg;

  @JsonKey(defaultValue: [])
  final List<Company> companies;

  @JsonKey(defaultValue: [])
  final List<Entity> entities;

  @JsonKey(name: 'published_at', defaultValue: '')
  final String publishedAt;

  GlobalArticle({
    required this.id,
    required this.sections,
    required this.title,
    required this.publisher,
    required this.author,
    required this.summary,
    this.imageUrl,
    this.thumbnailUrl,
    this.contentUrl,
    this.esg,
    required this.companies,
    required this.entities,
    required this.publishedAt,
  });

  factory GlobalArticle.fromJson(Map<String, dynamic> json) =>
      _$GlobalArticleFromJson(json);
  Map<String, dynamic> toJson() => _$GlobalArticleToJson(this);
}

@JsonSerializable()
class Company {
  @JsonKey(defaultValue: '')
  final String name;

  @JsonKey(defaultValue: '')
  final String symbol;

  @JsonKey(defaultValue: '')
  final String exchange;

  @JsonKey(defaultValue: '')
  final String sentiment;

  Company({
    required this.name,
    required this.symbol,
    required this.exchange,
    required this.sentiment,
  });

  factory Company.fromJson(Map<String, dynamic> json) =>
      _$CompanyFromJson(json);
  Map<String, dynamic> toJson() => _$CompanyToJson(this);
}

@JsonSerializable()
class Entity {
  @JsonKey(defaultValue: '')
  final String type;

  @JsonKey(defaultValue: '')
  final String name;

  Entity({
    required this.type,
    required this.name,
  });

  factory Entity.fromJson(Map<String, dynamic> json) => _$EntityFromJson(json);
  Map<String, dynamic> toJson() => _$EntityToJson(this);
}
