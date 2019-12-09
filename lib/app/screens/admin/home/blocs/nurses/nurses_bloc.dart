import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:sd_app/app/models/Personal.dart';
import 'package:sd_app/app/repositories/personal_repository.dart';
import './bloc.dart';

class NursesBloc extends Bloc<NursesEvent, NursesState> {
  final PersonalRepository personalRepository = PersonalRepository();
  final String uidPersonalType = 'aGjQmNHJvvIXmtQBRETA';

  @override
  NursesState get initialState => InitialNursesState();

  @override
  Stream<NursesState> mapEventToState(
    NursesEvent event,
  ) async* {
    if (event is NursesStarted) {
      yield NursesLoading();

      List<Personal> nurses =
          await personalRepository.getPersonal(idPersonalType: uidPersonalType);

      yield NursesLoaded(nurses: nurses);
    }
  }
}
