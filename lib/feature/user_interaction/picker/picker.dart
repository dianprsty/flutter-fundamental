import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_fundamental/feature/user_interaction/picker/color_picker_erxample.dart';
import 'package:flutter_fundamental/feature/user_interaction/picker/file_picker_example.dart';
import 'package:flutter_fundamental/feature/user_interaction/picker/image_picker.dart';

class Picker extends StatefulWidget {
  const Picker({super.key});

  @override
  State<Picker> createState() => _PickerState();
}

class _PickerState extends State<Picker> {
  DateTime? dateTime;
  DateTimeRange? dateRange;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Picker Widgets'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(24),
        child: ListView(
          children: [
            Text(dateTime.toString()),
            ElevatedButton(
              onPressed: () async {
                var value = await showDatePicker(
                  context: context,
                  firstDate: DateTime.fromMillisecondsSinceEpoch(0),
                  lastDate: DateTime.now(),
                  initialDate: DateTime.now(),
                );
                // await showDialog(
                //   context: context,
                //   builder: (context) {
                //     return DatePickerDialog(
                //       firstDate: DateTime.fromMillisecondsSinceEpoch(0),
                //       lastDate: DateTime.now(),
                //       initialDate: DateTime.now(),
                //     );
                //   },
                // );

                log(value.toString());
                setState(() {
                  dateTime = value;
                });
              },
              child: const Text('Date Picker'),
            ),
            // DatePickerDialog(
            //     firstDate: DateTime(2020), lastDate: DateTime(2025)),
            Text(dateRange.toString()),
            ElevatedButton(
              onPressed: () async {
                var value = await showDateRangePicker(
                  firstDate: DateTime.fromMillisecondsSinceEpoch(0),
                  lastDate: DateTime(2100),
                  initialDateRange:
                      DateTimeRange(start: DateTime.now(), end: DateTime.now()),
                  context: context,
                );

                log(value.toString());
                setState(() {
                  dateRange = value;
                });
              },
              child: const Text('Date Range Picker'),
            ),
            ElevatedButton(
              onPressed: () async {
                var value = await showDialog(
                  context: context,
                  builder: (context) {
                    return const TimePickerDialog(
                      hourLabelText: 'Jam',
                      initialTime: TimeOfDay(hour: 0, minute: 0),
                    );
                  },
                );

                log(value.toString());
              },
              child: const Text('Time Picker'),
            ),
            const ColorPickerExample(),
            const ImagePickerExample(),
            const FilePickerExample(),
          ],
        ),
      ),
    );
  }
}
