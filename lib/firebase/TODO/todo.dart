import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fairbaseeg/firebase/TODO/updatepage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class todofirebase extends StatefulWidget {
  const todofirebase({Key? key}) : super(key: key);

  @override
  State<todofirebase> createState() => _todolistState();
}

class _todolistState extends State<todofirebase> {
  late CollectionReference usercollection;

  @override
  void initState() {
    usercollection = FirebaseFirestore.instance.collection('users');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("To do list"),
      ),
      body: StreamBuilder<QuerySnapshot>(
          stream: readUser(),
          builder: (context, snapshot) {
            if (snapshot.hasError) {
              return Center(
                child: Text('error ${snapshot.error}'),
              );
            }
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
            final calldocs = snapshot.data!.docs;
            return ListView.builder(
              itemCount: calldocs.length,
              itemBuilder: (context, index) {
                final fetchdatas = calldocs[index];
                final dataid = fetchdatas.id;
                final dataname = fetchdatas['name'];
                // final dataemail = fetchdatas['email'];
                print(fetchdatas['info']);
                return ListTile(
                  title: Text(
                    '$dataname',
                    style: TextStyle(fontSize: 20),
                  ),
                  // subtitle: Text(
                  //   '$dataid',
                  //   style: TextStyle(fontSize: 20),
                  // ),
                  trailing: SizedBox(
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        IconButton(onPressed: () {
                         editUserData('userId');
                        }, icon: Icon(Icons.edit)),
                        IconButton(onPressed: () {}, icon: Icon(Icons.delete)),
                      ],
                    ),
                  ),
                );
              },
            );
          }),
      floatingActionButton: FloatingActionButton(
        onPressed: () => addform(),
        child: Text("add"),
      ),
    );
  }

  Future<void> addUsertoDB(String name, String email) async {
    return usercollection.add({'name': name,'email': email}).then((Value) {
      print('user added successfully');
      nameController.clear();
      detailsController.clear();
      Navigator.of(context).pop();
    }).catchError((error) {
      print('failed to add user $error');
    });
  }

  Stream<QuerySnapshot> readUser() {
    return usercollection.snapshots();
  }

  TextEditingController nameController = TextEditingController();
  TextEditingController detailsController = TextEditingController();

  addform() async {
    showModalBottomSheet(
        isScrollControlled: true,
        context: context,
        builder: (context) {
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
                    controller: detailsController,
                    decoration: InputDecoration(
                        hintText: "datails",
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10)))),
                ElevatedButton(
                    onPressed: () => addUsertoDB(
                        nameController.text, detailsController.text),
                    child: const Text('Create text')),
              ],
            ),
          );
        });
  }
  TextEditingController unameController = TextEditingController();
  TextEditingController uemailController = TextEditingController();
  void editUserData(var userId){
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
                    controller: unameController,
                    decoration: InputDecoration(
                        hintText: "name",
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10)))),
                TextField(
                    controller: uemailController,
                    decoration: InputDecoration(
                        hintText: "email",
                        border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10)))),
                ElevatedButton(
                    onPressed: () {
                      upadateUser(
                          userId,unameController.text,uemailController.text);
                      unameController.clear();
                      uemailController.clear();
                      Navigator.of(context).pop();

                    },
                    child: const Text('Update user')),
              ],
            ),
          );
        });
  }

  Future<void> upadateUser(String userId, String uname, String uemail) async {
    var updatedvalues = {
      'name': uname,
      'detailss': uemail
    };
    return usercollection.doc(userId).update(updatedvalues).then((value) {
      print('user data updated successfully');
    }).catchError((error) {
      print('user not updated');
    });
  }

  }
