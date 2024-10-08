import 'package:apocalypsea2sv/features/doctor/views/account_not_accepted.dart';
import 'package:apocalypsea2sv/features/doctor/views/account_pending.dart';
import 'package:apocalypsea2sv/features/doctor/views/home_verified.dart';

import 'package:apocalypsea2sv/features/feed/views/login_page.dart';
import 'package:apocalypsea2sv/features/feed/views/register_page.dart';
import 'package:apocalypsea2sv/features/feed/views/welcome_page.dart';
import 'package:apocalypsea2sv/features/feed/views/register_details.dart';
import 'package:apocalypsea2sv/features/profile/profile.dart';
import 'package:apocalypsea2sv/firebase_options.dart';
import 'package:apocalypsea2sv/providers/auth_provider.dart';
import 'package:apocalypsea2sv/providers/doctor_auth_provider.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'features/feed/views/home_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider<AuthProvider>(
          create: (_) => AuthProvider(),
        ),
        ChangeNotifierProvider<DoctorAuthProvider>(
          create: (_) => DoctorAuthProvider(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: const AppWrapper(),
        routes: {
          '/welcome': (context) => const WelcomePage(),
          '/register': (context) => const RegisterScreen(),
          '/register-details': (context) => const RegisterDetailsScreen(),
          '/home': (context) => const HomePage(),
          '/login': (context) => const LoginScreen(),
          '/profile': (context) => const ProfilePage(),
        },
      ),
    );
  }
}

class AppWrapper extends StatelessWidget {
  const AppWrapper({super.key});

  @override
  Widget build(BuildContext context) {
    final authProvider = Provider.of<AuthProvider>(context);
    final doctorAuthProvider = Provider.of<DoctorAuthProvider>(context);

    if (doctorAuthProvider.doctorUser != null) {
      switch (doctorAuthProvider.status) {
        case 'pending':
          return const AccountPending();
        case 'accepted':
          return const HomeVerified();
        case 'rejected':
          return const AccountNotAccepted();
        default:
          return const WelcomePage();
      }
    } else if (authProvider.user != null) {
      return const HomePage();
    } else {
      return const WelcomePage();
    }
  }
}
