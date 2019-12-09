import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:sd_app/app/models/Entry.dart';

class PatientRepositiry {
  final Firestore firestore = Firestore.instance;

  Future<List<Entry>> getEntries() async {
    QuerySnapshot snapshot = await firestore.collection('entry').getDocuments();

    List<Entry> entries = snapshot.documents
        .map((doc) => Entry.fromDocumentSnapshot(doc))
        .toList();

    return entries;
  }
}
