import 'package:equatable/equatable.dart';
import 'package:sd_app/app/models/Personal.dart';
import 'package:meta/meta.dart';

abstract class DoctorsState extends Equatable {
  const DoctorsState();

  @override
  List<Object> get props => [];
}

class InitialDoctorsState extends DoctorsState {}

class DoctorsLoading extends DoctorsState {}

class DoctorsLoaded extends DoctorsState {
  final List<Personal> doctors;

  DoctorsLoaded({
    @required this.doctors,
  });

  @override
  List<Object> get props => [doctors];
}
