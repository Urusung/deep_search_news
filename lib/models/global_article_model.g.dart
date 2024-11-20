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
      publisher: json['publisher'] as String? ?? '',
      author: json['author'] as String? ?? '',
      summary: json['summary'] as String? ?? '',
      imageUrl: json['image_url'] as String?,
      thumbnailUrl: json['thumbnail_url'] as String?,
      contentUrl: json['content_url'] as String?,
      esg: json['esg'] as List<dynamic>?,
      companies: (json['companies'] as List<dynamic>?)
              ?.map((e) => Company.fromJson(e as Map<String, dynamic>))
              .toList() ??
          [],
      entities: (json['entities'] as List<dynamic>?)
              ?.map((e) => Entity.fromJson(e as Map<String, dynamic>))
              .toList() ??
          [],
      publishedAt: json['published_at'] as String? ?? '',
    );

Map<String, dynamic> _$GlobalArticleToJson(GlobalArticle instance) =>
    <String, dynamic>{
      'id': instance.id,
      'sections': instance.sections,
      'title': instance.title,
      'publisher': instance.publisher,
      'author': instance.author,
      'summary': instance.summary,
      'image_url': instance.imageUrl,
      'thumbnail_url': instance.thumbnailUrl,
      'content_url': instance.contentUrl,
      'esg': instance.esg,
      'companies': instance.companies,
      'entities': instance.entities,
      'published_at': instance.publishedAt,
    };

Company _$CompanyFromJson(Map<String, dynamic> json) => Company(
      name: json['name'] as String? ?? '',
      symbol: json['symbol'] as String? ?? '',
      exchange: json['exchange'] as String? ?? '',
      sentiment: json['sentiment'] as String? ?? '',
    );

Map<String, dynamic> _$CompanyToJson(Company instance) => <String, dynamic>{
      'name': instance.name,
      'symbol': instance.symbol,
      'exchange': instance.exchange,
      'sentiment': instance.sentiment,
    };

Entity _$EntityFromJson(Map<String, dynamic> json) => Entity(
      type: json['type'] as String? ?? '',
      name: json['name'] as String? ?? '',
    );

Map<String, dynamic> _$EntityToJson(Entity instance) => <String, dynamic>{
      'type': instance.type,
      'name': instance.name,
    };
