import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class AuthProvider with ChangeNotifier {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  User? _user;
  String? _email;
  String? _fullName;
  String? _age;
  String? _gender;
  String? _password;
  String? _healthCondition;
  String? _allergy;
  bool _isLoading = false;
  String? _error;

  User? get user => _user;
  String? get email => _email;
  String? get fullName => _fullName;
  String? get age => _age;
  String? get gender => _gender;
  String? get healthCondition => _healthCondition;
  String? get allergy => _allergy;
  bool get isLoading => _isLoading;
  String? get password => _password;
  String? get error => _error;

  AuthProvider() {
    _firebaseAuth.authStateChanges().listen(_onAuthStateChanged);
  }

  void _onAuthStateChanged(User? firebaseUser) {
    _user = firebaseUser;
    notifyListeners();
  }

  Future<void> signInWithEmailAndPassword(String email, String password) async {
    _setLoading(true);
    try {
      await _firebaseAuth.signInWithEmailAndPassword(
          email: email, password: password);
      _setError(null);
    } catch (e) {
      _setError(e.toString());
    } finally {
      _setLoading(false);
    }
  }

  Future<void> createUserWithEmailAndPassword(
      String email, String password) async {
    _setLoading(true);
    try {
      UserCredential userCredential = await _firebaseAuth
          .createUserWithEmailAndPassword(email: email, password: password);
      _user = userCredential.user;
      _setError(null);
    } catch (e) {
      _setError(e.toString());
    } finally {
      _setLoading(false);
    }
  }

  void setUser(String email, String fullName, String password) {
    _email = email;
    _fullName = fullName;
    _password = password;
    notifyListeners();
  }

  void setUserDetails(
      String age, String gender, String healthCondition, String allergy) {
    _age = age;
    _gender = gender;
    _healthCondition = healthCondition;
    _allergy = allergy;
    notifyListeners();
  }

  void _setLoading(bool isLoading) {
    _isLoading = isLoading;
    notifyListeners();
  }

  void _setError(String? error) {
    _error = error;
    notifyListeners();
  }
}
