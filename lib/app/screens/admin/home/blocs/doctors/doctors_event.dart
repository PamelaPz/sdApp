import 'package:equatable/equatable.dart';

abstract class DoctorsEvent extends Equatable {
  const DoctorsEvent();

  @override
  List<Object> get props => [];
}

class DoctorsStarted extends DoctorsEvent {}
