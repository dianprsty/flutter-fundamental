import 'package:objectbox/objectbox.dart';

@Entity()
class NewsModel {
  @Id()
  int id = 0;
  String? title;
  String? content;
  String? category;
  DateTime? date;
  String? imageUrl;

  NewsModel({
    this.id = 0,
    this.title = '',
    this.content = '',
    this.category = '',
    this.date,
    this.imageUrl,
  });
}
