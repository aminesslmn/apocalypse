// import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class AuthProvider with ChangeNotifier {
  // //final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  // User? _user;

  // User? get user => _user;

  // AuthProvider() {
  //   _firebaseAuth.authStateChanges().listen(_onAuthStateChanged);
  // }

  // Future<void> signInWithEmailAndPassword(String email, String password) async {
  //   try {
  //     await _firebaseAuth.signInWithEmailAndPassword(
  //         email: email, password: password);
  //   } catch (e) {
  //     rethrow;
  //   }
  // }

  // Future<void> createUserWithEmailAndPassword(
  //     String email, String password) async {
  //   try {
  //     await _firebaseAuth.createUserWithEmailAndPassword(
  //         email: email, password: password);
  //   } catch (e) {
  //     rethrow;
  //   }
  // }

  // Future<void> signOut() async {
  //   await _firebaseAuth.signOut();
  // }

  // void _onAuthStateChanged(User? firebaseUser) {
  //   _user = firebaseUser;
  //   notifyListeners();
  // }
}
