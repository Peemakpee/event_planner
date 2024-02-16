import 'package:flutter/material.dart';
// import 'package:flutter_application_it14l/comment.dart';
// import 'package:flutter_application_it14l/comment1.dart';

class Newsfeed extends StatefulWidget {
  const Newsfeed({
    super.key,
  });

  @override
  State<Newsfeed> createState() => _NewsfeedState();
}

class _NewsfeedState extends State<Newsfeed> {
  late bool isClicked;
  late bool isClick;

  @override
  void initState() {
    super.initState();
    isClicked = false;
    isClick = false;
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    const CircleAvatar(
                      radius: 20,
                      backgroundImage: AssetImage(
                        'assets/images/photo_male_1.jpg',
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 5, bottom: 5),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Rebandsome Cliff',
                            style: txtStyle1,
                          ),
                          Row(
                            children: [
                              Text(
                                '9h .',
                                style: txtStyle2,
                              ),
                              const Padding(
                                padding: EdgeInsets.only(
                                  left: 5,
                                ),
                                child: Padding(
                                  padding: EdgeInsets.only(top: 1.5),
                                  child: Icon(
                                    Icons.people,
                                    size: 15,
                                    color: Color.fromARGB(255, 115, 115, 115),
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
              Container(
                margin: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                child: Row(
                  children: const [
                    Text('Friends for keeps!'),
                  ],
                ),
              ),
              // GestureDetector(
              //   onTap: () {
              //     Navigator.push(
              //       context,
              //       MaterialPageRoute(
              //         builder: (context) => Comment(liked: isClicked),
              //       ),
              //     );
              //   },
              //   child: Padding(
              //     padding: const EdgeInsets.all(10),
              //     child: Expanded(
              //       child: Image.asset('assets/images/image_25.jpg'),
              //     ),
              //   ),
              // ),
              Padding(
                padding: const EdgeInsets.only(
                  left: 230,
                ),
                child: Row(
                  children: [
                    Text(
                      '5 comments',
                      style: txtStyle2,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                        left: 5,
                      ),
                      child: Text(
                        '100 shares',
                        style: txtStyle2,
                      ),
                    ),
                  ],
                ),
              ),
              const Divider(
                color: Color.fromARGB(255, 209, 199, 199),
              ),
              Padding(
                padding: const EdgeInsets.only(
                  left: 32,
                ),
                child: Row(
                  children: [
                    TextButton.icon(
                      onPressed: () {
                        setState(() {
                          isClicked = !isClicked;
                        });
                      },
                      icon: Icon(
                        Icons.thumb_up_sharp,
                        color: (isClicked) ? Colors.blue : Colors.grey,
                        size: 21,
                      ),
                      label: const Text('Like'),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                        left: 32,
                      ),
                      child: TextButton.icon(
                        onPressed: () {
                          // Navigator.push(
                          //   context,
                          //   MaterialPageRoute(
                          //     builder: (context) => Comment(liked: isClicked),
                          //   ),
                          // );
                        },
                        icon: const Icon(
                          Icons.mode_comment_rounded,
                          color: Colors.grey,
                          size: 21,
                        ),
                        label: const Text('Comment'),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                        left: 18,
                      ),
                      child: TextButton.icon(
                        onPressed: () {},
                        icon: const Icon(
                          Icons.forward_rounded,
                          color: Colors.grey,
                          size: 28,
                        ),
                        label: const Text('Share'),
                      ),
                    ),
                  ],
                ),
              ),
              const Divider(
                color: Color.fromARGB(255, 241, 240, 240),
                thickness: 10,
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    const CircleAvatar(
                      radius: 20,
                      backgroundImage: AssetImage(
                        'assets/images/photo_male_3.jpg',
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 5, bottom: 5),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Cliff Sama',
                            style: txtStyle1,
                          ),
                          Row(
                            children: [
                              Text(
                                '3h .',
                                style: txtStyle2,
                              ),
                              const Padding(
                                padding: EdgeInsets.only(
                                  left: 5,
                                ),
                                child: Padding(
                                  padding: EdgeInsets.only(top: 1.5),
                                  child: Icon(
                                    Icons.people,
                                    size: 15,
                                    color: Color.fromARGB(255, 115, 115, 115),
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
              Container(
                margin: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                child: Row(
                  children: const [
                    Text('3 cups of coffee a day keeps the doctor away!'),
                  ],
                ),
              ),
              GestureDetector(
                onTap: () {
                  // Navigator.push(
                  //   context,
                  //   MaterialPageRoute(
                  //     builder: (context) => Comment1(like: isClick),
                  //   ),
                  // );
                },
                child: Padding(
                  padding: const EdgeInsets.all(10),
                  child: Expanded(
                    child: Image.asset('assets/images/image_10.jpg'),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                  left: 250,
                ),
                child: Row(
                  children: [
                    Text(
                      '1 comment',
                      style: txtStyle2,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                        left: 15,
                      ),
                      child: Text(
                        '1 share',
                        style: txtStyle2,
                      ),
                    ),
                  ],
                ),
              ),
              const Divider(
                color: Color.fromARGB(255, 209, 199, 199),
              ),
              Padding(
                padding: const EdgeInsets.only(
                  left: 32,
                ),
                child: Row(
                  children: [
                    TextButton.icon(
                      onPressed: () {
                        setState(() {
                          isClick = !isClick;
                        });
                      },
                      icon: Icon(
                        Icons.thumb_up_sharp,
                        color: (isClick) ? Colors.blue : Colors.grey,
                        size: 21,
                      ),
                      label: const Text('Like'),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                        left: 32,
                      ),
                      child: TextButton.icon(
                        onPressed: () {
                          // Navigator.push(
                          //   context,
                          //   MaterialPageRoute(
                          //     builder: (context) => Comment1(like: isClick),
                          //   ),
                          // );
                        },
                        icon: const Icon(
                          Icons.mode_comment_rounded,
                          color: Colors.grey,
                          size: 21,
                        ),
                        label: const Text('Comment'),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(
                        left: 18,
                      ),
                      child: TextButton.icon(
                        onPressed: () {},
                        icon: const Icon(
                          Icons.forward_rounded,
                          color: Colors.grey,
                          size: 28,
                        ),
                        label: const Text('Share'),
                      ),
                    ),
                  ],
                ),
              ),
              const Divider(
                color: Color.fromARGB(255, 241, 240, 240),
                thickness: 10,
              ),
            ],
          ),
        ],
      ),
    );
  }

  var txtStyle1 = const TextStyle(
    color: Colors.black,
    fontSize: 17,
    fontWeight: FontWeight.bold,
    letterSpacing: 0.5,
  );

  var txtStyle2 = const TextStyle(
    fontSize: 14,
    color: Color.fromARGB(255, 82, 81, 81),
  );
}
