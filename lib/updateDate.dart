import 'dart:io';
import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:event_planner/date.dart';
import 'package:file_picker/file_picker.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:intl/intl.dart';
import 'package:quickalert/models/quickalert_type.dart';
import 'package:quickalert/widgets/quickalert_dialog.dart';

class UpdateDate extends StatefulWidget {
  const UpdateDate({
    super.key,
    required this.dgi,
  });

  final Date dgi;

  @override
  State<UpdateDate> createState() => _UpdateDateState();
}

class _UpdateDateState extends State<UpdateDate> {
  final formKey = GlobalKey<FormState>();
  late TextEditingController datecontroller;
  late TextEditingController guestcontroller;
  late String url;
  PlatformFile? pickedFile = null;
  UploadTask? uploadTask;

  DateTime datetime = DateTime.now();

  Future selectFile() async {
    final result = await FilePicker.platform.pickFiles();
    if (result == null) return;

    setState(() {
      pickedFile = result.files.first;
    });
  }

  String generateRandomString(int len) {
    var r = Random();
    const _chars =
        'AaBbCcDdEeFfGgHhIiJjKkLlMmNnOoPpQqRrSsTtUuVvWwXxYyZz1234567890';
    return List.generate(len, (index) => _chars[r.nextInt(_chars.length)])
        .join();
  }

  Future uploadFile() async {
    if (pickedFile != null) {
      final path = 'files/${generateRandomString(5)}';
      final file = File(pickedFile!.path!);

      //final curImage = widget.debts.de

      final ref = FirebaseStorage.instance.ref().child(path);

      setState(() {
        uploadTask = ref.putFile(file);
      });

      final snapshot = await uploadTask!.whenComplete(() {});
      final urlDownload = await snapshot.ref.getDownloadURL();
      print('Download Link: $urlDownload');

      if (urlDownload == "") {
        url = widget.dgi.image;
      } else {
        url = urlDownload;
      }
      updateDate(widget.dgi.dateid, url);
    } else {
      updateDate(widget.dgi.dateid, widget.dgi.image);
    }

    setState(() {
      url = "";
      uploadTask = null;
    });
    Fluttertoast.showToast(msg: "Updated Successfully");
  }

  @override
  void initState() {
    super.initState();
    datecontroller = TextEditingController(
      text: widget.dgi.date,
    );
    guestcontroller = TextEditingController(
      text: widget.dgi.guest,
    );
  }

  @override
  void dispose() {
    datecontroller.dispose();
    guestcontroller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
        key: formKey,
        autovalidateMode: AutovalidateMode.onUserInteraction,
        child: ListView(
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
            Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const SizedBox(
                    height: 20,
                  ),
                  Container(
                    margin: const EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      border: Border.all(
                        width: 2,
                        color: Color.fromARGB(255, 210, 193, 255),
                      ),
                    ),
                    child: Center(
                      child: (pickedFile == null) ? imgNotExist() : imgExist(),
                    ),
                  ),
                  ElevatedButton.icon(
                    style: ElevatedButton.styleFrom(
                      primary: Color.fromARGB(255, 210, 193, 255),
                    ),
                    onPressed: () {
                      selectFile();
                    },
                    icon: const Icon(
                      Icons.camera,
                      color: Colors.black,
                    ),
                    label: const Text(
                      'Add Photo',
                      style: TextStyle(
                        color: Colors.black,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                      top: 5,
                      left: 35,
                    ),
                    child: Row(
                      children: const [
                        Text(
                          'Edit number of guests: ',
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Container(
                    width: 345,
                    height: 50,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        border: Border.all(
                            width: 1,
                            color: Color.fromARGB(255, 210, 193, 255),
                            style: BorderStyle.solid)),
                    child: TextFormField(
                      keyboardType: TextInputType.number,
                      inputFormatters: <TextInputFormatter>[
                        FilteringTextInputFormatter.digitsOnly
                      ],
                      controller: guestcontroller,
                      decoration: const InputDecoration(
                          icon: Padding(
                            padding: EdgeInsets.only(
                              left: 15,
                            ),
                            child: Icon(
                              Icons.people,
                              color: Color.fromARGB(255, 210, 193, 255),
                            ),
                          ),
                          hintText: 'Type here',
                          border: InputBorder.none),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Please enter number of guets';
                        } else if (value.length > 3) {
                          return 'Please try again';
                        }
                        return null;
                      },
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(
                      top: 7,
                      left: 35,
                    ),
                    child: Row(
                      children: const [
                        Text(
                          'Edit date of the event: ',
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Container(
                    width: 345,
                    height: 50,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      border: Border.all(
                          width: 1,
                          color: Color.fromARGB(255, 210, 193, 255),
                          style: BorderStyle.solid),
                    ),
                    child: TextFormField(
                      validator: (value) {
                        if (value!.isEmpty) {
                          return 'Please enter date';
                        }
                        return null;
                      },
                      decoration: const InputDecoration(
                          icon: Padding(
                            padding: EdgeInsets.only(
                              left: 15,
                            ),
                            child: Icon(
                              Icons.date_range,
                              color: Color.fromARGB(255, 210, 193, 255),
                            ),
                          ),
                          hintText: 'Edit event date',
                          border: InputBorder.none),
                      onTap: () {
                        showCupertinoModalPopup(
                          context: context,
                          builder: (context) => CupertinoActionSheet(
                            actions: [buildDatepicker()],
                            cancelButton: CupertinoActionSheetAction(
                              onPressed: () {
                                Navigator.pop(context);
                              },
                              child: const Text('Done'),
                            ),
                          ),
                        );
                      },
                      readOnly: true,
                      controller: datecontroller,
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: SizedBox(
                      // height: 100, //height of button
                      width: 345, //width of button
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            primary: Color.fromARGB(255, 210, 193,
                                255), //background color of button
                            //border width and color
                            elevation: 3, //elevation of button
                            shape: RoundedRectangleBorder(
                                //to set border radius to button
                                borderRadius: BorderRadius.circular(20)),
                            padding: const EdgeInsets.all(
                                15) //content padding inside button
                            ),
                        onPressed: () {
                          if (pickedFile == null) {
                            Fluttertoast.showToast(msg: "Please pick a Theme");
                          } else {
                            uploadFile();
                          }
                        },
                        child: const Text(
                          "Update",
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 18,
                            color: Colors.black,
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 77,
                  ),
                  buildProgress(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildDatepicker() => SizedBox(
        height: 180,
        child: CupertinoDatePicker(
          minimumYear: 1900,
          maximumYear: DateTime.now().year,
          initialDateTime: datetime,
          mode: CupertinoDatePickerMode.date,
          onDateTimeChanged: (datetime) {
            setState(() {
              this.datetime = datetime;
              final value = DateFormat('MM/dd/yyyy').format(datetime);
              datecontroller.text = value;

              // final int age = DateTime.now().year - datetime.year;
              // agecontroller.text = age.toString();
            });
          },
        ),
      );

  updateDate(String id, String urlDownload) {
    final docDate = FirebaseFirestore.instance.collection('Date').doc(id);
    docDate.update({
      'date': datecontroller.text,
      'guest': guestcontroller.text,
      'image': urlDownload,
    });

    Navigator.pop(context);
  }

  Widget imgExist() => Image.file(
        File(pickedFile!.path!),
        width: double.infinity,
        height: 250,
        fit: BoxFit.cover,
      );

  Widget imgNotExist() => Image.asset(
        'assets/images/no-image.png',
        fit: BoxFit.cover,
        height: 250,
      );

  Widget buildProgress() => StreamBuilder<TaskSnapshot>(
      stream: uploadTask?.snapshotEvents,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          final data = snapshot.data!;
          double progress = data.bytesTransferred / data.totalBytes;

          return SizedBox(
            height: 50,
            child: Stack(
              fit: StackFit.expand,
              children: [
                LinearProgressIndicator(
                  value: progress,
                  backgroundColor: Colors.grey,
                  color: Color.fromARGB(255, 210, 193, 255),
                ),
                Center(
                  child: Text(
                    '${(100 * progress).roundToDouble()}%',
                    style: const TextStyle(
                      color: Colors.white,
                    ),
                  ),
                )
              ],
            ),
          );
        } else {
          return const SizedBox(
            height: 50,
          );
        }
      });
}
