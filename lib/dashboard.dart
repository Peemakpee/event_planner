import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:event_planner/occasions.dart';
import 'package:event_planner/servicepage.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:event_planner/users.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:quickalert/models/quickalert_type.dart';
import 'package:quickalert/widgets/quickalert_dialog.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({super.key});

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  @override
  Widget build(BuildContext context) {
    final user = FirebaseAuth.instance.currentUser!;
    return Scaffold(
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.only(
              left: 280,
            ),
            child: TextButton(
              onPressed: () {
                logOutModal(context);
              },
              child: const Text(
                'Sign out',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 15,
                  color: Color.fromARGB(255, 141, 102, 251),
                ),
              ),
            ),
          ),
          SizedBox(
            child: Expanded(
              child: Image.asset(
                'assets/images/welcome.png',
                height: 250,
                width: 250,
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                "What's the occasion ",
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                ),
              ),
              read(user.uid),
              const Text(
                '?',
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.all(30),
            child: Column(
              children: [
                Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        GestureDetector(
                          onTap: () {
                            popModal1(context);
                          },
                          child: Container(
                            width: 100,
                            height: 100,
                            decoration: BoxDecoration(
                              color: Color.fromARGB(255, 255, 255, 255),
                              borderRadius: BorderRadius.circular(20),
                              border: Border.all(
                                width: 1,
                                color: Color.fromARGB(255, 172, 144, 249),
                                style: BorderStyle.solid,
                              ),
                            ),
                            child: SizedBox(
                              child: Column(
                                children: [
                                  Expanded(
                                    child: Image.asset(
                                      'assets/images/wedding.png',
                                    ),
                                  ),
                                  const Padding(
                                    padding: EdgeInsets.only(
                                      bottom: 5,
                                    ),
                                    child: Text(
                                      'Wedding',
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            popModal2(context);
                          },
                          child: Container(
                            width: 100,
                            height: 100,
                            decoration: BoxDecoration(
                              color: Color.fromARGB(255, 255, 255, 255),
                              borderRadius: BorderRadius.circular(20),
                              border: Border.all(
                                width: 1,
                                color: Color.fromARGB(255, 172, 144, 249),
                                style: BorderStyle.solid,
                              ),
                            ),
                            child: SizedBox(
                              child: Column(
                                children: [
                                  Expanded(
                                    child: Image.asset(
                                      'assets/images/birthday.png',
                                    ),
                                  ),
                                  const Padding(
                                    padding: EdgeInsets.only(
                                      bottom: 5,
                                    ),
                                    child: Text(
                                      'Birthday',
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            popModal3(context);
                          },
                          child: Container(
                            width: 100,
                            height: 100,
                            decoration: BoxDecoration(
                              color: Color.fromARGB(255, 255, 255, 255),
                              borderRadius: BorderRadius.circular(20),
                              border: Border.all(
                                width: 1,
                                color: Color.fromARGB(255, 172, 144, 249),
                                style: BorderStyle.solid,
                              ),
                            ),
                            child: SizedBox(
                              child: Column(
                                children: [
                                  Expanded(
                                    child: Image.asset(
                                      'assets/images/proposal.png',
                                    ),
                                  ),
                                  const Padding(
                                    padding: EdgeInsets.only(
                                      bottom: 5,
                                    ),
                                    child: Text(
                                      'Proposal',
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
                const SizedBox(
                  height: 10,
                ),
                SizedBox.fromSize(
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          GestureDetector(
                            onTap: () {
                              popModal4(context);
                            },
                            child: Container(
                              width: 100,
                              height: 100,
                              decoration: BoxDecoration(
                                color: Color.fromARGB(255, 255, 255, 255),
                                borderRadius: BorderRadius.circular(20),
                                border: Border.all(
                                  width: 1,
                                  color: Color.fromARGB(255, 172, 144, 249),
                                  style: BorderStyle.solid,
                                ),
                              ),
                              child: SizedBox(
                                child: Column(
                                  children: [
                                    Expanded(
                                      child: Image.asset(
                                        'assets/images/feast.png',
                                      ),
                                    ),
                                    const Padding(
                                      padding: EdgeInsets.only(
                                        bottom: 5,
                                      ),
                                      child: Text(
                                        'Feast',
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                          GestureDetector(
                            onTap: () {
                              popModal5(context);
                            },
                            child: Container(
                              width: 100,
                              height: 100,
                              decoration: BoxDecoration(
                                color: Color.fromARGB(255, 255, 255, 255),
                                borderRadius: BorderRadius.circular(20),
                                border: Border.all(
                                  width: 1,
                                  color: Color.fromARGB(255, 172, 144, 249),
                                  style: BorderStyle.solid,
                                ),
                              ),
                              child: SizedBox(
                                child: Column(
                                  children: [
                                    Expanded(
                                      child: Image.asset(
                                        'assets/images/festivities.png',
                                      ),
                                    ),
                                    const Padding(
                                      padding: EdgeInsets.only(
                                        bottom: 5,
                                      ),
                                      child: Text(
                                        'Festivities',
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                          GestureDetector(
                            onTap: () {
                              popModal6(context);
                            },
                            child: Container(
                              width: 100,
                              height: 100,
                              decoration: BoxDecoration(
                                color: Color.fromARGB(255, 255, 255, 255),
                                borderRadius: BorderRadius.circular(20),
                                border: Border.all(
                                  width: 1,
                                  color: Color.fromARGB(255, 172, 144, 249),
                                  style: BorderStyle.solid,
                                ),
                              ),
                              child: SizedBox(
                                child: Column(
                                  children: [
                                    Expanded(
                                      child: Image.asset(
                                        'assets/images/surprise.png',
                                      ),
                                    ),
                                    const Padding(
                                      padding: EdgeInsets.only(
                                        bottom: 5,
                                      ),
                                      child: Text(
                                        'Surprise',
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                SizedBox.fromSize(
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          GestureDetector(
                            onTap: () {
                              popModal7(context);
                            },
                            child: Container(
                              width: 100,
                              height: 100,
                              decoration: BoxDecoration(
                                color: Color.fromARGB(255, 255, 255, 255),
                                borderRadius: BorderRadius.circular(20),
                                border: Border.all(
                                  width: 1,
                                  color: Color.fromARGB(255, 172, 144, 249),
                                  style: BorderStyle.solid,
                                ),
                              ),
                              child: SizedBox(
                                child: Column(
                                  children: [
                                    Expanded(
                                      child: Image.asset(
                                        'assets/images/anniversary.png',
                                      ),
                                    ),
                                    const Padding(
                                      padding: EdgeInsets.only(
                                        bottom: 5,
                                      ),
                                      child: Text(
                                        'Anniversary',
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                          GestureDetector(
                            onTap: () {
                              popModal8(context);
                            },
                            child: Container(
                              width: 100,
                              height: 100,
                              decoration: BoxDecoration(
                                color: Color.fromARGB(255, 255, 255, 255),
                                borderRadius: BorderRadius.circular(20),
                                border: Border.all(
                                  width: 1,
                                  color: Color.fromARGB(255, 172, 144, 249),
                                  style: BorderStyle.solid,
                                ),
                              ),
                              child: SizedBox(
                                child: Column(
                                  children: [
                                    Expanded(
                                      child: Image.asset(
                                        'assets/images/christmas.png',
                                      ),
                                    ),
                                    const Padding(
                                      padding: EdgeInsets.only(
                                        bottom: 5,
                                      ),
                                      child: Text(
                                        'Christmas',
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                          GestureDetector(
                            onTap: () {
                              popModal9(context);
                            },
                            child: Container(
                              width: 100,
                              height: 100,
                              decoration: BoxDecoration(
                                color: Color.fromARGB(255, 255, 255, 255),
                                borderRadius: BorderRadius.circular(20),
                                border: Border.all(
                                  width: 1,
                                  color: Color.fromARGB(255, 172, 144, 249),
                                  style: BorderStyle.solid,
                                ),
                              ),
                              child: SizedBox(
                                child: Column(
                                  children: [
                                    Expanded(
                                      child: Image.asset(
                                        'assets/images/new.png',
                                      ),
                                    ),
                                    const Padding(
                                      padding: EdgeInsets.only(
                                        bottom: 5,
                                      ),
                                      child: Text(
                                        "New Year's",
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  void logOutModal(BuildContext context) {
    showCupertinoModalPopup(
      context: context,
      builder: (BuildContext context) => CupertinoActionSheet(
        title: const Text(
          'Confirmation',
          style: TextStyle(
            fontSize: 20,
          ),
        ),
        message: const Text(
          'Are you sure you want to logout?',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 18,
          ),
        ),
        actions: [
          CupertinoActionSheetAction(
            onPressed: () {
              FirebaseAuth.instance.signOut();

              Navigator.pop(context);
              Fluttertoast.showToast(msg: "Logout Successfully");
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

  Future addWedding() async {
    final user = FirebaseAuth.instance.currentUser!;
    final userid = user.uid;
    final docOcs = FirebaseFirestore.instance.collection('Occasions').doc();

    final newOcs = Occasions(
      userid: userid,
      occasion: 'Wedding',
      occasionid: docOcs.id,
    );

    final json = newOcs.toJson();
    await docOcs.set(json);
  }

  Future addBirthday() async {
    final user = FirebaseAuth.instance.currentUser!;
    final userid = user.uid;
    final docOcs = FirebaseFirestore.instance.collection('Occasions').doc();

    final newOcs = Occasions(
      userid: userid,
      occasion: 'Birthday',
      occasionid: docOcs.id,
    );

    final json = newOcs.toJson();
    await docOcs.set(json);
  }

  Future addProposal() async {
    final user = FirebaseAuth.instance.currentUser!;
    final userid = user.uid;
    final docOcs = FirebaseFirestore.instance.collection('Occasions').doc();

    final newOcs = Occasions(
      userid: userid,
      occasion: 'Proposal',
      occasionid: docOcs.id,
    );

    final json = newOcs.toJson();
    await docOcs.set(json);
  }

  Future addFeast() async {
    final user = FirebaseAuth.instance.currentUser!;
    final userid = user.uid;
    final docOcs = FirebaseFirestore.instance.collection('Occasions').doc();

    final newOcs = Occasions(
      userid: userid,
      occasion: 'Feast',
      occasionid: docOcs.id,
    );

    final json = newOcs.toJson();
    await docOcs.set(json);
  }

  Future addFestivities() async {
    final user = FirebaseAuth.instance.currentUser!;
    final userid = user.uid;
    final docOcs = FirebaseFirestore.instance.collection('Occasions').doc();

    final newOcs = Occasions(
      userid: userid,
      occasion: 'Feast',
      occasionid: docOcs.id,
    );

    final json = newOcs.toJson();
    await docOcs.set(json);
  }

  Future addSurprise() async {
    final user = FirebaseAuth.instance.currentUser!;
    final userid = user.uid;
    final docOcs = FirebaseFirestore.instance.collection('Occasions').doc();

    final newOcs = Occasions(
      userid: userid,
      occasion: 'Surprise',
      occasionid: docOcs.id,
    );

    final json = newOcs.toJson();
    await docOcs.set(json);
  }

  Future addAnniversary() async {
    final user = FirebaseAuth.instance.currentUser!;
    final userid = user.uid;
    final docOcs = FirebaseFirestore.instance.collection('Occasions').doc();

    final newOcs = Occasions(
      userid: userid,
      occasion: 'Anniversary',
      occasionid: docOcs.id,
    );

    final json = newOcs.toJson();
    await docOcs.set(json);
  }

  Future addChristmas() async {
    final user = FirebaseAuth.instance.currentUser!;
    final userid = user.uid;
    final docOcs = FirebaseFirestore.instance.collection('Occasions').doc();

    final newOcs = Occasions(
      userid: userid,
      occasion: 'Christmas',
      occasionid: docOcs.id,
    );

    final json = newOcs.toJson();
    await docOcs.set(json);
  }

  Future addNewYears() async {
    final user = FirebaseAuth.instance.currentUser!;
    final userid = user.uid;
    final docOcs = FirebaseFirestore.instance.collection('Occasions').doc();

    final newOcs = Occasions(
      userid: userid,
      occasion: "New Year's",
      occasionid: docOcs.id,
    );

    final json = newOcs.toJson();
    await docOcs.set(json);
  }

  void popModal1(BuildContext context) {
    showCupertinoModalPopup(
      context: context,
      builder: (BuildContext context) => CupertinoActionSheet(
        title: const Text(
          'Confirmation',
          style: TextStyle(
            fontSize: 20,
          ),
        ),
        message: const Text(
          'You selected Wedding',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 25,
          ),
        ),
        actions: [
          CupertinoActionSheetAction(
            onPressed: () {
              addWedding();
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const Servicepage(),
                ),
              );
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

  void popModal2(BuildContext context) {
    showCupertinoModalPopup(
      context: context,
      builder: (BuildContext context) => CupertinoActionSheet(
        title: const Text(
          'Confirmation',
          style: TextStyle(
            fontSize: 20,
          ),
        ),
        message: const Text(
          'You selected Birthday',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 25,
          ),
        ),
        actions: [
          CupertinoActionSheetAction(
            onPressed: () {
              addBirthday();
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const Servicepage(),
                ),
              );
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

  void popModal3(BuildContext context) {
    showCupertinoModalPopup(
      context: context,
      builder: (BuildContext context) => CupertinoActionSheet(
        title: const Text(
          'Confirmation',
          style: TextStyle(
            fontSize: 20,
          ),
        ),
        message: const Text(
          'You selected Proposal',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 25,
          ),
        ),
        actions: [
          CupertinoActionSheetAction(
            onPressed: () {
              addProposal();
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const Servicepage(),
                ),
              );
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

  void popModal4(BuildContext context) {
    showCupertinoModalPopup(
      context: context,
      builder: (BuildContext context) => CupertinoActionSheet(
        title: const Text(
          'Confirmation',
          style: TextStyle(
            fontSize: 20,
          ),
        ),
        message: const Text(
          'You selected Feast',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 25,
          ),
        ),
        actions: [
          CupertinoActionSheetAction(
            onPressed: () {
              addFeast();
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const Servicepage(),
                ),
              );
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

  void popModal5(BuildContext context) {
    showCupertinoModalPopup(
      context: context,
      builder: (BuildContext context) => CupertinoActionSheet(
        title: const Text(
          'Confirmation',
          style: TextStyle(
            fontSize: 20,
          ),
        ),
        message: const Text(
          'You selected Festivities',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 25,
          ),
        ),
        actions: [
          CupertinoActionSheetAction(
            onPressed: () {
              addFestivities();
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const Servicepage(),
                ),
              );
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

  void popModal6(BuildContext context) {
    showCupertinoModalPopup(
      context: context,
      builder: (BuildContext context) => CupertinoActionSheet(
        title: const Text(
          'Confirmation',
          style: TextStyle(
            fontSize: 20,
          ),
        ),
        message: const Text(
          'You selected Surprise',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 25,
          ),
        ),
        actions: [
          CupertinoActionSheetAction(
            onPressed: () {
              addSurprise();
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const Servicepage(),
                ),
              );
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

  void popModal7(BuildContext context) {
    showCupertinoModalPopup(
      context: context,
      builder: (BuildContext context) => CupertinoActionSheet(
        title: const Text(
          'Confirmation',
          style: TextStyle(
            fontSize: 20,
          ),
        ),
        message: const Text(
          'You selected Anniversary',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 25,
          ),
        ),
        actions: [
          CupertinoActionSheetAction(
            onPressed: () {
              addAnniversary();
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const Servicepage(),
                ),
              );
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

  void popModal8(BuildContext context) {
    showCupertinoModalPopup(
      context: context,
      builder: (BuildContext context) => CupertinoActionSheet(
        title: const Text(
          'Confirmation',
          style: TextStyle(
            fontSize: 20,
          ),
        ),
        message: const Text(
          'You selected Christmas',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 25,
          ),
        ),
        actions: [
          CupertinoActionSheetAction(
            onPressed: () {
              addChristmas();
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const Servicepage(),
                ),
              );
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

  void popModal9(BuildContext context) {
    showCupertinoModalPopup(
      context: context,
      builder: (BuildContext context) => CupertinoActionSheet(
        title: const Text(
          'Confirmation',
          style: TextStyle(
            fontSize: 20,
          ),
        ),
        message: const Text(
          "You selected New Year's",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 25,
          ),
        ),
        actions: [
          CupertinoActionSheetAction(
            onPressed: () {
              addNewYears();
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const Servicepage(),
                ),
              );
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

  Widget buildUser(Users user) => Text(
        user.username,
        style: const TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 28,
        ),
      );

  Widget read(uid) {
    var collection = FirebaseFirestore.instance.collection('Users');
    return Column(
      children: [
        SizedBox(
          // height: 200,
          child: StreamBuilder<DocumentSnapshot<Map<String, dynamic>>>(
            stream: collection.doc(uid).snapshots(),
            builder: (_, snapshot) {
              if (snapshot.hasError) return Text('Error = ${snapshot.error}');

              if (snapshot.hasData) {
                final users = snapshot.data!.data();
                final newUser = Users(
                  id: users!['id'],
                  name: users['name'],
                  username: users['username'],
                  password: users['password'],
                  email: users['email'],
                );

                return buildUser(newUser);
              }

              return const Center(
                child: CircularProgressIndicator(),
              );
            },
          ),
        ),
      ],
    );
  }
}
