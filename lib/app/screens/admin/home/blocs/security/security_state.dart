import 'package:equatable/equatable.dart';
import 'package:sd_app/app/models/Personal.dart';
import 'package:meta/meta.dart';

abstract class SecurityState extends Equatable {
  const SecurityState();

  @override
  List<Object> get props => [];
}

class InitialSecurityState extends SecurityState {}

class SecurityLoading extends SecurityState {}

class SecurityLoaded extends SecurityState {
  final List<Personal> securityPersonal;

  SecurityLoaded({
    @required this.securityPersonal,
  });

  @override
  List<Object> get props => [securityPersonal];
}
