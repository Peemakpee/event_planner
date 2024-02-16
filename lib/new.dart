import 'package:event_planner/logind.dart';
import 'package:flutter/material.dart';

class New extends StatefulWidget {
  const New({Key? key}) : super(key: key);

  @override
  _NewState createState() => _NewState();
}

class _NewState extends State<New> {
  final formKey = GlobalKey<FormState>();
  late TextEditingController txtcontroller1,
      txtcontroller2,
      txtcontroller3,
      txtcontroller4,
      txtcontroller5,
      txtcontroller6,
      txtcontroller7;
  String nameError = '';
  String emailError = '';
  String passError = '';
  String confirmPassError = '';
  String genderError = '';
  String civilStatusError = '';
  String bdayError = '';

  @override
  void initState() {
    super.initState();
    txtcontroller1 = TextEditingController();
    txtcontroller2 = TextEditingController();
    txtcontroller3 = TextEditingController();
    txtcontroller4 = TextEditingController();
    txtcontroller5 = TextEditingController();
    txtcontroller6 = TextEditingController();
    txtcontroller7 = TextEditingController();
  }

  @override
  void dispose() {
    super.dispose();
    txtcontroller1.dispose();
    txtcontroller2.dispose();
    txtcontroller3.dispose();
    txtcontroller4.dispose();
    txtcontroller5.dispose();
    txtcontroller6.dispose();
    txtcontroller7.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
        key: formKey,
        child: ListView(
          children: [
            Container(
              padding: EdgeInsets.all(10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Center(
                    child: Text(
                      'REGISTER',
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 50,
                  ),
                  TextFormField(
                    controller: txtcontroller1,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Enter Name',
                      errorText: nameError.isEmpty ? null : nameError,
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Name can't be empty";
                      }
                      return null;
                    },
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  TextFormField(
                    controller: txtcontroller2,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Enter Email',
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Email can't be empty";
                      }
                      if (!value.contains('@')) {
                        return "Invalid email format";
                      }
                      return null;
                    },
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  TextFormField(
                    obscureText: true,
                    controller: txtcontroller3,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Enter Password',
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Password can't be empty";
                      }
                      if (value.length < 6) {
                        return "Password must be at least 6 characters";
                      }
                      return null;
                    },
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  TextFormField(
                    obscureText: true,
                    controller: txtcontroller4,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Enter Confirm Password',
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Confirm Password can't be empty";
                      }
                      if (value != txtcontroller3.text) {
                        return "Passwords do not match";
                      }
                      return null;
                    },
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  TextFormField(
                    controller: txtcontroller5,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Enter Gender',
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Gender can't be empty";
                      }
                      return null;
                    },
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  TextFormField(
                    controller: txtcontroller6,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Enter Civil Status',
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Civil status can't be empty";
                      }
                      return null;
                    },
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  TextFormField(
                    controller: txtcontroller7,
                    decoration: const InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Enter Birthday (mm/dd/yyyy)',
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return "Birthday can't be empty";
                      }
                      return null;
                    },
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () {
                        if (formKey.currentState!.validate()) {
// form is valid, submit data
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => Logind(),
                            ),
                          );
                          // print('Name: ${txtcontroller1.text}');
                          // print('Email: ${txtcontroller2.text}');
                          // print('Password: ${txtcontroller3.text}');
                          // print('Gender: ${txtcontroller5.text}');
                          // print('Civil Status: ${txtcontroller6.text}');
                          // print('Birthday: ${txtcontroller7.text}');
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              content: Text('Registration Successful'),
                            ),
                          );
                        } else {
// form is invalid, show errors
                          setState(() {
                            nameError = txtcontroller1.text.isEmpty
                                ? "Name can't be empty"
                                : '';
                            emailError = txtcontroller2.text.isEmpty
                                ? "Email can't be empty"
                                : !txtcontroller2.text.contains('@')
                                    ? "Invalid email format"
                                    : '';
                            passError = txtcontroller3.text.isEmpty
                                ? "Password can't be empty"
                                : txtcontroller3.text.length < 6
                                    ? "Password must be at least 6 characters"
                                    : '';
                            confirmPassError = txtcontroller4.text.isEmpty
                                ? "Confirm Password can't be empty"
                                : txtcontroller4.text != txtcontroller3.text
                                    ? "Passwords do not match"
                                    : '';
                            genderError = txtcontroller5.text.isEmpty
                                ? "Gender can't be empty"
                                : '';
                            civilStatusError = txtcontroller6.text.isEmpty
                                ? "Civil status can't be empty"
                                : '';
                            bdayError = txtcontroller7.text.isEmpty
                                ? "Birthday can't be empty"
                                : '';
                          });
                        }
                      },
                      child: const Text('Register'),
                    ),
                  ),
                  Center(
                    child: TextButton(
                      child: const Text(
                        'Login Instead',
                        style: TextStyle(
                          color: Color.fromARGB(255, 53, 101, 235),
                        ),
                      ),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => Logind(),
                          ),
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
