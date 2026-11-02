import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
 CustomTextField({this.onChanged,this.hintText,this.type});
 String ? hintText;
 TextInputType ? type;
Function (String)? onChanged;
  @override
  Widget build(BuildContext context) {
    return       TextField(
      keyboardType: type,
      onChanged: onChanged,
      decoration: InputDecoration(
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide(
                
                color:Colors.black
            )
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(
              color:Colors.black
                  
          ),
        ),
        hint:Text(hintText!
          ,style: TextStyle(
            color:Colors.grey,
            fontSize: 15,
          ),
        ),
      ),
    )
      ;
  }
}
