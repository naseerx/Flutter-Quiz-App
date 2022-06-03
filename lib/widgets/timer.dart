import 'package:awesome_dialog/awesome_dialog.dart';
import 'package:circular_countdown_timer/circular_countdown_timer.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class MyTimer extends StatelessWidget {
  const MyTimer({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CircularCountDownTimer(
      duration: 120,
      isReverse: true,
      controller: CountDownController(),
      width: 75,
      height: 75,
      ringColor: Color(0xffe2cafa),
      fillColor: Color(0xffa35add),
      backgroundColor: Colors.white,
      strokeWidth: 7.0,
      strokeCap: StrokeCap.round,
      textStyle: TextStyle(
        fontSize: 23.0,
        color: Color(0xffa35add),
        fontWeight: FontWeight.bold,
      ),
      textFormat: CountdownTextFormat.MM_SS,
      onComplete: () {
        AwesomeDialog(
            context: context,
            dialogType: DialogType.ERROR,
            animType: AnimType.RIGHSLIDE,
            headerAnimationLoop: true,
            title: 'Error',
            desc:
            'Time Out!\nYou have to solve every quiz in the given time\nPlease try again ',
            btnOkOnPress: () {
              Navigator.of(context).pop();
            },
            btnOkIcon: Icons.arrow_back,
            btnOkColor: Colors.red)
          ..show();
      },
    );
  }
}