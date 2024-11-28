import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fairbaseeg/firebase/authenticationfirebase.dart';
import 'package:fairbaseeg/firebase/loginpage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

class regfirecurd extends StatefulWidget {
  const regfirecurd({Key? key}) : super(key: key);

  @override
  State<regfirecurd> createState() => _regfirebase();
}

class _regfirebase extends State<regfirecurd> {
  late CollectionReference userCollection;
  GlobalKey<FormState> formkey = GlobalKey();
  bool showpass = true;

  TextEditingController cname = TextEditingController();
  TextEditingController cemail = TextEditingController();
  TextEditingController cpass = TextEditingController();

  @override
  void initState() {
    userCollection = FirebaseFirestore.instance.collection("logindeatails");
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
        key: formkey,
        child: Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Text(
                  "REGISTRATION PAGE",
                  style: TextStyle(fontSize: 30, color: Colors.blue[900]),
                ),
              ),

              Padding(
                padding: EdgeInsets.all(8.0),
                child: TextFormField(
                  controller: cname,
                  decoration: InputDecoration(
                      labelText: 'username ',
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(30))),
                  validator: (username) {
                    if (username == null) {
                      return "user name is empty";
                    } else {
                      return null;
                    }
                  },
                  // onSaved: (esaved) {
                  //   // cname = esaved;
                  // },
                ),
              ),

              Padding(
                padding: EdgeInsets.all(8.0),
                child: TextFormField(
                  controller: cemail,
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
                  },
                  // onSaved: (esaved) {
                  //   // cemail = esaved;
                  // },
                ),
              ),
              Padding(
                padding: EdgeInsets.all(8.0),
                child: TextFormField(
                  controller: cpass,
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

                ),
              ),


              Padding(
                padding: const EdgeInsets.all(8.0),
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blue[900]),
                  onPressed: () async {
                    await addUserToDB(
                        cname.text.trim(),
                        cemail.text.trim(),
                        cpass.text.trim(),
                        );
                    Navigator.of(context).pop();


                  },

                  child: Text(
                    'REGISTER',
                    style: TextStyle(
                      fontSize: 15,
                      color: Colors.white,
                    ),
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


  Future<void> addUserToDB(String addname, String addemail, String addpassword) async {
    if (addname.isNotEmpty && addemail.isNotEmpty && addpassword.isNotEmpty) {
      await userCollection.add(
          {'name': addname, 'email': addemail, 'password': addpassword}).then((value) {
        print("User added successfully");
        cname.clear();
        cemail.clear();
        cpass.clear();
        Navigator.of(context).pop();
      }).catchError((error) {
        print("Failed to add data: $error");
      });
    } else {
      print("Please enter both name and email.");
    }
  }

  Stream<QuerySnapshot> readUser() {
    return userCollection.snapshots();
  }
}
