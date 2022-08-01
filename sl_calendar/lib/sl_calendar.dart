library sl_calendar;

import 'package:flutter/material.dart'; 
///sl calender
class SlCalender extends StatelessWidget {
  /// pass moth,day or week view
  const SlCalender({
    required this.child,
    Key? key,
  }) : super(key: key);

  ///child of the calender
  final Widget child;

  @override
  Widget build(BuildContext context) => child;
}
