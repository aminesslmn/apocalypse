import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class DoctorAuthProvider with ChangeNotifier {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  User? _doctorUser;
  String? _status; // "pending", "accepted", "rejected"
  bool _isLoading = false;
  String? _error;

  User? get doctorUser => _doctorUser;
  String? get status => _status;
  bool get isLoading => _isLoading;
  String? get error => _error;

  DoctorAuthProvider() {
    _firebaseAuth.authStateChanges().listen(_onAuthStateChanged);
  }

  void _onAuthStateChanged(User? firebaseUser) async {
    _doctorUser = firebaseUser;
    if (_doctorUser != null) {
      await _loadDoctorStatus();
    }
    notifyListeners();
  }

  Future<void> _loadDoctorStatus() async {
    if (_doctorUser != null) {
      DocumentSnapshot doc = await _firestore.collection('doctors').doc(_doctorUser!.uid).get();
      if (doc.exists) {
        _status = doc['status']; // Assuming 'status' is stored in Firestore
        notifyListeners();
      }
    }
  }

  Future<void> signInAsDoctor(String email, String password) async {
    _setLoading(true);
    try {
      UserCredential userCredential = await _firebaseAuth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      _doctorUser = userCredential.user;
      await _loadDoctorStatus();
      _setError(null);
    } catch (e) {
      _setError(e.toString());
    } finally {
      _setLoading(false);
    }
  }

  Future<void> registerDoctor(String email, String password, Map<String, dynamic> doctorDetails) async {
    _setLoading(true);
    try {
      UserCredential userCredential = await _firebaseAuth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );
      _doctorUser = userCredential.user;

      if (_doctorUser != null) {
        await _firestore.collection('doctors').doc(_doctorUser!.uid).set({
          ...doctorDetails,
          'status': 'pending', // default status: pendiiing
        });
        await _loadDoctorStatus();
      }

      _setError(null);
    } catch (e) {
      _setError(e.toString());
    } finally {
      _setLoading(false);
    }
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
