import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:sd_app/app/models/Patient.dart';
import 'package:sd_app/app/repositories/patient_repository.dart';
import './bloc.dart';

class PatientsBloc extends Bloc<PatientsEvent, PatientsState> {
  final PatientRepositiry patientRepositiry = PatientRepositiry();
  @override
  PatientsState get initialState => InitialPatientsState();

  @override
  Stream<PatientsState> mapEventToState(
    PatientsEvent event,
  ) async* {
    if (event is PatientsStarted) {
      yield PatientsLoading();

      List<Patient> patients = await patientRepositiry.getPatients();

      yield PatientsLoaded(patients: patients);
    }
  }
}
