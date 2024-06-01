import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutterproject/auth/signup.dart';
import 'package:flutterproject/categories/add.dart';
import 'package:flutterproject/checkout.dart';
import 'package:flutterproject/filter.dart';
import 'package:flutterproject/homepage.dart';
import 'package:flutterproject/model/cart.dart';
import 'package:flutterproject/provider.dart';
import 'package:flutterproject/products.dart';
import 'package:provider/provider.dart';
import 'firebase_options.dart';

// Pages :
import 'package:flutterproject/auth/login.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    FirebaseAuth.instance.authStateChanges().listen((User? user) {
      if (user == null) {
        print("------------- signed out");
      } else {
        print("------------- signed in");
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
        create: (context) => Cart(),
        child: MaterialApp(
          theme: ThemeData(
            appBarTheme: AppBarTheme(
              titleTextStyle: TextStyle(
                  color: Colors.blue,
                  fontSize: 20,
                  fontWeight: FontWeight.bold),
              backgroundColor: Colors.grey[50],
              elevation: 5,
              shadowColor: Colors.black.withOpacity(.9),
              iconTheme: IconThemeData(color: Colors.blue),
            ),
          ),
          home: (FirebaseAuth.instance.currentUser != null &&
                  FirebaseAuth.instance.currentUser!.emailVerified)
              ? TestProvider()
              // HomePage()
              : Login(),
          // FilterPage()
          routes: {
            "home": (context) => const HomePage(),
            "login": (context) => const Login(),
            "register": (context) => const SignUp(),
            "addCategory": (context) => const AddCategory(),
            "filterPage": (context) => const FilterPage(),
            "providerPage": (context) => const MyProvider(),
            "checkoutPage": (context) => const CheckOut(),
          },
        ));
  }
}
