import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:sd_app/app/models/Personal.dart';
import 'package:meta/meta.dart';

class PersonalRepository {
  Firestore firestore = Firestore.instance;

  Future<List<Personal>> getPersonal({@required String idPersonalType}) async {
    QuerySnapshot snapshot = await firestore
        .collection('personal')
        .where('id_personaltype', isEqualTo: idPersonalType)
        .getDocuments();

    List<Personal> personal = snapshot.documents.map((doc) {
      Personal personal = Personal.fromDocumentSnapshot(doc);
      personal.uid = doc.documentID;

      return personal;
    }).toList();

    return personal;
  }
}
