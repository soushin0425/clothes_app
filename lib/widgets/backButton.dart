import 'package:flutter/material.dart';
import '../constraints.dart';

class SquareButtonBuck extends StatelessWidget {
  const SquareButtonBuck({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (() {
        Navigator.pop(context);
      }),
      child: Container(
        margin: EdgeInsets.all(8),
        height: 40,
        width: 40,
        decoration: BoxDecoration(
            color: fontColor,
            borderRadius: BorderRadius.circular(10),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.3),
                blurRadius: 4,
                spreadRadius: 2,
              )
            ]),
        child: Center(
          child: Icon(
            Icons.arrow_back_ios_new,
            color: backgroundColor,
            size: 28,
          ),
        ),
      ),
    );
  }
}
