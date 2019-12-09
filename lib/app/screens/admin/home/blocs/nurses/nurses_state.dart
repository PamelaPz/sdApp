import 'package:equatable/equatable.dart';
import 'package:sd_app/app/models/Personal.dart';
import 'package:meta/meta.dart';

abstract class NursesState extends Equatable {
  const NursesState();

  @override
  List<Object> get props => [];
}

class InitialNursesState extends NursesState {}

class NursesLoading extends NursesState {}

class NursesLoaded extends NursesState {
  final List<Personal> nurses;

  NursesLoaded({
    @required this.nurses,
  });

  @override
  List<Object> get props => [nurses];
}
