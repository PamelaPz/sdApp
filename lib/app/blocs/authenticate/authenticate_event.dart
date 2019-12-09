import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:meta/meta.dart';

abstract class AuthenticateEvent extends Equatable {
  const AuthenticateEvent();

  @override
  List<Object> get props => [];
}

class AppStarted extends AuthenticateEvent {}

class LoggedIn extends AuthenticateEvent {
  final FirebaseUser firebaseUser;

  LoggedIn({@required this.firebaseUser});

  @override
  List<Object> get props => [firebaseUser];
}

class LoggedOut extends AuthenticateEvent {}
