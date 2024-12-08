import 'dart:developer';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_fundamental/core/data/entity/news_api_model.dart';
import 'package:flutter_fundamental/core/data/remote/remote_data_source.dart';

part 'news_api_event.dart';
part 'news_api_state.dart';

class NewsApiBloc extends Bloc<NewsApiEvent, NewsApiState> {
  final RemoteDataSource remoteDataSource;
  NewsApiBloc({required this.remoteDataSource}) : super(NewsApiLoading()) {
    on<NewsApiEvent>((event, emit) async {
      emit(NewsApiLoading());
      try {
        final result = await remoteDataSource.getNews();
        emit(NewsApiLoaded(result ?? []));
      } catch (e) {
        log(e.toString());
        emit(NewsApiError(e.toString()));
      }
    });
  }
}
