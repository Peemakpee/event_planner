import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:event_planner/occasions.dart';
import 'package:event_planner/services.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:quickalert/models/quickalert_type.dart';
import 'package:quickalert/widgets/quickalert_dialog.dart';

class UpdateOccasion extends StatefulWidget {
  const UpdateOccasion({
    super.key,
    required this.ocs,
  });

  final Occasions ocs;

  @override
  State<UpdateOccasion> createState() => _UpdateOccasionState();
}

class _UpdateOccasionState extends State<UpdateOccasion> {
  late TextEditingController occasioncontroller;

  @override
  void initState() {
    super.initState();
    occasioncontroller = TextEditingController(
      text: widget.ocs.occasion,
    );
  }

  @override
  void dispose() {
    occasioncontroller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          Row(
            children: [
              IconButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                icon: const Icon(Icons.arrow_back),
              ),
            ],
          ),
          Column(
            children: [
              const Text(
                'Update Occasion',
                style: TextStyle(
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(
                height: 25,
              ),
              // SizedBox(
              //   child: Expanded(
              //     child: Image.asset(
              //       'assets/images/pencil.png',
              //       height: 250,
              //       width: 250,
              //     ),
              //   ),
              // ),
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
                                updateOccasion1(widget.ocs.occasionid);
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
                                updateOccasion2(widget.ocs.occasionid);
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
                                updateOccasion3(widget.ocs.occasionid);
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
                                  updateOccasion4(widget.ocs.occasionid);
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
                                  updateOccasion5(widget.ocs.occasionid);
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
                                  updateOccasion6(widget.ocs.occasionid);
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
                                  updateOccasion7(widget.ocs.occasionid);
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
                                  updateOccasion8(widget.ocs.occasionid);
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
                                  updateOccasion9(widget.ocs.occasionid);
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
        ],
      ),
    );
  }

  updateOccasion1(String id) {
    final docUser = FirebaseFirestore.instance.collection('Occasions').doc(id);
    docUser.update({
      'occasion': 'Wedding',
    });

    Navigator.pop(context);
    Fluttertoast.showToast(msg: "Updated Successfully");
  }

  updateOccasion2(String id) {
    final docUser = FirebaseFirestore.instance.collection('Occasions').doc(id);
    docUser.update({
      'occasion': 'Birthday',
    });

    Navigator.pop(context);
    Fluttertoast.showToast(msg: "Updated Successfully");
  }

  updateOccasion3(String id) {
    final docUser = FirebaseFirestore.instance.collection('Occasions').doc(id);
    docUser.update({
      'occasion': 'Proposal',
    });

    Navigator.pop(context);
    Fluttertoast.showToast(msg: "Updated Successfully");
  }

  updateOccasion4(String id) {
    final docUser = FirebaseFirestore.instance.collection('Occasions').doc(id);
    docUser.update({
      'occasion': 'Feast',
    });

    Navigator.pop(context);
    Fluttertoast.showToast(msg: "Updated Successfully");
  }

  updateOccasion5(String id) {
    final docUser = FirebaseFirestore.instance.collection('Occasions').doc(id);
    docUser.update({
      'occasion': 'Festivities',
    });

    Navigator.pop(context);
    Fluttertoast.showToast(msg: "Updated Successfully");
  }

  updateOccasion6(String id) {
    final docUser = FirebaseFirestore.instance.collection('Occasions').doc(id);
    docUser.update({
      'occasion': 'Surprise',
    });

    Navigator.pop(context);
    Fluttertoast.showToast(msg: "Updated Successfully");
  }

  updateOccasion7(String id) {
    final docUser = FirebaseFirestore.instance.collection('Occasions').doc(id);
    docUser.update({
      'occasion': 'Anniversary',
    });

    Navigator.pop(context);
    Fluttertoast.showToast(msg: "Updated Successfully");
  }

  updateOccasion8(String id) {
    final docUser = FirebaseFirestore.instance.collection('Occasions').doc(id);
    docUser.update({
      'occasion': 'Christmas',
    });

    Navigator.pop(context);
    Fluttertoast.showToast(msg: "Updated Successfully");
  }

  updateOccasion9(String id) {
    final docUser = FirebaseFirestore.instance.collection('Occasions').doc(id);
    docUser.update({
      'occasion': "New Year's",
    });

    Navigator.pop(context);
    Fluttertoast.showToast(msg: "Updated Successfully");
  }
}
