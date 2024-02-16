import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:event_planner/services.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:quickalert/models/quickalert_type.dart';
import 'package:quickalert/widgets/quickalert_dialog.dart';

class Updateservice extends StatefulWidget {
  const Updateservice({
    super.key,
    required this.srvs,
  });

  final Services srvs;

  @override
  State<Updateservice> createState() => _UpdateserviceState();
}

class _UpdateserviceState extends State<Updateservice> {
  late TextEditingController servicecontroller;

  @override
  void initState() {
    super.initState();
    servicecontroller = TextEditingController(
      text: widget.srvs.service,
    );
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
              const SizedBox(
                height: 20,
              ),
              const Text(
                'Update Service',
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(
                height: 30,
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
              // const SizedBox(
              //   height: 25,
              // ),
              GestureDetector(
                onTap: () {
                  updateService1(widget.srvs.serviceid);
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
                  updateService2(widget.srvs.serviceid);
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
                  updateService3(widget.srvs.serviceid);
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
                  updateService4(widget.srvs.serviceid);
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
                  updateService5(widget.srvs.serviceid);
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

  updateService1(String id) {
    final docService =
        FirebaseFirestore.instance.collection('Services').doc(id);
    docService.update({
      'service': 'Catering and Food',
    });

    Navigator.pop(context);
    Fluttertoast.showToast(msg: "Updated Successfully");
  }

  updateService2(String id) {
    final docService =
        FirebaseFirestore.instance.collection('Services').doc(id);
    docService.update({
      'service': 'Flower Decoration',
    });

    Navigator.pop(context);
    Fluttertoast.showToast(msg: "Updated Successfully");
  }

  updateService3(String id) {
    final docService =
        FirebaseFirestore.instance.collection('Services').doc(id);
    docService.update({
      'service': 'Balloon Decoration',
    });

    Navigator.pop(context);
    Fluttertoast.showToast(msg: "Updated Successfully");
  }

  updateService4(String id) {
    final docService =
        FirebaseFirestore.instance.collection('Services').doc(id);
    docService.update({
      'service': 'Bar',
    });

    Navigator.pop(context);
    Fluttertoast.showToast(msg: "Updated Successfully");
  }

  updateService5(String id) {
    final docService =
        FirebaseFirestore.instance.collection('Services').doc(id);
    docService.update({
      'service': 'Accommodation',
    });

    Navigator.pop(context);
    Fluttertoast.showToast(msg: "Updated Successfully");
  }
}
