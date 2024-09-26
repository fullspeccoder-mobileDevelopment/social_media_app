import 'package:flutter_riverpod/flutter_riverpod.dart';

final dateProvider = StateNotifierProvider<DateStateNotifier, DateTime>((ref) {
  return DateStateNotifier();
});

class DateStateNotifier extends StateNotifier<DateTime> {
  DateStateNotifier() : super(DateTime.now());

  /// Modifies time in a [DateTime] object
  void modifyTime(DateTime? value) {
    state = state.copyWith(
      hour: value!.hour,
      minute: value.minute,
    );
  }

  /// Modifies date in a [DateTime] object
  void modifyDate(DateTime? value) {
    state = state.copyWith(
      year: value!.year,
      month: value.month,
      day: value.day,
    );
  }
}
