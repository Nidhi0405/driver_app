import 'dart:developer';

import 'package:driver_app/view/authScreens/mobileLoginScreen.dart';
import 'package:driver_app/view/authScreens/otpScreen.dart';
import 'package:driver_app/view/bottomNavigationBar/bottomNavigationBar.dart';
import 'package:driver_app/view/signInLogicScreen/signInLogicScreen.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';
import 'package:provider/provider.dart';

import '../../../constant/constant.dart';
import '../../provider/authProvider/mobileAuthProvider.dart';

class MobileAuthServices{
  static bool checkAuthentication(BuildContext context){
    User? user = auth.currentUser; // can be managed from preference (local  storage) as to check if user is signed in or not
    if(user == null){
      Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(
              builder: (context)=> const MobileLoginScreen()),
          (route)=> false);
      return false;
    }
    Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(
            builder: (context)=> const BottomNavigationBarUberEats()),
            (route)=> false);
    return true;
  }

  static receiveOTP({required BuildContext context, required String mobileNo}) async {
    try{
      Navigator.push(
        context,
        PageTransition(
          child: const OTPScreen(),
          type: PageTransitionType.rightToLeft,
        ),);
      /*await auth.verifyPhoneNumber(
          phoneNumber: mobileNo,
          verificationCompleted: (PhoneAuthCredential credentials){
            log(credentials.toString());
          },
          verificationFailed: (FirebaseAuthException exception){
            log(exception.toString());
            throw Exception(exception);
          },
          codeSent: (String verificationID, int? resendToken){
            context.read<MobileAuthProvider>().updateVerificationID(verificationID);
            Navigator.push(
              context,
              PageTransition(
                child: const OTPScreen(),
                type: PageTransitionType.rightToLeft,
              ),);
          },
          codeAutoRetrievalTimeout: (String verificationID){

          },
      );*/
    } catch(e){
      log(e.toString());
      throw Exception(e);
    }
  }

  static verifyOTP({required BuildContext context, required String otp}) async{
    try{
      AuthCredential credential = PhoneAuthProvider.credential(
        verificationId: context.read<MobileAuthProvider>().verificationID!,
        smsCode: otp,
      );
      await auth.signInWithCredential(credential);
      Navigator.push(
        context,
        PageTransition(
          child: const SignInLogicScreen(),
          type: PageTransitionType.rightToLeft,
        ),);
    }catch(e){
      log(e.toString());
      throw Exception(e);
    }
  }

}