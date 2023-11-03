//----------------------------------------------------------------------------//

// * benvenuto in tonight

import 'package:flutter/material.dart';
import 'package:dik/Theme/my_app.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/scheduler.dart' show timeDilation;

//----------------------------------------------------------------------------//

// * queste linee inizializzano l'applicazione

Future main() async {
  // rallenta le animazioni in app di un fattore x
  timeDilation = 1.0;
  // configurazione di firestore // if the app is stucked and didn't run or crash make sure if firestore is working correctly
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  Paint.enableDithering = true;

  // inizializza tonight
  runApp(const Tonight());
}

//----------------------------------------------------------------------------//

/*

▒▒▒▒▒▒▒▒██▓▓████████▓▓██▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒
▒▒▒▒▓▓██  ██        ██  ██▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒
▒▒▒▒████                ██▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒
▒▒▓▓████                  ██▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒
▓▓██      ██    ██          ▓▓▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▒▓▓▒▒
▓▓██                          ████▓▓▒▒▒▒▒▒▒▒▒▒▒▒▒▒
▓▓██        ████                  ██████████████▒▒
▓▓██    ██  ██    ██                            ██
▓▓██      ████████                          ████▓▓
▓▓██                                      ██▓▓██▒▒
▓▓██                                      ██▓▓▒▒▓▓
▓▓██                                      ██▓▓▒▒▒▒
▓▓██                                      ██▒▒▒▒▒▒
████                                    ██▓▓▒▒▒▒▒▒
▓▓▓▓                                    ██▓▓▒▒▒▒▒▒
▒▒████      ████    ████████    ████    ██▒▒▒▒▒▒▒▒
▒▒▓▓██      ████  ██▓▓▓▓▓▓██  ██▓▓██    ██▓▓▒▒▒▒▒▒
▒▒▓▓██    ██▓▓▓▓██▓▓▒▒▒▒▓▓▓▓██▓▓▓▓██  ██▓▓▒▒▒▒▒▒▒▒
▒▒▓▓▓▓████▓▓▒▒▓▓▓▓▒▒▒▒▒▒▒▒▒▒▓▓▒▒▒▒▓▓██▓▓▒▒▒▒▒▒▒▒▒▒

WUF

*/

//----------------------------------------------------------------------------//
