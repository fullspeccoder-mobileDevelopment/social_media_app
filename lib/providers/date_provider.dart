import 'package:flutter_riverpod/flutter_riverpod.dart';

final dateProvider = StateNotifierProvider<DateStateNotifier, Date>((ref) {
  return DateStateNotifier();
});

class Date {
  final DateTime selectedDate;
  final DateTime selectedTime;

  Date({
    required this.selectedDate,
    required this.selectedTime,
  });

  Date copyWith({
    DateTime? selectedDate,
    DateTime? selectedTime,
  }) {
    return Date(
      selectedDate: selectedDate ?? this.selectedDate,
      selectedTime: selectedTime ?? this.selectedTime,
    );
  }
}

class DateStateNotifier extends StateNotifier<Date> {
  DateStateNotifier()
      : super(Date(
          selectedDate: DateTime.now(),
          selectedTime: DateTime.now(),
        ));

  void modifyTime(DateTime? value) {
    state = state.copyWith(selectedTime: value);
  }

  void modifyDate(DateTime? value) {
    state = state.copyWith(selectedDate: value);
  }
}
