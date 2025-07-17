import 'package:driver_app/controller/provider/authProvider/mobileAuthProvider.dart';
import 'package:driver_app/firebase_options.dart';
import 'package:driver_app/view/authScreens/mobileLoginScreen.dart';
import 'package:driver_app/view/authScreens/otpScreen.dart';
import 'package:driver_app/view/bottomNavigationBar/bottomNavigationBar.dart';
import 'package:driver_app/view/signInLogicScreen/signInLogicScreen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:driver_app/firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  runApp(UberEats());
}

class UberEats extends StatelessWidget {
  const UberEats({super.key});

  @override
  Widget build(BuildContext context) {
    return Sizer(builder: (context, _, __) {
      return MultiProvider(
        providers: [
          ChangeNotifierProvider<MobileAuthProvider>(create: (_) => MobileAuthProvider(),)
        ],
          child: MaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'Flutter Demo',
            theme: ThemeData(),
            home: SignInLogicScreen()),
      );

    });
  }
}

