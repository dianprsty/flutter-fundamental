part of 'news_bloc.dart';

sealed class NewsEvent extends Equatable {
  const NewsEvent();

  @override
  List<Object> get props => [];
}

class GetNews extends NewsEvent {}

class AddNews extends NewsEvent {
  final NewsModel news;
  const AddNews(this.news);
}

class UpdateNews extends NewsEvent {
  final NewsModel news;
  const UpdateNews(this.news);
}

class DeleteNews extends NewsEvent {
  final int id;
  const DeleteNews(this.id);
}
