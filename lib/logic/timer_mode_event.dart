part of 'timer_mode_bloc.dart';

@immutable
abstract class TimerModeEvent {}
class TurnOffTimerModeEvent  extends TimerModeEvent{}
class SleepTimerModeEvent  extends TimerModeEvent{}
