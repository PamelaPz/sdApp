import 'package:equatable/equatable.dart';
import 'package:sd_app/app/repositories/user_repository.dart';
import 'package:meta/meta.dart';

abstract class AuthenticateState extends Equatable {
  const AuthenticateState();

  @override
  List<Object> get props => [];
}

class InitialAuthenticateState extends AuthenticateState {
  @override
  List<Object> get props => [];
}

class Authenticated extends AuthenticateState {}

class Unauthenticated extends AuthenticateState {
  final UserRepository userRepository;

  Unauthenticated({
    @required this.userRepository,
  });

  @override
  List<Object> get props => [userRepository];
}
