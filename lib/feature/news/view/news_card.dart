import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_fundamental/core/data/entity/news_model.dart';

class NewsCard extends StatelessWidget {
  final void Function()? onLongPress;
  final NewsModel news;
  const NewsCard({
    super.key,
    required this.news,
    this.onLongPress,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onLongPress: onLongPress,
      child: Container(
        margin: const EdgeInsets.only(bottom: 16),
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: Colors.black.withOpacity(.05),
          borderRadius: BorderRadius.circular(12),
        ),
        child: Row(
          children: [
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Chip(
                    labelPadding: const EdgeInsets.all(0),
                    visualDensity: VisualDensity.compact,
                    label: Text(
                      news.category ?? 'General',
                      style: const TextStyle(color: Colors.blue, fontSize: 10),
                    ),
                    shape: RoundedRectangleBorder(
                        side: const BorderSide(
                          color: Colors.blue,
                        ),
                        borderRadius: BorderRadius.circular(32)),
                  ),
                  Text(
                    news.title ?? '',
                    style: const TextStyle(
                        fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    (news.date ?? '').toString(),
                    style: const TextStyle(fontSize: 14, color: Colors.grey),
                  ),
                ],
              ),
            ),
            SizedBox(
              width: 150,
              child: news.imageUrl != null
                  ? Image.file(
                      File(news.imageUrl!),
                    )
                  : Image.asset(
                      "assets/images/computer.jpeg",
                    ),
            )
          ],
        ),
      ),
    );
  }
}
