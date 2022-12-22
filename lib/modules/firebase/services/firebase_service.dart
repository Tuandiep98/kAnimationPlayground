import 'dart:convert';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

import '../../../utils/storage_manager.dart';
import 'ifirebase_service.dart';

class FirebaseService implements IFirebaseService {
  // final FirebaseAuth _auth = FirebaseAuth.instance;
  final GoogleSignIn _googleSignIn = GoogleSignIn(
    clientId:
        '1053757662020-tt5v67b8bj07picoefioj5p2gaknnqg4.apps.googleusercontent.com',
    scopes: [
      'email',
      'https://www.googleapis.com/auth/contacts.readonly',
    ],
  );

  @override
  Future<UserInfo?> registerWithEmailPassword(
      String email, String password) async {
    // Initialize Firebase
    // await Firebase.initializeApp();
    UserInfo? user;

    // try {
    //   var userCredential = await _auth.createUserWithEmailAndPassword(
    //     email: email,
    //     password: password,
    //   );

    //   user = userCredential;

    //   if (user != null) {
    //     // uid = user.uid;
    //     // userEmail = user.email;
    //   }
    // } catch (e) {
    //   print(e);
    // }

    return user;
  }

  @override
  Future<UserInfo?> signInWithEmailPassword(
      String email, String password) async {
    // await Firebase.initializeApp();
    UserInfo? user;

    // try {
    //   var userCredential = await _auth.signInWithEmailAndPassword(
    //     email: email,
    //     password: password,
    //   );
    //   user = userCredential;

    //   if (user != null) {
    //     // uid = user.uid;
    //     // userEmail = user.email;

    //     await StorageManager.saveData('auth', true);
    //   }
    // } on AuthException catch (e) {
    //   if (e.code == 'user-not-found') {
    //     print('No user found for that email.');
    //   } else if (e.code == 'wrong-password') {
    //     print('Wrong password provided.');
    //   }
    // }

    return user;
  }

  @override
  Future<String> signOut() async {
    // await _auth.signOut();
    await _googleSignIn.disconnect();
    // StorageManager.saveData('auth', false);

    // uid = null;
    // userEmail = null;

    return 'User signed out';
  }

  @override
  Future<GoogleSignInAccount?> signInWithGoogle() async {
    // Initialize Firebase
    // await Firebase.initializeApp();
    GoogleSignInAccount? account;
    try {
      account = await getCurrentUser();
      if (account == null) {
        account = await _googleSignIn.signIn();
      }
      StorageManager.saveJsonData('auth', jsonEncode(account));
    } catch (error) {
      print(error);
    }

    return account;
  }

  @override
  Future<GoogleSignInAccount?> getCurrentUser() async {
    var signed = await _googleSignIn.isSignedIn();
    if (signed) return _googleSignIn.currentUser;
    return null;
  }
}
