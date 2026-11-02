import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
        CustomButton({ this.OnTap ,required this.title});
String title;
VoidCallback? OnTap;
  @override
  Widget build(BuildContext context) {
    return    GestureDetector(
      onTap: OnTap,
      child: Container(
      width: double.infinity,
      height: 60,
      decoration: BoxDecoration(
      borderRadius: BorderRadius.circular(10),
      color: Colors.blue,
      ),
      child: Center(
      child: Text(title
      ,style: TextStyle(
      fontSize: 20,
          color: Colors.white
      ),)
      ),
      ),
    );
  }
}
