import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_fundamental/core/data/entity/news_model.dart';
import 'package:flutter_fundamental/core/data/local/objectbox/objectbox.dart';
import 'package:flutter_fundamental/feature/news/repository/news_repository.dart';

part 'news_event.dart';
part 'news_state.dart';

class NewsBloc extends Bloc<NewsEvent, NewsState> {
  final NewsRepository newsRepository;
  NewsBloc({required this.newsRepository}) : super(NewsLoading()) {
    on<AddNews>(_onAddNews);
    on<GetNews>(_onGetNews);
    on<DeleteNews>(_onDeleteNews);
  }

  FutureOr<void> _onAddNews(event, emit) async {
    emit(NewsLoading());
    await Future.delayed(const Duration(seconds: 1));
    newsRepository.addNews(event.news);
    final news = await newsRepository.getNews();
    emit(NewsLoaded(news));
  }

  FutureOr<void> _onDeleteNews(event, emit) async {
    emit(NewsLoading());
    await Future.delayed(const Duration(seconds: 1));
    newsRepository.deleteNews(event.id);
    final news = await newsRepository.getNews();
    emit(NewsLoaded(news));
  }

  FutureOr<void> _onGetNews(event, emit) async {
    emit(NewsLoading());

    await Future.delayed(const Duration(seconds: 1));
    final news = await newsRepository.getNews();
    emit(NewsLoaded(news));
  }
}
