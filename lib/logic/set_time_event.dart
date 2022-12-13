part of 'set_time_bloc.dart';

@immutable
abstract class SetTimeEvent {}
class IncSetTimeEvent extends SetTimeEvent{}
class DecSetTimeEvent extends SetTimeEvent{}
class  PresetOneHoursEvent extends SetTimeEvent{}
class PresetTwoHoursEvent extends SetTimeEvent{}
class PresetTreeHoursEvent extends SetTimeEvent{}
