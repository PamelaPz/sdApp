import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:sd_app/app/models/Personal.dart';
import 'package:sd_app/app/repositories/personal_repository.dart';
import './bloc.dart';

class SecurityBloc extends Bloc<SecurityEvent, SecurityState> {
  final PersonalRepository personalRepository = PersonalRepository();
  final String uidPersonalType = 'JJsDydl3krEA6UDZm676';

  @override
  SecurityState get initialState => InitialSecurityState();

  @override
  Stream<SecurityState> mapEventToState(
    SecurityEvent event,
  ) async* {
    if (event is SecurityStarted) {
      yield SecurityLoading();

      List<Personal> securityPersonal =
          await personalRepository.getPersonal(idPersonalType: uidPersonalType);

      yield SecurityLoaded(securityPersonal: securityPersonal);
    }
  }
}
