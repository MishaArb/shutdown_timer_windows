part of 'start_timer_bloc.dart';

@immutable
abstract class StartTimerEvent {}
class PlayTimerEvent extends StartTimerEvent{}
class StopTimerEvent extends StartTimerEvent{}

