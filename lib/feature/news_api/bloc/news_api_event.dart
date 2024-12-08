part of 'news_api_bloc.dart';

sealed class NewsApiEvent extends Equatable {
  const NewsApiEvent();

  @override
  List<Object> get props => [];
}

final class LoadNews extends NewsApiEvent {}
