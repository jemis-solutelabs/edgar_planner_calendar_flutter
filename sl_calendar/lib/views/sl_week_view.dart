import 'dart:developer';

import 'package:calendar_view/calendar_view.dart';
import 'package:flutter/material.dart'; 
///sl week view
class SlWeekView extends StatefulWidget {
  ///
  const SlWeekView({Key? key}) : super(key: key);

  @override
  State<SlWeekView> createState() => _SlWeekViewState();
}

class _SlWeekViewState extends State<SlWeekView> {
  @override
  Widget build(BuildContext context) =>WeekView(
    controller: EventController(),
    eventTileBuilder: (DateTime date, List<CalendarEventData<Object?>> events,
     Rect boundry, DateTime start, DateTime end)=>
        // Return your widget to display as event tile.
          Container()
  ,
    showLiveTimeLineInAllDays: true, // To display live time line in all pages in week view.
    width: 400, // width of week view.
    minDay: DateTime(1990),
    maxDay: DateTime(2050),
    initialDay: DateTime(2021),
    heightPerMinute: 1, // height occupied by 1 minute time span.
    eventArranger: const SideEventArranger(), 
    // To define how simultaneous events will be arranged.
    onEventTap: (List<CalendarEventData<Object?>> events, DateTime date) =>
     log(events.toString()),
    onDateLongPress: (DateTime date) => log(date.toString()),
    startDay: WeekDays.sunday, // To change the first day of the week.
);
}