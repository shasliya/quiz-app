import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'homepagefire.dart';

class phonefire extends StatefulWidget {
  const phonefire({super.key});

  @override
  State<phonefire> createState() => _phonefireState();
}

class _phonefireState extends State<phonefire> {
  TextEditingController phoneController = TextEditingController();
  TextEditingController otpController = TextEditingController();
  FirebaseAuth auth = FirebaseAuth.instance;
  User? user;
  String verificationID = '';
  bool otpVisibilty = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('firebase auth'),),
      body: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: phoneController,
              decoration: InputDecoration(
                  prefixIcon: Icon(Icons.call),
                  hintText: 'Phone number',
                  prefix: Padding(padding: EdgeInsets.all(10),
                    child: Text('+91'),),
                  labelStyle: TextStyle(fontSize: 20),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30))
              ),
            ),

            Visibility(
              child: TextField(
                controller: otpController,
                decoration: InputDecoration(
                    prefixIcon: Icon(Icons.message),
                    hintText: 'Verify OTP',
                    prefix: Padding(padding: EdgeInsets.all(10),
                      child: Text(' '),),
                    labelStyle: TextStyle(fontSize: 20),
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30))
                ),
                maxLength: 6,
                keyboardType: TextInputType.number,
              ),
              visible: otpVisibilty,
            ),
            SizedBox(height: 10,),
            MaterialButton(
                child: Text(otpVisibilty ? 'verify?' : 'login',
                    style: TextStyle(fontSize: 15)),

                onPressed: () {
                  if (otpVisibilty) {
                    verifyOTP();
                  }
                  else {
                    loginWithPhone();
                  }
                }
            )
          ],
        ),
      ),
    );
  }

  void verifyOTP() async {
    PhoneAuthCredential credentials = PhoneAuthProvider.credential(
        verificationId: verificationID, smsCode: otpController.text);
    await auth.signInWithCredential(credentials).then((Value) {
      setState(() {
        user = FirebaseAuth.instance.currentUser;
      });
    }).whenComplete(
            () {
          if (user != null) {
            Fluttertoast.showToast(
              msg: 'you are logged in successfuly',
              toastLength: Toast.LENGTH_SHORT,
              gravity: ToastGravity.BOTTOM,
              timeInSecForIosWeb: 1,
              backgroundColor: Colors.red,
              textColor: Colors.white,
              fontSize: 16,
            );
            Navigator.pushReplacement(context,
                MaterialPageRoute(builder: (context) => homepagefire()));
          }
          else {
            Fluttertoast.showToast(
              msg: 'your login is failed',
              toastLength: Toast.LENGTH_SHORT,
              gravity: ToastGravity.BOTTOM,
              timeInSecForIosWeb: 1,
              backgroundColor: Colors.red,
              textColor: Colors.white,
              fontSize: 16,
            );
          }
        }
    );
  }

  void loginWithPhone() async {
    auth.verifyPhoneNumber(
        phoneNumber: '+91' + phoneController.text,
        verificationCompleted: (PhoneAuthCredential credentials) async
        {
          await auth.signInWithCredential(credentials).then((Value) {
            print('you are logged in successfully');
          });
        },

        verificationFailed: (FirebaseAuthException e)
        {
          print(e.message);
        },
        codeSent:( String verifivationId,int? resendToken)
        {
          otpVisibilty:true;
          verificationID=verifivationId;
          setState(() {

          });

        },
        codeAutoRetrievalTimeout: (String verifivationId)
        {});

      {

      }
    }
  }

