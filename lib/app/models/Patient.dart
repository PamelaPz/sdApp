import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:meta/meta.dart';

class Patient {
  final String dateEgress;
  final String idPersonal;
  final String idStatus;
  final bool intership;
  final Firestore firestore = Firestore.instance;

  Patient({
    this.dateEgress,
    this.idPersonal,
    this.idStatus,
    this.intership,
  });

  Future<Patient> fromDocumentUID({@required String uid}) async {
    DocumentSnapshot document =
        await firestore.collection('patients').document(uid).get();

    return Patient.fromDocumentSnapshot(document);
  }

  factory Patient.fromDocumentSnapshot(DocumentSnapshot documentSnapshot) {
    return Patient(
      dateEgress: documentSnapshot['date_egress'],
      idPersonal: documentSnapshot['id_personal'],
      idStatus: documentSnapshot['id_status'],
      intership: documentSnapshot['intership'],
    );
  }
}
