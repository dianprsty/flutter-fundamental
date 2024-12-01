import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_fundamental/core/data/entity/news_model.dart';

class NewsCard extends StatefulWidget {
  final void Function()? onLongPress;
  final NewsModel news;
  const NewsCard({
    super.key,
    required this.news,
    this.onLongPress,
  });

  @override
  State<NewsCard> createState() => _NewsCardState();
}

class _NewsCardState extends State<NewsCard> {
  bool isOpen = false;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onLongPress: widget.onLongPress,
      onTap: () => setState(() => isOpen = !isOpen),
      child: Container(
        margin: const EdgeInsets.only(bottom: 16),
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: Colors.black.withOpacity(.05),
          borderRadius: BorderRadius.circular(12),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
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
                          widget.news.category ?? 'General',
                          style:
                              const TextStyle(color: Colors.blue, fontSize: 10),
                        ),
                        shape: RoundedRectangleBorder(
                            side: const BorderSide(
                              color: Colors.blue,
                            ),
                            borderRadius: BorderRadius.circular(32)),
                      ),
                      Text(
                        widget.news.title ?? '',
                        style: const TextStyle(
                            fontSize: 16, fontWeight: FontWeight.bold),
                      ),
                      Text(
                        (widget.news.date ?? '').toString(),
                        style:
                            const TextStyle(fontSize: 14, color: Colors.grey),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  width: 150,
                  child: widget.news.imageUrl != null
                      ? Image.file(
                          File(widget.news.imageUrl!),
                        )
                      : Image.asset(
                          "assets/images/computer.jpeg",
                        ),
                )
              ],
            ),
            SizedBox(height: 16),
            AnimatedContainer(
                duration: Duration(milliseconds: 300),
                height: isOpen ? 60 : 0,
                child: Text(widget.news.content ?? '',
                    maxLines: 3,
                    style: const TextStyle(
                      overflow: TextOverflow.ellipsis,
                    )))
          ],
        ),
      ),
    );
  }
}