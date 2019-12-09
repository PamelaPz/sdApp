import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:meta/meta.dart';

class UserRepository {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final FlutterSecureStorage _secureStorage = FlutterSecureStorage();
  final Firestore _firestore = Firestore.instance;

  // sign in auth result
  Future<FirebaseUser> authenticate(
      {@required String email, @required String password}) async {
    AuthResult authResult = await _auth.signInWithEmailAndPassword(
        email: email, password: password);

    return authResult.user;
  }

  Future<DocumentSnapshot> getUserDocument({@required String uid}) async {
    return await _firestore.collection('personal').document(uid).get();
  }

  Future<void> setUid({@required String uid}) async {
    await _secureStorage.write(key: 'uid', value: uid);
  }

  Future<String> getUid() async {
    return await _secureStorage.read(key: 'uid');
  }

  Future<bool> hasUid() async {
    String uid = await this.getUid();

    return uid != null ? true : false;
  }

  Future<void> logout() async {
    await _secureStorage.delete(key: 'uid');

    _auth.signOut();
  }
}
