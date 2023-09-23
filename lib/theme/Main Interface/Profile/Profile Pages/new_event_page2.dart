import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class NewEventPage2 extends StatefulWidget {
  const NewEventPage2({Key? key}) : super(key: key);

  @override
  NewEventPageState2 createState() {
    return NewEventPageState2();
  }
}

class NewEventPageState2 extends State<NewEventPage2> {
  DateTime dateTime = DateTime.now();

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      child: Center(
        child: CupertinoButton(
          child: Text(
            '${dateTime.day} - ${dateTime.month} - ${dateTime.year}',
          ),
          onPressed: () {
            showCupertinoModalPopup(
              context: context,
              builder: (BuildContext context) => SizedBox(
                height: 250,
                child: CupertinoDatePicker(
                  backgroundColor: Colors.white,
                  initialDateTime: dateTime,
                  onDateTimeChanged: (DateTime newTime) {
                    setState(() => dateTime = newTime);
                  },
                  use24hFormat: true,
                  mode: CupertinoDatePickerMode.date,
                  minimumDate: dateTime,
                  maximumDate: DateTime(
                    DateTime.now().year + 10,
                    DateTime.now().month,
                    DateTime.now().day,
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}

//----------------------------------------------------------------------------//