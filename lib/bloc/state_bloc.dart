import 'package:equatable/equatable.dart';
import 'package:bloc/bloc.dart';

abstract class InfoState extends Equatable {
  const InfoState();

  @override
  List<Object> get props => [];
}

abstract class InfoEvent extends Equatable {
  const InfoEvent();

  @override
  List<Object> get props => [];
}

class InfoBloc extends Bloc<InfoEvent, InfoState> {
  InfoBloc(InfoState initialState) : super(initialState);
    
  @override
  Stream<InfoState> mapEventToState (InfoEvent event) async*{
    if (event is){
      yield ;
    } else if (event is){
      yield ;
    }
  }
}