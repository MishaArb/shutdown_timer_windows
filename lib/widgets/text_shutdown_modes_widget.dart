import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../logic/timer_mode_bloc.dart';

class TextShutdownModesWidget extends StatelessWidget {
  const TextShutdownModesWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: const Alignment(0, -0.8),
      child:  BlocBuilder<TimerModeBloc, TimerModeState>(
        builder: (context, state) {
          return  Container(
            padding: state is TimerModeInitial ? const EdgeInsets.all(0) : const EdgeInsets.only(left: 7, right: 7, top: 5, bottom: 5) ,
            decoration: BoxDecoration(
                color: const Color.fromARGB(255, 36, 82,122),
                borderRadius: BorderRadius.circular(15)
            ),
            child:  Text(state is SleepTimerModeState ? 'ТАЙМЕР СНУ' : state is TurnOffTimerModeState ? 'ТАЙМЕР ВІДКЛЮЧЕННЯ' : '',
              style: const TextStyle(fontWeight: FontWeight.bold,
                fontSize: 12,
                color: Color.fromARGB(255, 225, 232, 248),),),
          );
        },
      ),
    );
  }
}