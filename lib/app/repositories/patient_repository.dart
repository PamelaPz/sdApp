import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:sd_app/app/models/Patient.dart';

class PatientRepositiry {
  final Firestore firestore = Firestore.instance;

  Future<List<Patient>> getPatients() async {
    QuerySnapshot snapshot = await firestore.collection('entry').getDocuments();

    Iterable<Patient> patients =
        snapshot.documents.map((doc) => Patient.fromData(doc));

    return patients.toList();
  }
}
