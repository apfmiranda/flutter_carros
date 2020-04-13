import 'package:flutter/material.dart';

class AppButton extends StatelessWidget {
  String text;
  Function onPressed;
  bool showProgess;


  AppButton(this.text, {this.onPressed, this.showProgess = false});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 46,
      child: RaisedButton(
        color: Colors.blue,
        child: showProgess
            ? Center(
                child: CircularProgressIndicator(
                  valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
                ),
              )
            : Text(
               text,
               style: TextStyle(color: Colors.white, fontSize: 22),
              ),
        onPressed: onPressed,
      ),
    );
  }
}
