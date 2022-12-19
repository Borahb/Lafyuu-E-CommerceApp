import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';



class ResubaleButton1 extends StatelessWidget {
  final Color textcolor;
  final Color buttoncolor;
  final Color bordercolor;
  final String text;
  final String image;
  final VoidCallback onpressed;
  const ResubaleButton1({ Key? key, required this.textcolor,required this.bordercolor , required this.buttoncolor, required this.image,required this.text,required this.onpressed}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left:16,right:16),
      child: GestureDetector(
        onTap: onpressed,
        child: Container(
          height: 57,
          decoration: BoxDecoration(
            color: buttoncolor,
            borderRadius: BorderRadius.circular(5),
            border: Border.all(
              color: bordercolor
            )
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Image.asset(image,),
                ),
                Text(text, style: TextStyle(
                  color: textcolor,
                  fontSize: 14,
                  fontWeight: FontWeight.bold
                ),),
                Container(width: 20,)
            ],
          ),
        ),
      ),
    );
  }
}