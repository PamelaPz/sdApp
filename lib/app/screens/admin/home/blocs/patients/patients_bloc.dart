import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:sd_app/app/models/Entry.dart';
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

      List<Entry> patients = await patientRepositiry.getEntries();

      yield PatientsLoaded(patients: patients);
    }
  }
}
