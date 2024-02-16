import 'package:event_planner/loginpage.dart';
import 'package:event_planner/register.dart';
import 'package:flutter/material.dart';

class Signup extends StatefulWidget {
  const Signup({super.key});

  @override
  State<Signup> createState() => _SignupState();
}

class _SignupState extends State<Signup> {
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
          const SizedBox(
            height: 20,
          ),
          SizedBox(
            child: Expanded(
              child: Image.asset(
                'assets/images/events.png',
              ),
            ),
          ),
          Column(
            children: const [
              Padding(
                padding: EdgeInsets.only(
                  top: 25,
                ),
                child: Text(
                  'Plan your event now!',
                  style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              SizedBox(
                height: 15,
              ),
              Text(
                'Sign up to continue',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.grey,
                ),
              ),
            ],
          ),
          const SizedBox(
            height: 35,
          ),
          Column(
            children: [
              SizedBox(
                width: 350,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      primary: Color.fromARGB(
                          255, 210, 193, 255), //background color of button
                      //border width and color
                      elevation: 3, //elevation of button
                      shape: RoundedRectangleBorder(
                          //to set border radius to button
                          borderRadius: BorderRadius.circular(20)),
                      padding: const EdgeInsets.all(
                          20) //content padding inside button
                      ),
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const Register(),
                      ),
                    );
                  },
                  child: const Text(
                    "Sign up",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                  left: 60,
                ),
                child: Row(
                  children: [
                    const Text(
                      'Already have an account?',
                    ),
                    TextButton(
                      child: const Text(
                        'Sign in',
                        style: TextStyle(
                          color: Color.fromARGB(255, 210, 193, 255),
                        ),
                      ),
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const Loginpage(),
                          ),
                        );
                      },
                    ),
                    const Padding(
                      padding: EdgeInsets.only(
                        right: 15,
                      ),
                      child: Text('instead'),
                    )
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
