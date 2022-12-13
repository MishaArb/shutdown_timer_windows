import 'package:bitsdojo_window/bitsdojo_window.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:timer_count_down/timer_controller.dart';

import '../logic/timer_mode_bloc.dart';
import '../widgets/preset_time_widget.dart';
import '../widgets/shutdown_mods_widgets.dart';
import '../widgets/text_shutdown_modes_widget.dart';
import '../widgets/timer_widget.dart';
import '../widgets/window_button_widget.dart';

class MainScreen extends StatelessWidget {
  MainScreen({
    super.key,
  });

  final CountdownController _controller = CountdownController(autoStart: false);

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Stack(

        children: [
          const WindowButtonWidget(),
          MoveWindow(),
          const TextShutdownModesWidget(),
          BlocBuilder<TimerModeBloc, TimerModeState>(
            builder: (context, state) {
              if (state is TurnOffTimerModeState ||  state is SleepTimerModeState) {
                return TimerWidget(controller: _controller,);
              } else {
                return const SizedBox();
              }
            },
          ),
          PresetTimeWidget(),
          ShutdownModesWidget(controller: _controller,),
        ],
      ),
    );
  }
}




