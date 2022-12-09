part of 'timer_mode_bloc.dart';

@immutable
abstract class TimerModeState {}

class TimerModeInitial extends TimerModeState {}
class TurnOffTimerModeState extends TimerModeState {}
class SleepTimerModeState extends TimerModeState {}
