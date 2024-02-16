import 'package:flutter/material.dart';

class Profile extends StatelessWidget {
  Profile({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const CircleAvatar(
                backgroundImage: AssetImage(
                  'assets/images/dl.jpg',
                ),
                radius: 40,
              ),
              const Text(
                'Diane Lane P. Cabanilla',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  letterSpacing: 2,
                ),
              ),
              const Text(
                'dianelane@gmail.com',
              ),
              const SizedBox(
                height: 20,
              ),
              infos1,
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text(
                    '150',
                    style: followtxtStyle,
                  ),
                  Text(
                    '99',
                    style: followtxtStyle,
                  ),
                  Text(
                    '369',
                    style: followtxtStyle,
                  ),
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              const Divider(
                color: Colors.grey,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 8.0),
                child: Row(
                  children: [
                    Text('Your Friends', style: followtxtStyle),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 8.0),
                child: Row(
                  children: const [
                    Text('3590 Friends'),
                  ],
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  friend(
                    'assets/images/photo_male_2.jpg',
                    'Pablo Escobar',
                  ),
                  friend(
                    'assets/images/photo_male_3.jpg',
                    'Rebansome Cliff',
                  ),
                  friend(
                    'assets/images/photo_male_4.jpg',
                    'Donny Pangilinan',
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  friend(
                    'assets/images/photo_male_5.jpg',
                    'Dao Ming Sugat',
                  ),
                  friend(
                    'assets/images/photo_male_6.jpg',
                    'Hay Nakoe',
                  ),
                  friend(
                    'assets/images/photo_male_7.jpg',
                    'Ralph Yokich',
                  ),
                ],
              ),
              const SizedBox(
                height: 20,
              ),
              const Divider(
                color: Colors.grey,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 8.0),
                child: Row(
                  children: [
                    Text(
                      'Your Posts',
                      style: followtxtStyle,
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              post(),
              postimage(),
            ],
          ),
        ],
      ),
    );
  }

  var followtxtStyle = const TextStyle(
    fontSize: 20,
    fontWeight: FontWeight.bold,
  );
  var nametxtStyle = const TextStyle(
    fontWeight: FontWeight.bold,
  );
  var infos1 = Row(
    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
    children: const [
      Text('Followers'),
      Text('Posts'),
      Text('Following'),
    ],
  );

  Widget friend(image, text) => Card(
        child: Column(
          children: [
            Image.asset(
              image,
              width: 110,
              height: 110,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(text),
            ),
          ],
        ),
      );

  Widget post() => Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.symmetric(
              horizontal: 10,
            ),
            child: const CircleAvatar(
              radius: 20,
              backgroundImage: AssetImage(
                'assets/images/dl.jpg',
              ),
            ),
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Diane Lane P. Cabanilla',
                style: nametxtStyle,
              ),
              const Text('Nov 8.'),
            ],
          ),
          const Text(
            ' updated his profile picture',
          ),
        ],
      );

  Widget postimage() => Padding(
        padding: const EdgeInsets.all(10.0),
        child: Container(
          height: 350,
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/images/dl.jpg'),
              fit: BoxFit.fill,
            ),
          ),
        ),
      );
}
