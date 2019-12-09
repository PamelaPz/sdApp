import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:meta/meta.dart';
import 'package:sd_app/app/models/Patient.dart';

class Entry {
  final String name;
  final bool accepted;
  final String observations;
  final String idFamily;
  final String idPatients;
  final String idPersonal;
  final String uid;

  Patient _patient;

  Entry({
    @required this.uid,
    @required this.name,
    @required this.observations,
    @required this.accepted,
    @required this.idFamily,
    @required this.idPatients,
    @required this.idPersonal,
  });

  set patient(Patient patient) {
    this.patient = _patient;
  }

  Patient get patient {
    return this._patient;
  }

  factory Entry.fromDocumentSnapshot(DocumentSnapshot map) {
    print(map['uid']);
    return Entry(
      uid: map['uid'],
      name: map['name'],
      observations: map['observations'],
      accepted: map['accepted'],
      idFamily: map['id_family'],
      idPatients: map['id_patients'],
      idPersonal: map['id_personal'],
    );
  }

  @override
  String toString() {
    return "$uid";
  }
}
