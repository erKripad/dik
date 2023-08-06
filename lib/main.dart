//----------------------------------------------------------------------------//
//                                                                            //
//                            ___      _ _                                    //
//                           / _ \__ _| | | ___                               //
//                          / /_)/ _` | | |/ _ \                              //
//                         / ___/ (_| | | |  __/                              //
//                         \/    \__,_|_|_|\___|                              //
//                                                                            //
//----------------------------------------------------------------------------//

//----------------------------------------------------------------------------//

// benvenuto in tonight

import 'package:flutter/material.dart';
import 'package:dik/Theme/my_app.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

//----------------------------------------------------------------------------//

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );  
  runApp(const MyApp());
}

//----------------------------------------------------------------------------//