import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'quizLoginpage.dart'; // Adjust the path as needed

class AdminPage extends StatefulWidget {
  const AdminPage({super.key});

  @override
  State<AdminPage> createState() => _AdminPageState();
}

class _AdminPageState extends State<AdminPage> {
  final CollectionReference usersCollection =
  FirebaseFirestore.instance.collection('users');

  // Fetch users from Firestore
  Future<List<Map<String, dynamic>>> fetchUsers() async {
    try {
      final querySnapshot = await usersCollection.get();
      return querySnapshot.docs
          .map((doc) => {'email': doc.id, ...doc.data() as Map<String, dynamic>})
          .toList();
    } catch (e) {
      print('Error fetching users: $e');
      return [];
    }
  }

  // Delete user from Firestore
  Future<void> deleteUser(String email) async {
    try {
      await usersCollection.doc(email).delete();
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
            'User $email deleted successfully.',
            style: GoogleFonts.poppins(),
          ),
          backgroundColor: Colors.green,
        ),
      );
    } catch (e) {
      print('Error deleting user: $e');
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
            'Error deleting user: $e',
            style: GoogleFonts.poppins(),
          ),
          backgroundColor: Colors.red,
        ),
      );
    }
  }

  // Display bottom sheet
  void showBottomSheet(String type) async {
    final usersData = await fetchUsers();

    showModalBottomSheet(
      isScrollControlled: false,
      context: context,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(25)),
      ),
      builder: (BuildContext context) {
        return DraggableScrollableSheet(
          initialChildSize: 0.7,
          minChildSize: 0.5,
          maxChildSize: 0.9,
          builder: (BuildContext context, ScrollController scrollController) {
            return Container(
              padding: const EdgeInsets.all(16),
              decoration: const BoxDecoration(
                color: Colors.black,
                borderRadius: BorderRadius.vertical(top: Radius.circular(25)),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    type,
                    style: GoogleFonts.poppins(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.green,
                    ),
                  ),
                  const Divider(thickness: 1, color: Colors.white),
                  Expanded(
                    child: usersData.isEmpty
                        ? Center(
                      child: Text(
                        'No users found',
                        style: GoogleFonts.poppins(
                          fontSize: 16,
                          color: Colors.white70,
                        ),
                      ),
                    )
                        : ListView.builder(
                      controller: scrollController,
                      itemCount: usersData.length,
                      physics: const BouncingScrollPhysics(), // Apply physics here
                      itemBuilder: (context, index) {
                        final user = usersData[index];

                        // Ensure safe access to user properties
                        final name = user['name'] ?? 'Unknown';
                        final email = user['email'] ?? 'No email';

                        return Card(
                          margin: const EdgeInsets.symmetric(vertical: 5),
                          child: ListTile(
                            leading: CircleAvatar(
                              backgroundColor: Colors.green,
                              child: Text(
                                name[0].toUpperCase(), // Safely access the first letter
                                style: const TextStyle(color: Colors.white),
                              ),
                            ),
                            title: Text(
                              name,
                              style: GoogleFonts.poppins(fontSize: 16),
                            ),
                            subtitle: Text(
                              type == "Players' Details"
                                  ? 'Email: $email'
                                  : _formatScores(user['games'] as Map<String, dynamic>?),
                            ),
                            trailing: IconButton(
                              icon: const Icon(Icons.delete, color: Colors.red),
                              onPressed: () async {
                                await deleteUser(email);
                                Navigator.pop(context);
                              },
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ],
              ),
            );
          },
        );
      },
    );
  }




  String _formatScores(Map<String, dynamic>? games) {
    if (games == null || games.isEmpty) {
      return 'No games played';
    }
    String scores = '';
    games.forEach((game, levels) {
      scores += '$game: ${levels['level1']}/${levels['level2']}/${levels['level3']}\n';
    });
    return scores.trim();
  }

  void logOut() {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (context) =>  QuizLoginApp()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        title: Text(
          'Admin Dashboard',
          style: GoogleFonts.poppins(
              fontSize: 18, fontWeight: FontWeight.bold, color: Colors.white70),
        ),
      ),
      body: Center(
        child: Column(
          children: [
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(16),
              decoration: const BoxDecoration(
                color: Colors.green,
                borderRadius: BorderRadius.vertical(
                  bottom: Radius.circular(25),
                ),
              ),
              child: Column(
                children: [
                  Text(
                    'Welcome, Admin',
                    style: GoogleFonts.poppins(
                      fontSize: 28,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton.icon(
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 20),
                backgroundColor: Colors.lime,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
              onPressed: () =>
                  showBottomSheet(
                      "Players' Details"),
              icon: const Icon(Icons.person, color: Colors.black),
              label: Text(
                "View Players' Details",
                style: GoogleFonts.poppins(fontSize: 18, color: Colors.black),
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton.icon(
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 20),
                backgroundColor: Colors.red,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
              onPressed: logOut,
              icon: const Icon(Icons.logout, color: Colors.white),
              label: Text(
                "Logout",
                style: GoogleFonts.poppins(fontSize: 18, color: Colors.white),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
