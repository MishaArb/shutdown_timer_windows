import 'dart:io';

import 'package:bitsdojo_window/bitsdojo_window.dart';
import 'package:flutter/material.dart';
import 'package:flutter_acrylic/flutter_acrylic.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shutdown_timer/screens/main_screen.dart';

import 'logic/set_time_bloc.dart';
import 'logic/start_timer_bloc.dart';
import 'logic/timer_mode_bloc.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  if (Platform.isWindows) { // only apply Aero theming on Windows.
    await Window.initialize();
    await Window.setEffect(
      effect: WindowEffect.aero,
      color: const Color.fromARGB(255, 225, 232, 248).withOpacity(0.6),
    );
  }
  runApp(const MyApp());

  doWhenWindowReady(() {
    final win = appWindow;
    const initialSize = Size(700, 300);
    win.minSize = initialSize;
    win.maxSize = initialSize;
    win.size = initialSize;
    win.alignment = Alignment.center;
    win.title = "Shutdown timer";
    win.show();
  });
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
       providers: [
           BlocProvider<SetTimeBloc>(create: (BuildContext context) => SetTimeBloc(),),
           BlocProvider<StartTimerBloc>(create: (BuildContext context) => StartTimerBloc(),),
           BlocProvider<TimerModeBloc>(create: (BuildContext context) => TimerModeBloc(),)

    ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
            fontFamily: 'Graduate'
          // primarySwatch: Colors.blue,
        ),
        home:  MainScreen(),
      ),
    );
  }
}

