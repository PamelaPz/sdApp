import 'package:equatable/equatable.dart';

abstract class NursesEvent extends Equatable {
  const NursesEvent();

  @override
  List<Object> get props => [];
}

class NursesStarted extends NursesEvent {}
