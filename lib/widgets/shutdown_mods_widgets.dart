import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:timer_count_down/timer_controller.dart';

import '../logic/timer_mode_bloc.dart';

class ShutdownModesWidget extends StatelessWidget {
  // const ShutdownModesWidget({
  //   super.key,
  // });
  const ShutdownModesWidget({
    super.key,
    required CountdownController controller,
  }) : _controller = controller;

  final CountdownController _controller;
  @override
  Widget build(BuildContext context) {
    return Align(
      alignment:  const Alignment(0, 0.9),
      child: SizedBox(
        width: 300,
        child: BlocBuilder<TimerModeBloc, TimerModeState>(
          builder: (context, state) {
            return Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                GestureDetector(
                  onTap: () {
                   Process.run('PowerShell', ['Stop-Computer']);
                  },
                  child: Container(
                    padding: const EdgeInsets.all(8),
                    width: 50,
                    height: 50,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color:  const Color.fromARGB(255, 225, 232, 248).withOpacity(0.8),
                    ),
                    child: Image.asset('images/turnoff.ico', filterQuality: FilterQuality.medium),
                  ),
                ),
                GestureDetector(
                  onTap: (){
                    BlocProvider.of<TimerModeBloc>(context).emit(TimerModeInitial());
                    Process.run("shutdown", ["-h"]);
                  },
                  child: Container(
                    padding: const EdgeInsets.all(8),
                    width: 50,
                    height: 50,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color:  const Color.fromARGB(255, 225, 232, 248).withOpacity(0.8),
                    ),
                    child: Image.asset('images/sleep.png', filterQuality:  FilterQuality.medium),
                  ),
                ),
                GestureDetector(
                  onTap: (){
                    BlocProvider.of<TimerModeBloc>(context).add(TurnOffTimerModeEvent());
                    },
                  child: Container(
                    padding: const EdgeInsets.all(5),
                    width: 50,
                    height: 50,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color:  const Color.fromARGB(255, 225, 232, 248).withOpacity(0.8),
                    ),
                    child: Image.asset(state is TurnOffTimerModeState  ? 'images/timerTurnOffDS.png'  :'images/timerTurnOff.png', filterQuality:  FilterQuality.medium ),
                  ),
                ),
                GestureDetector(
                  onTap: (){
                    BlocProvider.of<TimerModeBloc>(context).add(SleepTimerModeEvent());
                 },
                  child: Container(
                    padding: const EdgeInsets.all(5),
                    width: 50,
                    height: 50,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color:  const Color.fromARGB(255, 225, 232, 248).withOpacity(0.8),
                    ),
                    child: Image.asset(state is SleepTimerModeState  ?'images/timerSleepDS.png' :'images/timerSleep.png'  , filterQuality:  FilterQuality.medium),
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}