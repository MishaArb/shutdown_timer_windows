
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'start_timer_event.dart';
part 'start_timer_state.dart';

class StartTimerBloc extends Bloc<StartTimerEvent, StartTimerState> {
  StartTimerBloc() : super(StoppedTimerState()) {
    on<PlayTimerEvent>((event, emit) {
      emit(StartedTimerState());
    });

    on<StopTimerEvent>((event, emit) {
      emit(StoppedTimerState());
    });
  }
}
