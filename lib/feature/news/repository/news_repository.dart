import 'package:flutter_fundamental/core/data/entity/news_model.dart';
import 'package:flutter_fundamental/feature/news/repository/news_data_provider.dart';

class NewsRepository {
  final NewsDataProvider newsDataProvider;

  NewsRepository({required this.newsDataProvider});

  Future<List<NewsModel>> getNews() async {
    return newsDataProvider.getNews();
  }

  Future<void> addNews(NewsModel news) async {
    newsDataProvider.addNews(news);
  }

  Future<void> deleteNews(int id) async {
    newsDataProvider.deleteNews(id);
  }
}
