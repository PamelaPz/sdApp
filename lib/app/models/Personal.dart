import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:meta/meta.dart';

class Personal {
  final String email;
  final String idPersonalType;
  final String name;

  String uid;

  Personal({
    @required this.email,
    @required this.idPersonalType,
    @required this.name,
  });

  factory Personal.fromDocumentSnapshot(DocumentSnapshot documentSnapshot) {
    if (documentSnapshot.exists) {
      return Personal(
        email: documentSnapshot['email'],
        idPersonalType: documentSnapshot['id_personaltype'],
        name: documentSnapshot['name'],
      );
    } else {
      return Personal(
        email: 'Eliminado',
        name: 'Eliminado',
        idPersonalType: null,
      );
    }
  }
}
