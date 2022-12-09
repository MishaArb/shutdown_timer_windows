part of 'start_timer_bloc.dart';

@immutable
abstract class StartTimerState {}

class StartedTimerState extends StartTimerState {}
class StoppedTimerState extends StartTimerState {}
