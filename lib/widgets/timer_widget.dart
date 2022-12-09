import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:timer_count_down/timer_controller.dart';
import 'package:timer_count_down/timer_count_down.dart';

import '../logic/set_time_bloc.dart';
import '../logic/start_timer_bloc.dart';
import '../logic/timer_mode_bloc.dart';

class TimerWidget extends StatelessWidget {
  const TimerWidget({
    super.key,
    required CountdownController controller,
  }) : _controller = controller;

  final CountdownController _controller;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: const Alignment(0, 0),
      child: Builder(
        builder: (context) {
          final stateStartTimer = context.watch<StartTimerBloc>().state;
          final stateSetTimer = context.watch<SetTimeBloc>().state;
          final stateTimerMode = context.watch<TimerModeBloc>().state;
          return Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Countdown(
                controller: _controller,
                seconds:stateSetTimer.time ,
                build: (BuildContext context, double time)
                {
                  var h = time ~/ 3600;
                  var m = ((time - h * 3600)) ~/ 60;
                  var  s = time - (h * 3600) - (m * 60);
                  return Text('${h.toString().padLeft(2, "0")} : ${m.toString().padLeft(2, "0")} : ${s.truncate().toString().padLeft(2, "0")}', style: const TextStyle(fontSize: 50, color: Color.fromARGB(255, 36, 82,122), fontWeight: FontWeight.bold),);

                },
                interval: const Duration(milliseconds: 100),
                onFinished: () {
                  BlocProvider.of<TimerModeBloc>(context).emit(TimerModeInitial());
                  BlocProvider.of<StartTimerBloc>(context).add(StopTimerEvent());
                  if (stateTimerMode is SleepTimerModeState) {
                    Process.run('shutdown', ['-h']);
                  } else if (stateTimerMode is TurnOffTimerModeState) {
                    Process.run('PowerShell', ['Stop-Computer']);
                  }
                },
              ),
              const SizedBox(height: 20,),
              SizedBox(
                width: 180,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    GestureDetector(
                      onTap: (){
                        BlocProvider.of<SetTimeBloc>(context).add(IncSetTimeEvent());
                      },
                      child: Container(
                        width: 30,
                        height: 30,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(30),
                            color: const Color.fromARGB(255, 36, 82,122)
                        ),
                        child: const Icon(
                          Icons.add,
                          color: Color.fromARGB(255, 225, 232, 248),
                          size: 30,
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: (){
                        if(stateStartTimer is StoppedTimerState){
                          BlocProvider.of<StartTimerBloc>(context).add(PlayTimerEvent());
                          _controller.start();
                        }else{
                          BlocProvider.of<StartTimerBloc>(context).add(StopTimerEvent());
                          _controller.pause();
                        }

                      },
                      child: Container(
                        width: 50,
                        height: 50,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(50),
                          color: const Color.fromARGB(255, 36, 82,122),
                          // border: Border.all(color: Colors.blueAccent)

                        ),
                        child: Icon(
                          stateStartTimer is StartedTimerState ? Icons.pause : Icons.play_arrow_rounded,
                          color: const Color.fromARGB(255, 225, 232, 248),
                          size: 48,
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: (){
                        if(stateSetTimer.time>0){
                          BlocProvider.of<SetTimeBloc>(context).add(DecSetTimeEvent());
                        }
                      },
                      child: Container(
                        width: 30,
                        height: 30,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(30),
                            color: const Color.fromARGB(255, 36, 82,122)
                          // border: Border.all(color: Colors.blueAccent)
                        ),
                        child: const Icon(
                          Icons.remove,
                          color: Color.fromARGB(255, 225, 232, 248),
                          size: 30,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 25,),
            ],
          );
        },
      ),
    );
  }
}


