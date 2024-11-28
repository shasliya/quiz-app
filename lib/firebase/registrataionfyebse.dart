
import 'package:fairbaseeg/firebase/authenticationfirebase.dart';
import 'package:fairbaseeg/firebase/loginpage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

class regfirebase extends StatefulWidget {
  const regfirebase({Key? key}) : super(key: key);

  @override
  State<regfirebase> createState() => _regfirebase();
}

class _regfirebase extends State<regfirebase> {
  GlobalKey<FormState>formkey = GlobalKey();
  bool showpass = true;
  String? cname;
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
                child: Text("REGISTRATION PAGE", style: TextStyle(fontSize: 30,color: Colors.blue[900]),
        ),
              ),


              Padding(
                padding: EdgeInsets.all(8.0),
                child: TextFormField(
                  decoration: InputDecoration(
                      labelText: 'username ',
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30))),
                  validator: (username) {
                    if (username ==null) {
                      return "user name is empty";
                    } else {
                      return null;
                    }
                  },onSaved: (esaved)
                {
                  cname=esaved;

                },
                ),),

              Padding(
                padding: EdgeInsets.all(8.0),
                child: TextFormField(
                  decoration: InputDecoration(
                    prefixIcon: Icon(Icons.email),
                      labelText: 'email ',
                      labelStyle: TextStyle(fontSize: 20),
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
                  },onSaved: (esaved)
                {
                  cemail=esaved;

                },
                ),),
              Padding(
                padding: EdgeInsets.all(8.0),
                child: TextFormField(
                  obscureText: showpass,
                  obscuringCharacter: "*",
                  decoration: InputDecoration(
                      prefixIcon: Icon(Icons.password),
                      suffixIcon: IconButton(
                        icon: Icon(showpass
                            ? Icons.visibility_off
                            : Icons.visibility),
                        onPressed: () {
                          setState(() {
                            showpass = !showpass;
                          });
                        },
                      ),
                      labelText: 'password',
                      labelStyle: TextStyle(fontSize: 20),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30))),
                  validator: (pass) {
                    if (pass == null || pass.length < 6) {
                      return "incorrect password";
                    } else {
                      return null;
                    }
                  },
                  onSaved: (esaved)
                  {
                    cpass=esaved;
                  },
                ),
              ),
              //SizedBox(height: 20,),

              Padding(
                padding: const EdgeInsets.all(8.0),
                child: ElevatedButton(
                   style: ElevatedButton.styleFrom(backgroundColor: Colors.blue[900]),
                  onPressed: () async {
                    if(formkey.currentState!.validate()){
                      formkey.currentState!.save();
                     String? result= await fireHelper().signUp(remail: cemail!, rpassword: cpass!);{
                        if (result==null) {
                          Get.to(()=>loginfirebase());
                        }
                        else
                          {
                            Get.snackbar('error', result);

                          }
                      };
                    }
                  }, child: Text('REGISTER', style: TextStyle(fontSize: 15,color: Colors.white,),
              ),
                ),
              ),
              Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: TextButton(
                    onPressed: () async {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => loginfirebase()));
                    },
                    child: Text("Already have an account?"),
                  )),
            ],
          ),
        ),
      ),
    );
  }
}