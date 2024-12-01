import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_fundamental/core/data/entity/news_model.dart';
import 'package:flutter_fundamental/core/data/local/objectbox/objectbox.dart';

part 'news_event.dart';
part 'news_state.dart';

class NewsBloc extends Bloc<NewsEvent, NewsState> {
  final ObjectBox objectbox;
  NewsBloc(this.objectbox) : super(NewsLoading()) {
    on<GetNews>(_onGetNews);
    on<AddNews>(_onAddNews);
    on<UpdateNews>(_onUpdateNews);
    on<DeleteNews>(_onDeleteNews);
  }

  void _onGetNews(GetNews event, Emitter<NewsState> emit) async {
    emit(NewsLoading());
    await Future.delayed(const Duration(seconds: 2));
    final news = objectbox.store.box<NewsModel>().getAll();

    emit(NewsSuccess(news));
  }

  void _onAddNews(AddNews event, Emitter<NewsState> emit) async {
    emit(NewsLoading());
    await Future.delayed(const Duration(seconds: 2));
    objectbox.store.box<NewsModel>().put(event.newsModel);
    emit(NewsSuccess(objectbox.store.box<NewsModel>().getAll()));
  }

  void _onUpdateNews(UpdateNews event, Emitter<NewsState> emit) async {
    emit(NewsLoading());
    await Future.delayed(const Duration(seconds: 2));
    objectbox.store.box<NewsModel>().put(event.newsModel);
    emit(NewsSuccess(objectbox.store.box<NewsModel>().getAll()));
  }

  void _onDeleteNews(DeleteNews event, Emitter<NewsState> emit) async {
    emit(NewsLoading());
    await Future.delayed(const Duration(seconds: 2));
    objectbox.store.box<NewsModel>().remove(event.id);
    emit(NewsSuccess(objectbox.store.box<NewsModel>().getAll()));
  }
}
