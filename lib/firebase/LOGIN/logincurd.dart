import 'package:fairbaseeg/firebase/registrataionfyebse.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

import '../authenticationfirebase.dart';
import '../homepagefire.dart';


class loginfirebase extends StatefulWidget {
  const loginfirebase({Key? key}) : super(key: key);

  @override
  State<loginfirebase> createState() => _loginhiveState();
}

class _loginhiveState extends State<loginfirebase> {
  GlobalKey<FormState> formkey = GlobalKey();
  bool showpass = true;
  String? cemail;
  String? cpass;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Form(
          key: formkey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Text("LOGIN PAGE",
                  style: TextStyle(fontSize: 30,color: Colors.blue[900]),),

              ),

              Padding(
                padding: EdgeInsets.all(8.0),
                child: TextFormField(
                  decoration: InputDecoration(
                      labelText: 'email ',
                      labelStyle: TextStyle(fontSize: 20),
                      prefixIcon: Icon(Icons.email),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30))),
                  validator: (email) {
                    if (email == null ||
                        !email.contains('@') ||
                        !email.contains('.')) {
                      return "Enter a valid email";
                    } else {
                      return null;
                    }
                  },
                  onSaved: (esaved) {
                    cemail = esaved;
                  },
                ),
              ),
              Padding(
                padding: EdgeInsets.all(8.0),
                child: TextFormField(
                  obscureText: showpass,
                  obscuringCharacter: "*",
                  decoration: InputDecoration(
                      labelStyle: TextStyle(fontSize: 20),
                      prefixIcon: Icon(Icons.password),
                      suffixIcon: IconButton(
                        icon: Icon(
                            showpass ? Icons.visibility_off : Icons.visibility),
                        onPressed: () {
                          setState(() {
                            showpass = !showpass;
                          });
                        },
                      ),
                      labelText: 'password',
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30))),
                  validator: (pass) {
                    if (pass == null || pass.length < 6) {
                      return "incorrect password";
                    } else {
                      return null;
                    }
                  },
                  onSaved: (esaved) {
                    cpass = esaved;
                  },
                ),
              ),
              //SizedBox(height: 20,),

              Padding(
                padding: const EdgeInsets.all(8.0),
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(backgroundColor: Colors.blue[900]),
                  onPressed: () async {
                    if (formkey.currentState!.validate()) {
                      formkey.currentState!.save();
                      fireHelper().signIn(remail: cemail!!, rpassword: cpass!).then((value)
                      {
                        if(value==null)
                        {
                          Get.to(()=>homepagefire());
                        }
                        else{
                          Get.snackbar('error', value);
                        }
                      });
                    }
                  },
                  child: Text('LOGIN',style: TextStyle(fontSize: 15,color: Colors.white),),
                ),
              ),
              Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: TextButton(
                    onPressed: () async {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => regfirebase()));
                    },
                    child: Text("Create new account"),
                  )),
            ],
          ),
        ),
      ),
    );
  }
}