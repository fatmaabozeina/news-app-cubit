import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'dart:async' as http;

class DioHelper {
  static Dio dio;
  static init() {
    dio = Dio(BaseOptions(
        baseUrl: 'https://newsapi.org/', receiveDataWhenStatusError: true));
  }

  Future<ArticlesRootModel> getData(
      {@required String url, @required Map<String, dynamic> query}) async {
    var json = await dio.get(url, queryParameters: query);
    return ArticlesRootModel.fromJson(json.data);
  }
}

class ArticlesRootModel {
  ArticlesRootModel({
    this.status,
    this.totalResults,
    this.articles,
  });

  String status;
  int totalResults;
  List<Article> articles;

  factory ArticlesRootModel.fromJson(Map<String, dynamic> json) =>
      ArticlesRootModel(
        status: json["status"] == null ? null : json["status"],
        totalResults:
            json["totalResults"] == null ? null : json["totalResults"],
        articles: json["articles"] == null
            ? null
            : List<Article>.from(
                json["articles"].map((x) => Article.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "status": status == null ? null : status,
        "totalResults": totalResults == null ? null : totalResults,
        "articles": articles == null
            ? null
            : List<dynamic>.from(articles.map((x) => x.toJson())),
      };
}

class Article {
  Article({
    this.source,
    this.author,
    this.title,
    this.description,
    this.url,
    this.urlToImage,
    this.publishedAt,
    this.content,
  });

  Source source;
  String author;
  String title;
  String description;
  String url;
  String urlToImage;
  DateTime publishedAt;
  String content;

  factory Article.fromJson(Map<String, dynamic> json) => Article(
        source: json["source"] == null ? null : Source.fromJson(json["source"]),
        author: json["author"] == null ? null : json["author"],
        title: json["title"] == null ? null : json["title"],
        description: json["description"] == null ? null : json["description"],
        url: json["url"] == null ? null : json["url"],
        urlToImage: json["urlToImage"] == null
            ? "https://images.unsplash.com/photo-1503023345310-bd7c1de61c7d?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8M3x8aHVtYW58ZW58MHx8MHx8&w=1000&q=80"
            : json["urlToImage"],
        publishedAt: json["publishedAt"] == null
            ? null
            : DateTime.parse(json["publishedAt"]),
        content: json["content"] == null ? null : json["content"],
      );

  Map<String, dynamic> toJson() => {
        "source": source == null ? null : source.toJson(),
        "author": author == null ? null : author,
        "title": title == null ? null : title,
        "description": description == null ? null : description,
        "url": url == null ? null : url,
        "urlToImage": urlToImage == null ? null : urlToImage,
        "publishedAt":
            publishedAt == null ? null : publishedAt.toIso8601String(),
        "content": content == null ? null : content,
      };
}

class Source {
  Source({
    this.id,
    this.name,
  });

  String id;
  String name;

  factory Source.fromJson(Map<String, dynamic> json) => Source(
        id: json["id"] == null ? null : json["id"],
        name: json["name"] == null ? null : json["name"],
      );

  Map<String, dynamic> toJson() => {
        "id": id == null ? null : id,
        "name": name == null ? null : name,
      };
}
