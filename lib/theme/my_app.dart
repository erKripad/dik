//----------------------------------------------------------------------------//

/* in questa sezione vengono importati tutti i pacchetti di Dart cioè le 
   estensioni per rendere magico Flutter */

import 'package:flutter/material.dart';
import 'package:convex_bottom_bar/convex_bottom_bar.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';

//----------------------------------------------------------------------------//

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  static const String _title = "Dik Demo";

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: _title,
      home: const MyStatefulWidget(),
      theme: ThemeData(
        primarySwatch: Colors.purple,
      ),
    );
  }
}

//----------------------------------------------------------------------------//

class MyStatefulWidget extends StatefulWidget {
  const MyStatefulWidget({super.key});

  @override
  State<MyStatefulWidget> createState() => _MyStatefulWidgetState();
}

//----------------------------------------------------------------------------//

class _MyStatefulWidgetState extends State<MyStatefulWidget> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
            gradient: LinearGradient(
          colors: [
            Colors.black,
            Colors.purple,
            Colors.deepOrangeAccent,
          ],
          begin: Alignment.bottomCenter,
          end: Alignment.topCenter,
        )),
      ),
      extendBodyBehindAppBar: true,
      floatingActionButtonLocation: FloatingActionButtonLocation.miniEndTop,
      bottomNavigationBar: ConvexAppBar(
        items: const [
          TabItem(icon: Icons.map, title: 'Map'),
          TabItem(icon: Icons.home, title: 'Home'),
          TabItem(icon: Icons.people, title: 'Profile'),
        ],
        color: Colors.white,
        backgroundColor: Colors.black,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => const MessagePage()),
          );
        },
        tooltip: 'Help Chat',
        backgroundColor: Colors.black,
        child: const Icon(
          Icons.message,
          color: Colors.white,
        ),
      ),
    );
  }
}

//----------------------------------------------------------------------------//

class MessagePage extends StatelessWidget {
  const MessagePage({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        elevation: 0,
        title: const Text('Chat with an operator'),
        backgroundColor: Colors.transparent,
        centerTitle: true,
      ),
      body: Container(
        decoration: const BoxDecoration(
            gradient: LinearGradient(
          colors: [
            Colors.black,
            Colors.purple,
            Colors.deepOrangeAccent,
          ],
          begin: Alignment.bottomCenter,
          end: Alignment.topCenter,
        )),
      ),
    );
  }
}

//----------------------------------------------------------------------------//

@override
Widget build(BuildContext context) {
  return Scaffold(
    body: AnimationLimiter(
      child: ListView.builder(
        itemCount: 100,
        itemBuilder: (BuildContext context, int index) {
          return AnimationConfiguration.staggeredList(
            position: index,
            duration: const Duration(milliseconds: 375),
            child: SlideAnimation(
              verticalOffset: 50.0,
              child: FadeInAnimation(
                child: YourListChild(),
              ),
            ),
          );
        },
      ),
    ),
  );
}
