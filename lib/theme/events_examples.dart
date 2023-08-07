// ignore_for_file: unused_element, unnecessary_new

class Event {
  final String name;
  final String date;
  final String time;
  final String place;
  //final String photo;
  Event(
    this.name,
    this.date,
    this.time,
    this.place,
    //this.photo,
  );
  bool liked = false;
}

var _evento1 = new Event(
  "Caccia alle Papere",
  "11/01/2001",
  "00:00",
  "Napoli",
);

var _evento2 = new Event(
  "Evento Bello",
  "25/12/2001",
  "24:00",
  "Catanzaro",
);
