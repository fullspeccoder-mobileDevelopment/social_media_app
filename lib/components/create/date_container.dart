import 'package:date_field/date_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:untitled_app/providers/date_provider.dart';

class DateContainer extends ConsumerWidget {
  const DateContainer({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final notifier = ref.watch(dateProvider.notifier);
    return Container(
      margin: const EdgeInsets.only(top: 15, bottom: 15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Padding(
            padding: EdgeInsets.only(bottom: 20.0),
            child: Text(
              "Schedule Post (Optional)",
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              DateTimeFormField(
                decoration: InputDecoration(
                    constraints: BoxConstraints.tight(const Size(170, 50))),
                mode: DateTimeFieldPickerMode.date,
                initialPickerDateTime: DateTime.now(),
                onChanged: (DateTime? value) {
                  notifier.modifyDate(value ?? DateTime.now());
                },
                validator: (value) => value!.second > DateTime.now().second
                    ? null
                    : "Date is in the past",
              ),
              DateTimeFormField(
                decoration: InputDecoration(
                    suffixIcon: const Icon(Icons.access_time),
                    constraints: BoxConstraints.tight(const Size(170, 50))),
                mode: DateTimeFieldPickerMode.time,
                initialPickerDateTime: DateTime.now(),
                onChanged: (DateTime? value) {
                  notifier.modifyTime(value ?? DateTime.now());
                },
                validator: (value) => value!.second > DateTime.now().second
                    ? null
                    : "Date is in the past",
              ),
            ],
          )
        ],
      ),
    );
  }
}
