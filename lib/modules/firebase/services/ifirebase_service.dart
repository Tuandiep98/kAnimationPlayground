import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

abstract class IFirebaseService {
  Future<UserInfo?> registerWithEmailPassword(String email, String password);
  Future<UserInfo?> signInWithEmailPassword(String email, String password);
  Future<String> signOut();
  Future<GoogleSignInAccount?> signInWithGoogle();
  Future<GoogleSignInAccount?> getCurrentUser();
}
