import 'dart:math';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

import '../widgets/timer.dart';


class QuizScreen extends StatefulWidget {
  const QuizScreen({Key? key}) : super(key: key);

  @override
  _QuizScreenState createState() => _QuizScreenState();
}

class _QuizScreenState extends State<QuizScreen> {
  int? randomNumber, randomNumber2;
  var counter = 0;
  var ans = TextEditingController();
  var scour = 0;
  var rightAns = 0;
  var wrongAns = 0;
  var isVisible = false;
  var random = Random();

  @override
  Widget build(BuildContext context) {
    randomNumber = random.nextInt(8) + 2;
    randomNumber2 = random.nextInt(8) + 2;
    counter++;
    return Scaffold(
      backgroundColor: const Color(0xffe2cafa),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: SizedBox(
            height: double.infinity,
            width: double.infinity,
            child: Container(
              decoration: BoxDecoration(
                boxShadow: const [
                  BoxShadow(
                    color: Colors.teal,
                    spreadRadius: 0.1,
                    blurRadius: 8,
                  ),
                ],
                color: Colors.white,
                borderRadius: BorderRadius.circular(40),
                border: Border.all(
                  color: const Color(0xffe3ebfa),
                  width: 14,
                ),
              ),
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Visibility(
                      visible: !isVisible,
                      child: Stack(
                        clipBehavior: Clip.none,
                        children: [
                          Container(
                            decoration: BoxDecoration(
                              color: const Color(0xffa35add),
                              borderRadius: BorderRadius.circular(30),
                            ),
                            height: 280,
                            width: double.infinity,
                            child: Column(
                              children: [
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    IconButton(
                                      onPressed: () {
                                        Navigator.pop(context);
                                      },
                                      icon: Icon(
                                        Icons.arrow_back,
                                        color: Colors.white,
                                        size: 38,
                                      ),
                                    ),
                                  ],
                                ),
                                Text(
                                  'See Carefully!',
                                  style: TextStyle(
                                    fontSize: 30,
                                    color: Colors.white,
                                  ),
                                )
                              ],
                            ),
                          ),
                          Positioned(
                            top: 170,
                           left: 20,
                            right: 20,
                            child: Container(
                              height: 220,
                              width: 300,
                              decoration: BoxDecoration(
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.teal,
                                    spreadRadius: 1,
                                    blurRadius: 8,
                                  ),
                                ],
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  SizedBox(
                                    height: 0,
                                  ),
                                  Visibility(
                                    visible: !isVisible,
                                    child: Text(
                                      'Question $counter/15',
                                      style: TextStyle(
                                        fontSize: 20,
                                        color: Color(0xffa35add),
                                      ),
                                    ),
                                  ),
                                  Visibility(
                                    visible: !isVisible,
                                    child: Text(
                                      '$randomNumber X $randomNumber2 = ?',
                                      style: TextStyle(
                                        fontSize: 30,
                                        color: Color(0xffa35add),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Positioned(
                            top: 125,
                            left: 10,
                            right: 10,
                            child: Visibility(
                              visible: !isVisible,
                              child: CircleAvatar(
                                backgroundColor: Colors.white,
                                radius: 47,
                                child: MyTimer(),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 150),
                      child: Column(
                        children: [
                          Container(
                            margin: EdgeInsets.only(left: 60, right: 60),
                            child: Visibility(
                              visible: !isVisible,
                              child: TextFormField(
                                controller: ans,
                                keyboardType: TextInputType.number,
                                decoration: InputDecoration(
                                  hintText: 'Enter Your Answer',
                                  fillColor: Color(0xffe2cafa),
                                  filled: true,
                                  border: InputBorder.none,
                                ),
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Visibility(
                            visible: !isVisible,
                            child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                  elevation: 12,
                                  shadowColor: Colors.red,
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(20))),
                              child: Text(
                                'Checked',
                                style: TextStyle(fontSize: 30, fontFamily: 'b'),
                              ),
                              onPressed: () {
                                if(ans.text.isEmpty){
                                  Fluttertoast.showToast(msg: 'Please entre Answer');

                                }else{
                                  var result = ans.text;
                                  var multi = randomNumber! * randomNumber2!;
                                  if (result == multi.toString()) {
                                    Fluttertoast.showToast(
                                      msg: 'correct answer',
                                      toastLength: Toast.LENGTH_SHORT,
                                      gravity: ToastGravity.BOTTOM,
                                      timeInSecForIosWeb: 1,
                                      backgroundColor: Colors.green,
                                      textColor: Colors.white,
                                      fontSize: 16.0,
                                    );
                                    scour++;
                                    rightAns++;
                                  } else {
                                    Fluttertoast.showToast(
                                      msg: 'Wrong answer',
                                      toastLength: Toast.LENGTH_SHORT,
                                      gravity: ToastGravity.BOTTOM,
                                      timeInSecForIosWeb: 1,
                                      backgroundColor: Colors.red,
                                      textColor: Colors.white,
                                      fontSize: 16.0,
                                    );
                                    wrongAns++;
                                  }
                                  if (counter == 15) {
                                    isVisible = !isVisible;
                                  }
                                  ans.clear();
                                  setState(() {

                                  });
                                }



                              },
                            ),
                          ),
                          Visibility(
                            visible: isVisible,
                            child: Text(
                              'Your Result:',
                              style: TextStyle(
                                color: Colors.purple,
                                fontSize: 22,
                                fontWeight: FontWeight.bold,
                                fontStyle: FontStyle.italic
                              ),
                              textAlign: TextAlign.center,
                            ),
                          ),
                          Visibility(
                            visible: isVisible,
                            child: Container(
                              padding: EdgeInsets.all(15),
                              width: 300,
                              margin: EdgeInsets.all(16),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(16),
                                color: Color(0xffa35add),
                              ),
                              child: Text(
                                'Right Answers:$rightAns',
                                style: TextStyle(
                                  fontSize: 20,
                                  fontFamily: 'b',
                                ),
                              ),
                            ),
                          ),
                          Visibility(
                            visible: isVisible,
                            child: Container(
                              padding: EdgeInsets.all(15),
                              width: 300,
                              margin: EdgeInsets.all(16),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(16),
                                color: Color(0xffa35add),
                              ),
                              child: Text(
                                'Wrong answers:$wrongAns',
                                style: TextStyle(
                                  fontSize: 20,
                                  fontFamily: 'b',
                                ),
                              ),
                            ),
                          ),
                          Visibility(
                            visible: isVisible,
                            child: Container(
                              padding: EdgeInsets.all(15),
                              width: 300,
                              margin: EdgeInsets.all(16),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(16),
                                color: Color(0xffa35add),
                              ),
                              child: Text(
                                'your scour:$scour',
                                style: TextStyle(
                                  fontSize: 20,
                                  fontFamily: 'b',
                                ),
                              ),
                            ),
                          ),
                          Visibility(
                            visible: isVisible,
                            child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                  elevation: 12,
                                  shadowColor: Colors.red,
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(20))),
                              onPressed: () {
                                Navigator.of(context).pop();
                              },
                              child: Text(
                                'ReStart',
                                style: TextStyle(
                                  fontSize: 35,
                                  fontFamily: 'd',
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
