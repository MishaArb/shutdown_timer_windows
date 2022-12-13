import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../logic/set_time_bloc.dart';
import '../logic/timer_mode_bloc.dart';

class PresetTimeWidget extends StatelessWidget {
  const PresetTimeWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Builder(
      builder: (context) {
        final stateTimerMode = context.watch<TimerModeBloc>().state;
        if(stateTimerMode is TurnOffTimerModeState ||  stateTimerMode is SleepTimerModeState){
          return Align(
            alignment: const Alignment(0, -0.05),
            child: SizedBox(
              width: 200,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  OutlinedButton(
                    onPressed: () {
                      BlocProvider.of<SetTimeBloc>(context).add(PresetOneHoursEvent());
                    },
                    style: OutlinedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15),
                        ),
                        side: const BorderSide(
                          color: Color.fromARGB(150, 36, 82, 122),
                        )),
                    child: const Text(
                      '01:00',
                      style: TextStyle(
                          color: Color.fromARGB(150, 36, 82, 122),
                          fontSize: 10,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                  OutlinedButton(
                    onPressed: () {
                      BlocProvider.of<SetTimeBloc>(context).add(PresetTwoHoursEvent());
                    },
                    style: OutlinedButton.styleFrom(

                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15),
                        ),
                        side: const BorderSide(
                          color: Color.fromARGB(150, 36, 82, 122),
                        )),
                    child: const Text(
                      '02:00',
                      style: TextStyle(
                          color: Color.fromARGB(150, 36, 82, 122),
                          fontSize: 10,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                  OutlinedButton(
                    onPressed: () {
                      BlocProvider.of<SetTimeBloc>(context).add(PresetTreeHoursEvent());
                    },
                    style: OutlinedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15),
                        ),
                        side: const BorderSide(
                          color: Color.fromARGB(150, 36, 82, 122),
                        )),
                    child: const Text(
                      '03:00',
                      style: TextStyle(
                          color: Color.fromARGB(150, 36, 82, 122),
                          fontSize: 10,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ],
              ),
            ),
          );
        } else{
          return const SizedBox();
        }
      }
    );
  }
}



