//----------------------------------------------------------------------------//

// framework

import 'package:dik/Theme/App/Widgets/text2.dart';
import 'package:flutter/material.dart';

// widgets
import 'package:dik/theme/App/Widgets/appbar.dart';
import 'package:dik/Theme/App/Widgets/title2.dart';
import 'package:interval_time_picker/interval_time_picker.dart' as interval;

// colors
import 'package:dik/theme/colors.dart';

// firebase
import 'package:cloud_firestore/cloud_firestore.dart';

// external extentions
import 'package:flutter/cupertino.dart';

//----------------------------------------------------------------------------//

class AddEventPage extends StatelessWidget {
  const AddEventPage({super.key});
  @override
  Widget build(BuildContext context) {
    double screenheight = MediaQuery.of(context).size.height;
    double screenwidth = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(screenheight / 16),
        child: const MyAppBar(
          gobackbutton: true,
        ),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(screenwidth * 4 / 100),
        scrollDirection: Axis.vertical,
        physics: const BouncingScrollPhysics(decelerationRate: ScrollDecelerationRate.fast),
        child: Column(
          children: [
            const Title2(
              title: "Add Event Page",
            ),
            SizedBox(
              height: screenheight * 5 / 100,
            ),
            const Title2(title: "Event Info"),
            SizedBox(
              height: screenheight * 2 / 100,
            ),
            const AddContainer(),
          ],
        ),
      ),
      extendBodyBehindAppBar: false,
      backgroundColor: primaryBackgroundColor,
      floatingActionButtonLocation: FloatingActionButtonLocation.endTop,
    );
  }
}

class AddContainer extends StatefulWidget {
  const AddContainer({super.key});

  @override
  State<AddContainer> createState() => AddContainerState();
}

class AddContainerState extends State<AddContainer> {
  DateTime selectedDate = DateTime.now();
  TimeOfDay selectedTime = TimeOfDay.now();
  final titleController = TextEditingController();
  final dateController = TextEditingController();
  final timeController = TextEditingController();
  final placeController = TextEditingController();
  final photoController = TextEditingController();

  @override
  Widget build(context) {
    double screenheight = MediaQuery.of(context).size.height;
    double screenwidth = MediaQuery.of(context).size.width;
    return Container(
      decoration: BoxDecoration(
        color: Colors.transparent,
        borderRadius: const BorderRadius.all(Radius.circular(20)),
      ),
      padding: EdgeInsets.all(screenwidth * 1 / 100),
      height: screenheight * 50 / 100,
      child: Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
        Expanded(
          child: TextFormField(
            style: TextStyle(
              color: Colors.white,
              fontSize: screenheight * 2 / 100,
            ),
            showCursor: false,
            cursorColor: Colors.white,
            decoration: InputDecoration(
              labelText: "Title",
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  color: primaryPurple.withOpacity(0.8),
                ),
              ),
              labelStyle: TextStyle(
                fontFamily: "Gelion Medium",
                color: primaryPurple.withOpacity(0.8),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  color: primaryPurple.withOpacity(0.8),
                ),
              ),
            ),
            controller: titleController,
          ),
        ),
        SizedBox(height: screenheight * 4 / 100),
        Expanded(
          child: TextFormField(
            style: TextStyle(
              color: Colors.white,
              fontSize: screenheight * 2 / 100,
            ),
            showCursor: false,
            readOnly: true,
            cursorColor: Colors.white,
            decoration: InputDecoration(
              labelText: "Date",
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  color: primaryPurple.withOpacity(0.8),
                ),
              ),
              labelStyle: TextStyle(
                fontFamily: "Gelion Medium",
                color: primaryPurple.withOpacity(0.8),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  color: primaryPurple.withOpacity(0.8),
                ),
              ),
            ),
            controller: dateController,
            onTap: () async {
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
                  dateController.text = "${selectedDate.day} - ${selectedDate.month} - ${selectedDate.year}";
                });
              }
            },
          ),
        ),
        SizedBox(height: screenheight * 4 / 100),
        Expanded(
          child: TextFormField(
              style: TextStyle(
                color: Colors.white,
                fontSize: screenheight * 2 / 100,
              ),
              readOnly: true,
              showCursor: false,
              cursorColor: Colors.white,
              decoration: InputDecoration(
                labelText: "Time",
                enabledBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: primaryPurple.withOpacity(0.8),
                  ),
                ),
                labelStyle: TextStyle(
                  fontFamily: "Gelion Medium",
                  color: primaryPurple.withOpacity(0.8),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: primaryPurple.withOpacity(0.8),
                  ),
                ),
              ),
              controller: timeController,
              onTap: () async {
                final TimeOfDay? timeOfDay = await interval.showIntervalTimePicker(
                  context: context,
                  initialTime: TimeOfDay(hour: TimeOfDay.now().hour, minute: TimeOfDay.now().minute - TimeOfDay.now().minute % 15),
                  interval: 15,
                  visibleStep: interval.VisibleStep.fifteenths,
                  initialEntryMode: interval.TimePickerEntryMode.inputOnly,
                  builder: (BuildContext context, Widget? child) {
                    return MediaQuery(
                      data: MediaQuery.of(context).copyWith(alwaysUse24HourFormat: true),
                      child: child!,
                    );
                  },
                );
                if (timeOfDay != null) {
                  setState(() {
                    selectedTime = timeOfDay;
                    timeController.text = "${selectedTime.hour}:${selectedTime.minute}";
                  });
                }
              }),
        ),
        SizedBox(height: screenheight * 4 / 100),
        Expanded(
          child: TextFormField(
            style: TextStyle(
              color: Colors.white,
              fontSize: screenheight * 2 / 100,
            ),
            showCursor: false,
            cursorColor: Colors.white,
            decoration: InputDecoration(
              labelText: "Place",
              enabledBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  color: primaryPurple.withOpacity(0.8),
                ),
              ),
              labelStyle: TextStyle(
                fontFamily: "Gelion Medium",
                color: primaryPurple.withOpacity(0.8),
              ),
              focusedBorder: OutlineInputBorder(
                borderSide: BorderSide(
                  color: primaryPurple.withOpacity(0.8),
                ),
              ),
            ),
            controller: placeController,
          ),
        ),
        SizedBox(height: screenheight * 4 / 100),
        GestureDetector(
          onTap: () {
            final title = titleController.text;
            final place = placeController.text;
            final date = dateController.text;
            final time = timeController.text;
            createEvent(title: title, place: place, date: date, time: time);
            Navigator.pop(context);
          },
          child: Container(
              height: screenheight * 6 / 100,
              width: screenwidth * 35 / 100,
              decoration: BoxDecoration(
                color: primaryPurple.withOpacity(0.8),
                borderRadius: BorderRadius.all(Radius.circular(20)),
              ),
              child: const Center(
                child: Text2(title: "Add Event"),
              )),
        ),
      ]),
    );
  }

  Future createEvent({
    required String title,
    required String place,
    required String time,
    required String date,
  }) async {
    final docEvent = FirebaseFirestore.instance.collection('events').doc();

    final event = Event(
      title: title,
      id: docEvent.id,
      place: place,
      date: date,
      time: time,
    );

    final json = event.toJson();

    await docEvent.set(json);
  }
}

class Event {
  String id;
  final String title;
  final String place;
  final String time;
  final String date;

  Event({
    this.id = '',
    required this.title,
    required this.place,
    required this.date,
    required this.time,
  });

  Map<String, dynamic> toJson() => {
        'id': id,
        'title': title,
        'date': date,
        'time': time,
        'place': place,
      };
}

//----------------------------------------------------------------------------//