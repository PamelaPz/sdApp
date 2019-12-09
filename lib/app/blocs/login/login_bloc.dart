import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:sd_app/app/blocs.dart';
import 'package:sd_app/app/repositories/user_repository.dart';
import './bloc.dart';
import 'package:meta/meta.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final AuthenticateBloc authenticateBloc;
  final UserRepository userRepository;

  LoginBloc({@required this.authenticateBloc, @required this.userRepository});

  @override
  LoginState get initialState => InitialLoginState();

  @override
  Stream<LoginState> mapEventToState(
    LoginEvent event,
  ) async* {
    if (event is LoginButtonPressed) {
      yield LoginLoading();

      try {
        FirebaseUser firebaseUser = await userRepository.authenticate(
          email: event.email,
          password: event.password,
        );

        authenticateBloc.add(LoggedIn(firebaseUser: firebaseUser));
      } catch (_) {
        yield LoginFailure(error: _.toString());
      }
    }
  }
}
