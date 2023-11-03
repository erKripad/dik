//----------------------------------------------------------------------------//

// framework
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

// widgets
import 'package:dik/Theme/Widgets/compact_event_frame.dart';

// icons
import 'package:dik/Theme/MaterialsUI/icons.dart';

// simil-database
import 'package:dik/Theme/DatabaseSamples/events_examples.dart';

//----------------------------------------------------------------------------//

class SavedScreen extends StatelessWidget {
  const SavedScreen({super.key});
  @override
  Widget build(BuildContext context) {
    double screenheight = MediaQuery.of(context).size.height;
    double screenwidth = MediaQuery.of(context).size.width;

    return Container(
      padding: EdgeInsets.all(screenwidth * 4 / 100),
      child: Column(
        children: [
          Center(
            child: CompactEventFrameItem(
              title: title,
              place: place,
              date: date,
              time: time,
              price: price,
              image: image,
              category: CustomIcons.disco,
            ),
          )
        ],
      ),
    );
  }
}



//----------------------------------------------------------------------------//


//----------------------------------------------------------------------------//