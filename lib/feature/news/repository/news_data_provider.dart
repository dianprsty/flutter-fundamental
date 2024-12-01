import 'package:flutter_fundamental/core/data/entity/news_model.dart';
import 'package:flutter_fundamental/core/data/local/objectbox/objectbox.dart';

class NewsDataProvider {
  final ObjectBox objectbox;

  NewsDataProvider({required this.objectbox});
  List<NewsModel> getNews() {
    return objectbox.store.box<NewsModel>().getAll();
  }

  void addNews(NewsModel news) {
    objectbox.store.box<NewsModel>().put(news);
  }

  void deleteNews(int id) {
    objectbox.store.box<NewsModel>().remove(id);
  }
}
