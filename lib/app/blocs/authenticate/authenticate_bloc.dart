import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:sd_app/app/repositories/user_repository.dart';
import './bloc.dart';
import 'package:meta/meta.dart';

class AuthenticateBloc extends Bloc<AuthenticateEvent, AuthenticateState> {
  final UserRepository userRepository;

  AuthenticateBloc({
    @required this.userRepository,
  });

  @override
  AuthenticateState get initialState => InitialAuthenticateState();

  @override
  Stream<AuthenticateState> mapEventToState(
    AuthenticateEvent event,
  ) async* {
    if (event is AppStarted) {
      if (await userRepository.hasUid()) {
        yield Authenticated();
      } else {
        yield Unauthenticated(userRepository: userRepository);
      }
    }

    if (event is LoggedIn) {
      userRepository.setUid(uid: event.firebaseUser.uid);

      yield Authenticated();
    }

    if (event is LoggedOut) {
      userRepository.logout();

      yield Unauthenticated(userRepository: userRepository);
    }
  }
}
