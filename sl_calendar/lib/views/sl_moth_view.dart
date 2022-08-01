import 'package:calendar_view/calendar_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

/// slcalendar month view
class SlMothView extends StatelessWidget {
  const SlMothView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => Scaffold(
        body: MonthView(
          controller: EventController(),
          // to provide custom UI for month cells.
          cellBuilder: (DateTime date, List<CalendarEventData<Object?>> events,
              bool isToday, bool isInMonth) {
            // Return your widget to display as month cell.
            return Container();
          },
          minMonth: DateTime(1990),
          maxMonth: DateTime(2050),
          initialMonth: DateTime(2021),
          cellAspectRatio: 1,
          onPageChange: (DateTime date, int pageIndex) =>
              print('$date, $pageIndex'),
          onCellTap: (List<CalendarEventData<Object?>> events, DateTime date) {
            // Implement callback when user taps on a cell.
            print(events);
          },
          startDay: WeekDays.sunday, // To change the first day of the week.
          // This callback will only work if cellBuilder is null.
          onEventTap: (CalendarEventData<Object?> event, DateTime date) =>
              print(event),
          onDateLongPress: (DateTime date) => print(date),
        ),
      );
}
