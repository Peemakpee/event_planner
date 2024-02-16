import 'package:cloud_firestore/cloud_firestore.dart';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:event_planner/register.dart';

// import 'package:event_planner/update.dart';

import 'package:event_planner/users.dart';

class Home1 extends StatefulWidget {
  const Home1({super.key});

  @override
  State<Home1> createState() => _Home1State();
}

class _Home1State extends State<Home1> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('View All Accounts'),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => Register(),
                ),
              );
            },
            icon: const Icon(Icons.add_circle),
          ),
        ],
      ),
      body: StreamBuilder<List<Users>>(
        stream: readUsers(),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return Text('Something went wrong! ${snapshot.error}');
          } else if (snapshot.hasData) {
            final users = snapshot.data!;

            return ListView(
              children: users.map(buildUser).toList(),
            );
          } else {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
    );
  }

  Widget imgExist(img) => CircleAvatar(
        radius: 30,
        backgroundImage: NetworkImage(img),
      );

  Widget imgNotExist() => const Icon(
        Icons.account_circle_rounded,
        size: 40,
      );

  Widget buildUser(Users user) => ListTile(
        // leading: (user.image != "-") ? imgExist(user.image) : imgNotExist(),
        title: Text(user.name),
        subtitle: Text(user.email),
        dense: true,
        trailing: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            IconButton(
                onPressed: () {
                  /*
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => Update(
                        user: user,
                      ),
                    ),
                  );
                  */
                },
                icon: const Icon(Icons.edit)),
            IconButton(
                onPressed: () {
                  _showActionSheet(context, user.id);
                },
                icon: const Icon(Icons.delete)),
          ],
        ),
        onTap: () {},
      );

  Stream<List<Users>> readUsers() =>
      FirebaseFirestore.instance.collection('Users').snapshots().map(
            (snapshot) => snapshot.docs
                .map(
                  (doc) => Users.fromJson(
                    doc.data(),
                  ),
                )
                .toList(),
          );

  // Stream<List<Products>> readProducts() =>
  //     FirebaseFirestore.instance.collection('Products').snapshots().map(
  //           (snapshot) => snapshot.docs
  //               .map(
  //                 (doc) => Products.fromJson(
  //                   doc.data(),
  //                 ),
  //               )
  //               .toList(),
  //         );

  deleteUser(String id) {
    final docUser = FirebaseFirestore.instance.collection('Users1').doc(id);
    docUser.delete();
    Navigator.pop(context);
  }

  void _showActionSheet(BuildContext context, String id) {
    showCupertinoModalPopup(
      context: context,
      builder: (BuildContext context) => CupertinoActionSheet(
        title: const Text('Confirmation'),
        message: const Text(
            'Are you sure you want to delete this user? Doing this will not undo any changes.'),
        actions: [
          CupertinoActionSheetAction(
            onPressed: () {
              deleteUser(id);
            },
            child: const Text('Continue'),
          ),
        ],
        cancelButton: CupertinoActionSheetAction(
          child: const Text('Cancel'),
          onPressed: () => Navigator.pop(context),
        ),
      ),
    );
  }
}
