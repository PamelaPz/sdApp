import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:sd_app/app/models/Personal.dart';
import 'package:sd_app/app/repositories/personal_repository.dart';
import './bloc.dart';

class DoctorsBloc extends Bloc<DoctorsEvent, DoctorsState> {
  PersonalRepository personalRepository = PersonalRepository();
  String uidPersonalType = 'GPcuJQB3DMzUODMv1r6D';

  @override
  DoctorsState get initialState => InitialDoctorsState();

  @override
  Stream<DoctorsState> mapEventToState(
    DoctorsEvent event,
  ) async* {
    if (event is DoctorsStarted) {
      yield DoctorsLoading();

      List<Personal> doctors =
          await personalRepository.getPersonal(idPersonalType: uidPersonalType);

      yield DoctorsLoaded(doctors: doctors);
    }
  }
}
