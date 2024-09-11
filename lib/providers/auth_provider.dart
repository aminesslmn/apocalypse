import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthProvider with ChangeNotifier {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
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

   bool _isLoggedIn = false;

  bool get isLoggedIn => _isLoggedIn;

  AuthProvider() {
    loadUserFromPreferences();
    _firebaseAuth.authStateChanges().listen(_onAuthStateChanged);
    _loadLoginStatus();

    
  }

    Future<void> _loadLoginStatus() async {
    final prefs = await SharedPreferences.getInstance();
    _isLoggedIn = prefs.getBool('isLoggedIn') ?? false;
    notifyListeners();
  }

  Future<void> login() async {
    // Simulate a login operation
    _isLoggedIn = true;
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool('isLoggedIn', _isLoggedIn);
    notifyListeners();
  }

  Future<void> logout() async {
    _isLoggedIn = false;
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool('isLoggedIn', _isLoggedIn);
    notifyListeners();
  }

  // i am saving to preferences when i submit the form temporary(this function may not be working)
  void _onAuthStateChanged(User? firebaseUser) {
    _user = firebaseUser;
    if (_user != null) {
      saveUserToPreferences(email: userEmail, fullName: userName);
      print("user saved to preferences");
    } else {
      _clearUserPreferences();
      print("user cleared from preferences");
    }
    notifyListeners();
  }

  Future<void> signInWithEmailAndPassword(String email, String password) async {
    _setLoading(true);
    try {
      UserCredential userCredential = await _firebaseAuth
          .signInWithEmailAndPassword(email: email, password: password);
      _user = userCredential.user;
      await _loadUserDetails();
      _setError(null);
    } catch (e) {
      _setError(e.toString());
    } finally {
      _setLoading(false);
    }
  }

  //added temporary
  String get userName => _fullName ?? 'Default name';
  String get userEmail => _email ?? 'Default email';

  Future<void> createUserWithEmailAndPassword(
      String email, String password) async {
    _setLoading(true);
    try {
      UserCredential userCredential = await _firebaseAuth
          .createUserWithEmailAndPassword(email: email, password: password);
      _user = userCredential.user;

      if (_user != null) {
        await _firestore.collection('users').doc(_user!.uid).set({
          'fullName': _fullName,
          'age': _age,
          'gender': _gender,
          'healthCondition': _healthCondition,
          'allergy': _allergy,
        });
        await saveUserToPreferences(email: userEmail, fullName: userName);
      }

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

   Future<void> saveUserToPreferences({
    required String email,
    required String fullName,
    // required String age,
    // required String gender,
    // required String healthCondition,
    // required String allergy,
  }) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('email', email);
    await prefs.setString('fullName', fullName);
    // await prefs.setString('age', age);
    // await prefs.setString('gender', gender);
    // await prefs.setString('healthCondition', healthCondition);
    // await prefs.setString('allergy', allergy);
      print('User saved to preferences: email=$email, fullName=$fullName');
  }

  Future<void> loadUserFromPreferences() async {
    final prefs = await SharedPreferences.getInstance();
    _email = prefs.getString('email');
    _fullName = prefs.getString('fullName');
    _age = prefs.getString('age');
    _gender = prefs.getString('gender');
    _healthCondition = prefs.getString('healthCondition');
    _allergy = prefs.getString('allergy');

    if (_email != null && _fullName != null) {
      _user = FirebaseAuth.instance.currentUser;
    }
    // Debuggiiiiiiiiiiiiiiing
    print('Loaded user from preferences: email=$_email, fullName=$_fullName');
    notifyListeners();
}


  Future<void> _clearUserPreferences() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove('email');
    await prefs.remove('fullName');
    await prefs.remove('age');
    await prefs.remove('gender');
    await prefs.remove('healthCondition');
    await prefs.remove('allergy');
  }

Future<void> _loadUserDetails() async {
    if (_user != null) {
        DocumentSnapshot doc = await _firestore.collection('users').doc(_user!.uid).get();
        if (doc.exists) {
            final data = doc.data() as Map<String, dynamic>;
            _fullName = data['fullName'];
            _email = data['email'];
            // temporary: add other felds to looooooooooooooooad
            _age = data['age'];
            _gender = data['gender'];
            _healthCondition = data['healthCondition'];
            _allergy = data['allergy'];
            notifyListeners();
        }
    }
}






  Map<String, dynamic> toJson() {
    return {
      'email': _email,
      'fullName': _fullName,
      'age': _age,
      'gender': _gender,
      'healthCondition': _healthCondition,
      'allergy': _allergy,
    };
  }
}