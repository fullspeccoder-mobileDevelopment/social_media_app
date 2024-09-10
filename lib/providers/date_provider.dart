import 'package:flutter_riverpod/flutter_riverpod.dart';

final dateProvider = StateNotifierProvider<DateStateNotifier, DateTime>((ref) {
  return DateStateNotifier();
});

class DateStateNotifier extends StateNotifier<DateTime> {
  DateStateNotifier() : super(DateTime.now());

  void modifyTime(DateTime? value) {
    state = state.copyWith(
      hour: value!.hour,
      minute: value.minute,
    );
    // state = state.copyWith(selectedTime: value);
  }

  void modifyDate(DateTime? value) {
    state = state.copyWith(
      year: value!.year,
      month: value.month,
      day: value.day,
    );
    // state = state.copyWith(selectedDate: value);
  }
}
