import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:event_planner/dashboard.dart';
import 'package:event_planner/date.dart';
import 'package:event_planner/main.dart';
import 'package:event_planner/occasions.dart';
import 'package:event_planner/services.dart';
import 'package:event_planner/updateDate.dart';
import 'package:event_planner/updateOccasion.dart';
import 'package:event_planner/updateService.dart';
import 'package:event_planner/users.dart';
import 'package:file_picker/file_picker.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:quickalert/models/quickalert_type.dart';
import 'package:quickalert/widgets/quickalert_dialog.dart';

class View extends StatefulWidget {
  const View({
    super.key,
  });

  @override
  State<View> createState() => _ViewState();
}

class _ViewState extends State<View> {
  late TextEditingController datecontroller;
  late TextEditingController guestcontroller;
  final currentUser = FirebaseAuth.instance;
  PlatformFile? pickedFile;
  UploadTask? uploadTask;

  DateTime datetime = DateTime.now();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: StreamBuilder<List<Users>>(
        stream: readUser(),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return Text('Something went wrong! ${snapshot.error}');
          } else if (snapshot.hasData) {
            final user = snapshot.data!;

            return ListView(
              children: user.map(buildView).toList(),
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

  Widget buildView(Users user) => Column(
        children: [
          welcomeUser(user),
          Column(
            children: [
              viewDate(),
              viewOcs(),
              viewSrvs(),
            ],
          ),
          const SizedBox(
            height: 5,
          ),
          SizedBox(
            width: 390,
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                  primary: Color.fromARGB(255, 210, 193, 255),
                  elevation: 3,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20)),
                  padding: const EdgeInsets.all(15)),
              onPressed: () {
                Navigator.pop(context);
                Navigator.pop(context);
                Navigator.pop(context);
                Navigator.pop(context);
                Navigator.pop(context);
                QuickAlert.show(
                  context: context,
                  type: QuickAlertType.success,
                  text: 'Booking Successful!',
                );
              },
              child: const Text(
                "Book now",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 18,
                  color: Colors.black,
                ),
              ),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
        ],
      );

  Widget welcomeUser(Users user) => Column(
        children: [
          const SizedBox(
            height: 30,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                'Hey there ',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 35,
                ),
              ),
              Text(
                user.username,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 35,
                ),
              ),
              const Text(
                '!',
                style: TextStyle(
                  fontSize: 35,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 10,
          ),
          const Text(
            'Your booking summary:',
            style: TextStyle(
              fontSize: 30,
              fontWeight: FontWeight.w900,
              color: Color.fromARGB(255, 150, 150, 150),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
        ],
      );

  Widget viewOcs() => Container(
        child: StreamBuilder<List<Occasions>>(
          stream: readOcs(),
          builder: (context, snapshot) {
            if (snapshot.hasError) {
              return Text('Something went wrong! ${snapshot.error}');
            } else if (snapshot.hasData) {
              final ocs = snapshot.data!;

              return Column(
                children: ocs.map(listOcs).toList(),
              );
            } else {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
          },
        ),
      );

  Widget viewSrvs() => Container(
        child: StreamBuilder<List<Services>>(
          stream: readSrvs(),
          builder: (context, snapshot) {
            if (snapshot.hasError) {
              return Text('Something went wrong! ${snapshot.error}');
            } else if (snapshot.hasData) {
              final srvs = snapshot.data!;

              return Column(
                children: srvs.map(listSrvs).toList(),
              );
            } else {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
          },
        ),
      );

  Widget viewDate() => Container(
        child: StreamBuilder<List<Date>>(
          stream: readDate(),
          builder: (context, snapshot) {
            if (snapshot.hasError) {
              return Text('Something went wrong! ${snapshot.error}');
            } else if (snapshot.hasData) {
              final date = snapshot.data!;

              return Column(
                children: date.map(listDate).toList(),
              );
            } else {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
          },
        ),
      );

  Widget listOcs(Occasions ocs) => Container(
        margin: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          border: Border.all(
            width: 2,
            color: Color.fromARGB(255, 210, 193, 255),
          ),
        ),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                IconButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => UpdateOccasion(
                          ocs: ocs,
                        ),
                      ),
                    );
                  },
                  icon: const Icon(Icons.edit),
                ),
                IconButton(
                  onPressed: () {
                    _showActionSheet1(context, ocs.occasionid);
                  },
                  icon: const Icon(Icons.delete),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(
                left: 15,
                bottom: 20,
              ),
              child: Row(
                children: [
                  const Text(
                    'Occasion: ',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    ocs.occasion,
                    style: const TextStyle(
                      fontSize: 20,
                    ),
                  ),
                  const SizedBox(
                    width: 20,
                  ),
                  const Padding(
                    padding: EdgeInsets.only(
                      left: 55,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      );

  Widget listSrvs(Services srvs) => Container(
        margin: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          border: Border.all(
            width: 2,
            color: Color.fromARGB(255, 210, 193, 255),
          ),
        ),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                IconButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => Updateservice(
                          srvs: srvs,
                        ),
                      ),
                    );
                  },
                  icon: const Icon(Icons.edit),
                ),
                IconButton(
                  onPressed: () {
                    _showActionSheet2(context, srvs.serviceid);
                  },
                  icon: const Icon(Icons.delete),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(
                left: 15,
                bottom: 20,
              ),
              child: Row(
                children: [
                  const Text(
                    'Services: ',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    srvs.service,
                    style: const TextStyle(
                      fontSize: 20,
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.only(
                      left: 5,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      );

  Widget listDate(Date date) => Container(
        margin: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          border: Border.all(
            width: 2,
            color: Color.fromARGB(255, 210, 193, 255),
          ),
        ),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                IconButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => UpdateDate(
                          dgi: date,
                        ),
                      ),
                    );
                  },
                  icon: const Icon(Icons.edit),
                ),
                IconButton(
                  onPressed: () {
                    _showActionSheet3(context, date.dateid);
                  },
                  icon: const Icon(Icons.delete),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(
                left: 15,
              ),
              child: Row(
                children: const [
                  Text(
                    'Theme: ',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(
                left: 60,
                top: 10,
                bottom: 10,
              ),
              child: Row(
                children: [
                  Image(
                    fit: BoxFit.cover,
                    image: NetworkImage(date.image),
                    height: 200,
                    width: 250,
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.only(
                left: 15,
              ),
              child: Row(
                children: [
                  const Text(
                    'Number of guests: ',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    date.guest,
                    style: const TextStyle(
                      fontSize: 20,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Padding(
              padding: const EdgeInsets.only(
                left: 15,
                bottom: 20,
              ),
              child: Row(
                children: [
                  const Text(
                    'Date of event: ',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    date.date,
                    style: const TextStyle(
                      fontSize: 20,
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.only(
                      left: 28,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      );

  Stream<List<Occasions>> readOcs() => FirebaseFirestore.instance
      .collection('Occasions')
      .where('userid', isEqualTo: currentUser.currentUser!.uid)
      .snapshots()
      .map(
        (snapshot) => snapshot.docs
            .map(
              (doc) => Occasions.fromJson(
                doc.data(),
              ),
            )
            .toList(),
      );

  Stream<List<Services>> readSrvs() => FirebaseFirestore.instance
      .collection('Services')
      .where('userid', isEqualTo: currentUser.currentUser!.uid)
      .snapshots()
      .map(
        (snapshot) => snapshot.docs
            .map(
              (doc) => Services.fromJson(
                doc.data(),
              ),
            )
            .toList(),
      );

  Stream<List<Date>> readDate() => FirebaseFirestore.instance
      .collection('Date')
      .where('userid', isEqualTo: currentUser.currentUser!.uid)
      .snapshots()
      .map(
        (snapshot) => snapshot.docs
            .map(
              (doc) => Date.fromJson(
                doc.data(),
              ),
            )
            .toList(),
      );

  Stream<List<Users>> readUser() => FirebaseFirestore.instance
      .collection('Users')
      .where('id', isEqualTo: currentUser.currentUser!.uid)
      .snapshots()
      .map(
        (snapshot) => snapshot.docs
            .map(
              (doc) => Users.fromJson(
                doc.data(),
              ),
            )
            .toList(),
      );

  deleteOcs(String id) {
    final docOcs = FirebaseFirestore.instance.collection('Occasions').doc(id);
    docOcs.delete();
    Navigator.pop(context);
    Fluttertoast.showToast(msg: "Deleted Successfully");
  }

  deleteSrvs(String id) {
    final docSrvs = FirebaseFirestore.instance.collection('Services').doc(id);
    docSrvs.delete();
    Navigator.pop(context);
    Fluttertoast.showToast(msg: "Deleted Successfully");
  }

  deleteDate(String id) {
    final docdate = FirebaseFirestore.instance.collection('Date').doc(id);
    docdate.delete();
    Navigator.pop(context);
    Fluttertoast.showToast(msg: "Deleted Successfully");
  }

  void _showActionSheet1(BuildContext context, String id) {
    showCupertinoModalPopup(
      context: context,
      builder: (BuildContext context) => CupertinoActionSheet(
        title: const Text('Confirmation'),
        message: const Text(
            'Are you sure you want to delete this occasion? Doing this will not undo any changes.'),
        actions: [
          CupertinoActionSheetAction(
            onPressed: () {
              deleteOcs(id);
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

  void _showActionSheet2(BuildContext context, String id) {
    showCupertinoModalPopup(
      context: context,
      builder: (BuildContext context) => CupertinoActionSheet(
        title: const Text('Confirmation'),
        message: const Text(
            'Are you sure you want to delete this service? Doing this will not undo any changes.'),
        actions: [
          CupertinoActionSheetAction(
            onPressed: () {
              deleteSrvs(id);
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

  void _showActionSheet3(BuildContext context, String id) {
    showCupertinoModalPopup(
      context: context,
      builder: (BuildContext context) => CupertinoActionSheet(
        title: const Text('Confirmation'),
        message: const Text(
            'Are you sure you want to delete this content? Doing this will not undo any changes.'),
        actions: [
          CupertinoActionSheetAction(
            onPressed: () {
              deleteDate(id);
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
