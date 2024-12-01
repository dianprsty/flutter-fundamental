import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_fundamental/core/data/entity/news_model.dart';
import 'package:flutter_fundamental/feature/news/bloc/news_bloc.dart';
import 'package:flutter_fundamental/feature/news/view/news_card.dart';
import 'package:flutter_fundamental/feature/news/view/news_form.dart';

class NewsPage extends StatefulWidget {
  const NewsPage({super.key});

  @override
  State<NewsPage> createState() => _NewsPageState();
}

class _NewsPageState extends State<NewsPage> {
  void _refresh() {
    setState(() {});
  }

  void _onLongPress(BuildContext context, NewsModel news) async {
    await showDialog(
      context: context,
      builder: (context) => SimpleDialog(
        children: [
          SimpleDialogOption(
            child: const Text('Edit'),
            onPressed: () {
              Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                      builder: (context) => NewsForm(
                            news: news,
                          ))).then(
                (value) => _refresh(),
              );
            },
          ),
          SimpleDialogOption(
            child: const Text('Delete'),
            onPressed: () {
              context.read<NewsBloc>().add(DeleteNews(news.id));
              Navigator.pop(context);
              setState(() {});
            },
          ),
          SimpleDialogOption(
            child: const Text('Cancel'),
            onPressed: () => Navigator.pop(context),
          )
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh: () async {
        _refresh();
      },
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Saved News'),
          centerTitle: true,
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const NewsForm(),
                )).then(
              (value) {
                _refresh();
              },
            );
          },
          backgroundColor: Colors.blue,
          child: const Icon(
            Icons.add,
            color: Colors.white,
          ),
        ),
        body: BlocBuilder<NewsBloc, NewsState>(
          builder: (context, state) {
            return switch (state) {
              NewsLoading() => const Center(child: CircularProgressIndicator()),
              NewsLoaded() => state.news.isEmpty
                  ? const Center(child: Text('No Saved News'))
                  : Padding(
                      padding: const EdgeInsets.all(16),
                      child: ListView.builder(
                        itemBuilder: (BuildContext context, int index) {
                          final news = state.news[index];
                          return NewsCard(
                              news: news,
                              onLongPress: () => _onLongPress(context, news));
                        },
                        itemCount: state.news.length,
                      ),
                    ),
              NewsError() => const Center(child: Text("Something wrong")),
            };
          },
        ),
      ),
    );
  }
}
