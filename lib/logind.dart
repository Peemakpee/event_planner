import 'package:event_planner/Loginsuccess.dart';
import 'package:event_planner/new.dart';
import 'package:event_planner/newsfeed.dart';
import 'package:event_planner/profiled.dart';
import 'package:flutter/material.dart';

class Logind extends StatefulWidget {
  const Logind({super.key});

  @override
  State<Logind> createState() => _LogindState();
}

class _LogindState extends State<Logind> {
  final formKey = GlobalKey<FormState>();
  late TextEditingController txtcontroller2;
  late TextEditingController txtcontroller3;
  String emailError = '';
  String passError = '';

  @override
  void initState() {
    super.initState();
    txtcontroller2 = TextEditingController();
    txtcontroller3 = TextEditingController();
  }

  @override
  void dispose() {
    txtcontroller2.dispose();
    txtcontroller3.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Form(
        key: formKey,
        child: ListView(
          children: [
            Column(
              children: [
                const SizedBox(
                  height: 150,
                ),
                const Text(
                  'LOGIN YOUR ACCOUNT',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 30,
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                TextFormField(
                  controller: txtcontroller2,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: 'Enter Username',
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return "Username can't be empty";
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
                            builder: (context) => Profile(),
                          ),
                        );

                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text('Login Successful'),
                          ),
                        );
                      } else {
// form is invalid, show errors
                        setState(() {
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
                        });
                      }
                    },
                    child: const Text('LOGIN'),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                    left: 120,
                  ),
                  child: Row(
                    children: [
                      Center(
                        child: TextButton(
                          child: const Text(
                            'Create account here',
                            style: TextStyle(
                              color: Color.fromARGB(255, 53, 101, 235),
                            ),
                          ),
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const New(),
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
          ],
        ),
      ),
    );
  }
}
