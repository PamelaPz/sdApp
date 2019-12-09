import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:meta/meta.dart';

class Patient {
  final String name;
  final bool accepted;
  final String observations;
  final String idFamily;
  final String idPatients;

  Patient({
    @required this.name,
    @required this.observations,
    @required this.accepted,
    this.idFamily,
    this.idPatients,
  });

  factory Patient.fromData(DocumentSnapshot map) => Patient(
        name: map['name'],
        observations: map['observations'],
        accepted: map['accepted'],
      );
}
