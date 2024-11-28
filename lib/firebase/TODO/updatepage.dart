import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class updatetodo extends StatefulWidget {
  const updatetodo({super.key});

  @override
  State<updatetodo> createState() => _updatetodoState();
}

class _updatetodoState extends State<updatetodo> {
  late CollectionReference usercollection;

  @override
  void initState() {
    usercollection = FirebaseFirestore.instance.collection('shasliya');
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("update list"),
      ),
    );
  }

  Future<void> addUsertoDB(String name, String email) async {
    return usercollection.add({'name': name,'info': email}).then((Value) {
      print('user added successfully');
      nameController.clear();
      emailController.clear();
      Navigator.of(context).pop();
    }).catchError((error) {
      print('failed to add user $error');
    });
  }

  Stream<QuerySnapshot> readUser() {
    return usercollection.snapshots();
  }
  TextEditingController nameController= TextEditingController();
  TextEditingController emailController= TextEditingController();
   void editUserData(String userId){
     showModalBottomSheet(
         context: context,
         isScrollControlled: true,
         elevation: 5,

         builder: (context)
     {
       return Container(
         padding: EdgeInsets.only(
             top: 10,
             left: 10,
             right: 10,
             bottom: MediaQuery.of(context).viewInsets.bottom + 120),
         child: Column(
           mainAxisSize: MainAxisSize.min,
           children: [
             TextField(
                 controller: nameController,
                 decoration: InputDecoration(
                     hintText: "name",
                     border: OutlineInputBorder(
                         borderRadius: BorderRadius.circular(10)))),
             TextField(
                 controller: emailController,
                 decoration: InputDecoration(
                     hintText: "email",
                     border: OutlineInputBorder(
                         borderRadius: BorderRadius.circular(10)))),
             ElevatedButton(
                 onPressed: () {
                   upadateUser(
                       userId,nameController.text,emailController.text);
                   nameController.clear();

                 },
                 child: const Text('Update user')),
           ],
         ),
       );
     });
   }

 Future<void> upadateUser(String userId, String uname, String uemail) async{
var updatedvalues={
  'name':uname,
  'email':uemail
};
return usercollection.doc(userId).update(updatedvalues).then((value){
  Navigator.of(context).pop();
  print('user data updated successfully');
}).catchError((error){
  print('user not updated');

});


  }
  // Future<void>deleteUser(var userId) async{
  //   return usercollection.doc(id).delete().then((value){
  //     ScaffoldMessenger.of(context).showSnackBar(
  //
  //     )
  //   })
  }

