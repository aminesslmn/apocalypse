import 'package:apocalypsea2sv/diagnosis/pages/page.dart';
import 'package:apocalypsea2sv/features/feed/views/login_page.dart';
import 'package:apocalypsea2sv/features/feed/views/register_page.dart';
import 'package:apocalypsea2sv/features/feed/views/welcome_page.dart';
import 'package:apocalypsea2sv/features/feed/views/register_details.dart';
import 'package:apocalypsea2sv/firebase_options.dart';
import 'package:apocalypsea2sv/providers/auth_provider.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'features/feed/views/home_page.dart'; // Assuming your HomePage view is located here
// Assuming your UI colors are defined here

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
          )
        ],
        child: MaterialApp(
          home: const AppWrapper(),
          routes: {
            '/welcome': (context) => const WelcomePage(),
            '/register': (context) => const RegisterScreen(),
            '/register-details': (context) => const RegisterDetailsScreen(),
            '/home': (context) => const HomePage(),
            '/login': (context) => const LoginScreen(),
          },
        ));
  }
}

class AppWrapper extends StatelessWidget {
  const AppWrapper({super.key});

  @override
  Widget build(BuildContext context) {
    final authProvider = Provider.of<AuthProvider>(context);

    if (authProvider.user != null) {
      return const HomePage();
    } else {
      return const WelcomePage();
    }
  }
}
