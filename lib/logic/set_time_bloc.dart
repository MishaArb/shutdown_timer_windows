import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'set_time_event.dart';
part 'set_time_state.dart';

class SetTimeBloc extends Bloc<SetTimeEvent, SetTimeState> {
  SetTimeBloc() : super(IncSetTimeState(0)) {
    on<IncSetTimeEvent>((event, emit) {
     emit(IncSetTimeState(state.time)..changeTime());
    });

    on<DecSetTimeEvent>((event, emit) {
      emit(DecSetTimeState(state.time)..changeTime());
    });
    on<PresetOneHoursEvent>((event, emit) {
      emit(PresetOneHoursState(state.time)..changeTime());
    });
    on<PresetTwoHoursEvent>((event, emit) {
      emit(PresetTwoHoursState(state.time)..changeTime());
    });
    on<PresetTreeHoursEvent>((event, emit) {
      emit(PresetTreeHoursState(state.time)..changeTime());
    });
  }
}
