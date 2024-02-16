import 'package:flutter/material.dart';

class Try extends StatelessWidget {
  const Try({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'My Sixth',
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Title 6'),
        ),
        body: Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Image.asset(
                  'assets/images/wedding.png',
                ),
              ),
              Expanded(
                child: Image.asset(
                  'assets/images/photo_male_2.jpg',
                ),
              ),
              Expanded(
                child: Image.asset(
                  'assets/images/photo_male_3.jpg',
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
