import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:messenger/model/user_model.dart';
import 'package:messenger/service/token_service.dart';

class HomeService {
  static Future<void> sendMessage(String sms) async {
    final sender = FirebaseAuth.instance.currentUser;
    if (sender != null) {
      final db = FirebaseFirestore.instance;
      final UserModel userModel = UserModel(
        user: sender.email!,
        sms: sms,
        dateTime: DateTime.now(),
      );
      await db.collection('messages').add(userModel.toJson());
    }
  }

  static Stream<QuerySnapshot<Map<String, dynamic>>> streamMessage() {
    final db = FirebaseFirestore.instance;
    return db
        .collection('messages')
        .orderBy('dateTime', descending: true)
        .snapshots();
  }

  Future delete(String password) async {
    try {
      final user = FirebaseAuth.instance.currentUser;
      var credential =
          EmailAuthProvider.credential(email: user!.email!, password: password);
      await user.reauthenticateWithCredential(credential);
      await user.delete();
      await TokenService().removeData();
    } catch (e) {
      print(e);
    }
  }
}
