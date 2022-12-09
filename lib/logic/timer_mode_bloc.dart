import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'timer_mode_event.dart';
part 'timer_mode_state.dart';

class TimerModeBloc extends Bloc<TimerModeEvent, TimerModeState> {
  TimerModeBloc() : super(TimerModeInitial()) {
    on<TurnOffTimerModeEvent>((event, emit) {
      emit(TurnOffTimerModeState());
    });
    on<SleepTimerModeEvent>((event, emit) {
      emit(SleepTimerModeState());
    });
  }
}
