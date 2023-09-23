//----------------------------------------------------------------------------//

import 'package:flutter/material.dart';
import 'package:dik/Theme/colors.dart';

//----------------------------------------------------------------------------//
/*
class NewEventPage extends StatelessWidget {
  const NewEventPage({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Text(
          "Crea Evento",
          style: TextStyle(
            fontFamily: "Gelion Bold",
            fontSize: 25,
            color: textColour,
          ),
        ),
      ),
      extendBodyBehindAppBar: true,
      backgroundColor: primaryBackgroundColour,
      floatingActionButtonLocation: FloatingActionButtonLocation.endTop,
    );
  }
}
*/

class NewEventPage extends StatefulWidget {
  const NewEventPage({Key? key}) : super(key: key);

  @override
  NewEventPageState createState() {
    return NewEventPageState();
  }
}

class NewEventPageState extends State<NewEventPage> {
  DateTime selectedDate = DateTime.now();
  TimeOfDay selectedTime = TimeOfDay.now();
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(
            "${selectedDate.day} - ${selectedDate.month} - ${selectedDate.year}",
          ),
          ElevatedButton(
            child: const Text("Choose Date"),
            onPressed: () async {
              final DateTime? dateTime = await showDatePicker(
                context: context,
                initialDate: selectedDate,
                firstDate: DateTime.now(),
                lastDate: DateTime(
                  DateTime.now().year + 10,
                  DateTime.now().month,
                  DateTime.now().day,
                ),
              );
              if (dateTime != null) {
                setState(() {
                  selectedDate = dateTime;
                });
              }
            },
          ),
          Text("${selectedTime.hour}:${selectedTime.minute}"),
          ElevatedButton(
            child: const Text("Choose Time"),
            onPressed: () async {
              final TimeOfDay? timeOfDay = await showTimePicker(
                context: context,
                initialTime: TimeOfDay.now(),
                initialEntryMode: TimePickerEntryMode.input,
              );
              if (timeOfDay != null) {
                setState(() {
                  selectedTime = timeOfDay;
                });
              }
            },
          ),
        ],
      ),
    );
  }

/*
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          
        ],
      ),
    );
  }
  */
}

//----------------------------------------------------------------------------//