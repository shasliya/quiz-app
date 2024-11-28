import 'dart:async';
import 'package:firebase_auth/firebase_auth.dart';

class fireHelper{
  final FirebaseAuth auth=FirebaseAuth.instance;
  get user=>auth.currentUser;

  Future<String?>signUp({required String remail,required String rpassword})async{
    try {
      final credential = await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: remail,
        password: rpassword,
      );
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        print('The password provided is too weak.');

      } else if (e.code == 'email-already-in-use') {
        print('The account already exists for that email.');
      }
    } catch (e) {
      print(e);
    }
  }

  Future<String?>signIn({required String remail,required String rpassword})async{
    try{
      await FirebaseAuth.instance.signInWithEmailAndPassword(
          email: remail, password: rpassword);
      return null;
    }
    on
      FirebaseAuthException catch(e){
        if(e.code=='user not fount'){
          print('no user found for that email');
        }
        else
          if(e.code=='wrong password')
            {
        print('password is mismatched!');
    }
          return e.message;
  }

}}