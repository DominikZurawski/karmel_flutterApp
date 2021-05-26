import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/widgets.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';


/// The hove page which hosts the calendar
class Calendar extends StatefulWidget {
  /// Creates the home page to display teh calendar widget.
  /*const MyHomePage(
      //{Key? key}
      ) : super(
    //key: key
  );

  @override*/
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<Calendar> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Kalendarz"),
        ),


        body: SfDateRangePicker(

          showNavigationArrow: true,
          view: DateRangePickerView.month,

          headerStyle: DateRangePickerHeaderStyle(
              backgroundColor: Color(0xff7fcd91),
              textAlign: TextAlign.center,
              textStyle: TextStyle(
                fontStyle: FontStyle.normal,
                fontSize: 25,
                //letterSpacing: 5,
                color: Color(0xffe6efe8),
              )),

          monthViewSettings: DateRangePickerMonthViewSettings(
              firstDayOfWeek: 1,
              blackoutDates: [DateTime(2021, 05, 25)],
              weekendDays: [6,7],
              specialDates: [
                DateTime(2021, 05, 20),
                DateTime(2021, 05, 16),
                DateTime(2021, 05, 17)
              ],
              showTrailingAndLeadingDates: true,
              dayFormat: 'EEE'
          ),
          monthCellStyle: DateRangePickerMonthCellStyle(
            blackoutDatesDecoration: BoxDecoration(
                color: Colors.red,
                border: Border.all(color: const Color(0xFFF44436), width: 1),
                shape: BoxShape.circle),
            /*weekendDatesDecoration: BoxDecoration(
                color: const Color(0xFFDFDFDF),
                border: Border.all(color: const Color(0xFFB6B6B6), width: 1),
                shape: BoxShape.circle,

            ),*/
            weekendTextStyle: TextStyle(color: Colors.red),
            specialDatesDecoration: BoxDecoration(
                color: Colors.green,
                border: Border.all(color: const Color(0xFF2B732F), width: 1),
                shape: BoxShape.circle),
            blackoutDateTextStyle: TextStyle(
                color: Colors.white, decoration: TextDecoration.lineThrough),
            specialDatesTextStyle: const TextStyle(color: Colors.white),
          ),
        )
    );
  }

}