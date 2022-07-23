import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:quiz_app/Screens/quiz_screen.dart';
import 'package:rating_dialog/rating_dialog.dart';

import '../widgets/drawer.dart';

class MyHomeScreen extends StatefulWidget {
  const MyHomeScreen({Key? key}) : super(key: key);

  @override
  _MyHomeScreenState createState() => _MyHomeScreenState();
}

class _MyHomeScreenState extends State<MyHomeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xffa35add),
        foregroundColor: Color(0xffFFDF2B),
        title: Center(
          child: Text(
            'My Quiz App',
            style: TextStyle(
              fontSize: 26,

            ),
          ),
        ),
        actions: [
          IconButton(
            icon: const Icon(
              Icons.star,
              size: 40,
            ),
            onPressed: () {
              showDialog(
                context: context,
                barrierDismissible: true,
                // set to false if you want to force a rating
                builder: (context) => RatingDialog(
                  initialRating: 1.0,
                  title: Text(
                    'My Quiz',
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      fontSize: 40,
                      fontFamily: 'e',
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  message: Text(
                    'Tap a star to set your rating. Add more description here if you want.',
                    textAlign: TextAlign.center,
                    style: const TextStyle(fontSize: 19, fontFamily: 'a'),
                  ),
                  // your app's logo?
                  image: Image.asset('assets/stars.jpg'),
                  submitButtonText: 'Submit',
                  commentHint: 'Write your review about our app',
                  onCancelled: () => print('cancelled'),
                  onSubmitted: (response) {
                    print(
                        'rating: ${response.rating}, comment: ${response.comment}');
                  },
                ),
              );
            },
          ),
        ],
      ),
      drawer: AppDrawer(),
      body: Center(
        child: Stack(
          alignment: AlignmentDirectional.center,
          children: [
            Image.asset(
              'assets/quiz.png',
              width: double.infinity,
              height: double.infinity,
              fit: BoxFit.cover,
            ),
            Positioned(
              bottom: 100,
              child: Container(
                height: 50,
                width: 300,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    primary: Color(0xffFFDF2B),
                    onPrimary: Colors.purple,
                    padding: EdgeInsets.all(0.0),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16),
                      side: BorderSide(
                        color: Colors.purple,
                        width: 2,
                      ),
                    ),
                  ),
                  child: Ink(
                    child: Container(
                      width: double.infinity,
                      margin: EdgeInsets.symmetric(horizontal: 16),
                      // padding: EdgeInsets.all(16),
                      child: Text(
                        'Start Quiz',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                             fontSize: 30, fontFamily: 'b'),
                      ),
                    ),
                  ),
                  onPressed: () {
                    Navigator.of(context)
                        .push(MaterialPageRoute(builder: (context) {
                      return QuizScreen();
                    }));
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
