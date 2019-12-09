import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:sd_app/app/models/Patient.dart';

abstract class PatientsState extends Equatable {
  const PatientsState();

  @override
  List<Object> get props => [];
}

class InitialPatientsState extends PatientsState {}

class PatientsLoading extends PatientsState {}

class PatientsLoaded extends PatientsState {
  final List<Patient> patients;

  PatientsLoaded({
    @required this.patients,
  });

  @override
  List<Object> get props => [patients];
}
