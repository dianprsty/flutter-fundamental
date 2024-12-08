part of 'news_api_bloc.dart';

sealed class NewsApiState extends Equatable {
  const NewsApiState();

  @override
  List<Object> get props => [];
}

final class NewsApiLoading extends NewsApiState {}

final class NewsApiLoaded extends NewsApiState {
  final List<NewsApiModel> news;
  const NewsApiLoaded(this.news);
}

final class NewsApiError extends NewsApiState {
  final String message;
  const NewsApiError(this.message);
}
