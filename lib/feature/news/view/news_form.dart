import 'dart:developer';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_fundamental/core/data/entity/news_model.dart';
import 'package:flutter_fundamental/core/widget/custom_outlined_button.dart';
import 'package:flutter_fundamental/core/widget/custom_text_field.dart';
import 'package:flutter_fundamental/core/widget/primary_button.dart';
import 'package:flutter_fundamental/feature/news/bloc/news_bloc.dart';
import 'package:image_picker/image_picker.dart';

class NewsForm extends StatefulWidget {
  final NewsModel? news;
  const NewsForm({super.key, this.news});

  @override
  State<NewsForm> createState() => _NewsFormState();
}

class _NewsFormState extends State<NewsForm> {
  final _titleController = TextEditingController();
  final _contentController = TextEditingController();
  final _categoryController = TextEditingController();
  DateTime? _selectedDate;
  XFile? _image;

  @override
  void initState() {
    super.initState();
    if (widget.news != null) {
      _titleController.text = widget.news!.title ?? '';
      _contentController.text = widget.news!.content ?? '';
      _categoryController.text = widget.news!.category ?? '';
      _selectedDate = widget.news!.date;
      _image =
          widget.news!.imageUrl != null ? XFile(widget.news!.imageUrl!) : null;
    }
  }

  @override
  void dispose() {
    _titleController.dispose();
    _contentController.dispose();
    _categoryController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('News Form'),
        ),
        body: ListView(padding: const EdgeInsets.all(16), children: [
          CustomTextField(
            label: 'Title',
            controller: _titleController,
          ),
          const SizedBox(height: 16),
          CustomTextField(
            label: 'Content',
            controller: _contentController,
            minLines: 5,
          ),
          const SizedBox(height: 16),
          CustomTextField(
            label: 'Category',
            controller: _categoryController,
          ),
          const SizedBox(height: 16),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                flex: 12,
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(color: Colors.black54),
                  ),
                  child: _selectedDate == null
                      ? const Text('No Date Selected')
                      : Text(_selectedDate!.toIso8601String()),
                ),
              ),
              Spacer(flex: 1),
              CustomOutlinedButton(
                onPressed: () async {
                  final date = await showDatePicker(
                    context: context,
                    initialDate: DateTime.now(),
                    firstDate: DateTime(2000),
                    lastDate: DateTime.now(),
                  );
                  if (date != null) {
                    setState(() {
                      _selectedDate = date;
                    });
                  }
                },
                child: Text('Select Date'),
              ),
            ],
          ),
          const SizedBox(height: 16),
          Container(
            height: 180,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16),
              color: Colors.grey.shade200,
              border: Border.all(color: Colors.black87, width: 1),
              image: _image == null
                  ? null
                  : DecorationImage(
                      image: FileImage(File(_image!.path)),
                      fit: BoxFit.cover,
                    ),
            ),
            child: _image == null
                ? const Center(child: Text('No Image Selected'))
                : const SizedBox.shrink(),
          ),
          const SizedBox(height: 8),
          OutlinedButton(
            onPressed: () async {
              final image = await ImagePicker()
                  .pickImage(source: ImageSource.gallery, imageQuality: 50);
              if (image != null) {
                setState(() {
                  _image = image;
                });
              }
            },
            child: const Text('Select Image'),
          ),
          const SizedBox(height: 16),
          PrimaryButton(
            onPressed: () {
              log('Pressed ${_titleController.text}');
              log('Pressed ${_contentController.text}');
              log('Pressed ${_categoryController.text}');
              log('image: ${_image?.path}');
              NewsModel news = NewsModel(
                id: widget.news?.id ?? 0,
                title: _titleController.text,
                content: _contentController.text,
                category: _categoryController.text,
                date: _selectedDate,
                imageUrl: _image?.path,
              );

              if (widget.news != null) {
                context.read<NewsBloc>().add(UpdateNews(news));
              } else {
                context.read<NewsBloc>().add(AddNews(news));
              }

              setState(() {
                _titleController.clear();
                _contentController.clear();
                _categoryController.clear();
                _selectedDate = null;
                _image = null;
              });

              Navigator.pop(context);
            },
            child: const Text(
              'Save',
              style: TextStyle(color: Colors.white),
            ),
          ),
        ]));
  }
}
