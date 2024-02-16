import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:event_planner/dashboard.dart';
import 'package:event_planner/datepage.dart';
import 'package:event_planner/services.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Servicepage extends StatefulWidget {
  const Servicepage({super.key});

  @override
  State<Servicepage> createState() => _ServicepageState();
}

class _ServicepageState extends State<Servicepage> {
  late TextEditingController servicecontroller;

  @override
  void initState() {
    super.initState();
    servicecontroller = TextEditingController();
  }

  @override
  void dispose() {
    servicecontroller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          Column(
            children: [
              const SizedBox(
                height: 50,
              ),
              Column(
                children: [
                  Row(
                    children: const [
                      Padding(
                        padding: EdgeInsets.only(
                          left: 30,
                        ),
                        child: Text(
                          'What are the',
                          style: TextStyle(
                            fontSize: 35,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  ),
                  Row(
                    children: const [
                      Padding(
                        padding: EdgeInsets.only(
                          left: 30,
                        ),
                        child: Text(
                          'services you require?',
                          style: TextStyle(
                            fontSize: 35,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              const SizedBox(
                height: 40,
              ),
              GestureDetector(
                onTap: () {
                  popModal1(context);
                },
                child: Container(
                  width: 360,
                  height: 90,
                  decoration: BoxDecoration(
                    color: Color.fromARGB(255, 210, 193, 255),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: SizedBox(
                    child: Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(
                            left: 30,
                            bottom: 10,
                            top: 10,
                          ),
                          child: Expanded(
                            child: Image.asset(
                              'assets/images/catering.png',
                            ),
                          ),
                        ),
                        const Padding(
                          padding: EdgeInsets.only(
                            left: 20,
                          ),
                          child: Text(
                            'Catering and Food',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 22,
                              color: Colors.black,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              GestureDetector(
                onTap: () {
                  popModal2(context);
                },
                child: Container(
                  width: 360,
                  height: 90,
                  decoration: BoxDecoration(
                    color: Color.fromARGB(255, 210, 193, 255),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: SizedBox(
                    child: Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(
                            left: 30,
                            bottom: 10,
                            top: 10,
                          ),
                          child: Expanded(
                            child: Image.asset(
                              'assets/images/flower.png',
                            ),
                          ),
                        ),
                        const Padding(
                          padding: EdgeInsets.only(
                            left: 20,
                          ),
                          child: Text(
                            'Flower Decoration',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 22,
                              color: Colors.black,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              GestureDetector(
                onTap: () {
                  popModal3(context);
                },
                child: Container(
                  width: 360,
                  height: 90,
                  decoration: BoxDecoration(
                    color: Color.fromARGB(255, 210, 193, 255),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: SizedBox(
                    child: Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(
                            left: 30,
                            bottom: 10,
                            top: 10,
                          ),
                          child: Expanded(
                            child: Image.asset(
                              'assets/images/balloons.png',
                            ),
                          ),
                        ),
                        const Padding(
                          padding: EdgeInsets.only(
                            left: 20,
                          ),
                          child: Text(
                            'Balloon Decoration',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 22,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              GestureDetector(
                onTap: () {
                  popModal4(context);
                },
                child: Container(
                  width: 360,
                  height: 80,
                  decoration: BoxDecoration(
                    color: Color.fromARGB(255, 210, 193, 255),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: SizedBox(
                    child: Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(
                            left: 35,
                            bottom: 10,
                            top: 10,
                          ),
                          child: Expanded(
                            child: Image.asset(
                              'assets/images/bar-counter.png',
                            ),
                          ),
                        ),
                        const Padding(
                          padding: EdgeInsets.only(
                            left: 25,
                          ),
                          child: Text(
                            'Bar ',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 22,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              GestureDetector(
                onTap: () {
                  popModal5(context);
                },
                child: Container(
                  width: 360,
                  height: 80,
                  decoration: BoxDecoration(
                    color: Color.fromARGB(255, 210, 193, 255),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: SizedBox(
                    child: Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(
                            left: 35,
                            bottom: 10,
                            top: 10,
                          ),
                          child: Expanded(
                            child: Image.asset(
                              'assets/images/accomodation.png',
                            ),
                          ),
                        ),
                        const Padding(
                          padding: EdgeInsets.only(
                            left: 25,
                          ),
                          child: Text(
                            'Accommodation',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 22,
                            ),
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
    );
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
          'You selected Catering and Food',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 22,
          ),
        ),
        actions: [
          CupertinoActionSheetAction(
            onPressed: () {
              addCatering();
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const Datepage(),
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
          'You selected Flower Decoration',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 22,
          ),
        ),
        actions: [
          CupertinoActionSheetAction(
            onPressed: () {
              addFlower();
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const Datepage(),
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
          'You selected Balloon Decoration',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 21,
          ),
        ),
        actions: [
          CupertinoActionSheetAction(
            onPressed: () {
              addBalloon();
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const Datepage(),
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
          'You selected Bar',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 23,
          ),
        ),
        actions: [
          CupertinoActionSheetAction(
            onPressed: () {
              addBar();
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const Datepage(),
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
          'You selected Accommodation',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 22,
          ),
        ),
        actions: [
          CupertinoActionSheetAction(
            onPressed: () {
              addAccommodation();
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const Datepage(),
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

  Future addCatering() async {
    final user = FirebaseAuth.instance.currentUser!;
    final userid = user.uid;
    final docServices = FirebaseFirestore.instance.collection('Services').doc();

    final newServices = Services(
      userid: userid,
      service: 'Catering and Food',
      serviceid: docServices.id,
    );

    final json = newServices.toJson();
    await docServices.set(json);
  }

  Future addFlower() async {
    final user = FirebaseAuth.instance.currentUser!;
    final userid = user.uid;
    final docServices = FirebaseFirestore.instance.collection('Services').doc();

    final newServices = Services(
      userid: userid,
      service: 'Flower Decoration',
      serviceid: docServices.id,
    );

    final json = newServices.toJson();
    await docServices.set(json);
  }

  Future addBalloon() async {
    final user = FirebaseAuth.instance.currentUser!;
    final userid = user.uid;
    final docServices = FirebaseFirestore.instance.collection('Services').doc();

    final newServices = Services(
      userid: userid,
      service: 'Balloon Decoration',
      serviceid: docServices.id,
    );

    final json = newServices.toJson();
    await docServices.set(json);
  }

  Future addBar() async {
    final user = FirebaseAuth.instance.currentUser!;
    final userid = user.uid;
    final docServices = FirebaseFirestore.instance.collection('Services').doc();

    final newServices = Services(
      userid: userid,
      service: 'Bar',
      serviceid: docServices.id,
    );

    final json = newServices.toJson();
    await docServices.set(json);
  }

  Future addAccommodation() async {
    final user = FirebaseAuth.instance.currentUser!;
    final userid = user.uid;
    final docServices = FirebaseFirestore.instance.collection('Services').doc();

    final newServices = Services(
      userid: userid,
      service: 'Accommodation',
      serviceid: docServices.id,
    );

    final json = newServices.toJson();
    await docServices.set(json);
  }
}
