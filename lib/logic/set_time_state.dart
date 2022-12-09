part of 'set_time_bloc.dart';

@immutable
abstract class SetTimeState {
   int time;
   void changeTime();
  SetTimeState( this.time);
}

class IncSetTimeState extends SetTimeState {
  IncSetTimeState(super.time);

  @override
  void changeTime() {
    if(time < 3600){
      time +=600;
    }else if(time < 7200){
      time +=1200;
    } else {
      time +=1800;
    }

  }
}
class DecSetTimeState extends SetTimeState {
  DecSetTimeState(super.time);

  @override
  void changeTime() {
    if(time > 7200){
      time -=1800;
    }else if(time > 3600){
      time -=1200;
    } else {
      time -=600;
    }
  }
}

