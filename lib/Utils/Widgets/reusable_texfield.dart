import 'package:flutter/material.dart';
import 'package:flutter_svg_icons/flutter_svg_icons.dart';
import 'package:lafyuu/Utils/colors.dart';
import 'package:lafyuu/Utils/validator.dart';




class ResubaleTextfield extends StatefulWidget {
  final Color bordercolor;
  final Color iconcolor;
  final String hinttext;
  final String svgimage;
  final FocusNode focusnode;
  final TextEditingController controller;
  final ValueChanged<String> onchanged;
  final bool obscuretext;
  
  
  const ResubaleTextfield({ Key? key,required this.focusnode,required this.obscuretext,required this.bordercolor,required this.iconcolor ,required this.hinttext,required this.svgimage,required this.controller, required this.onchanged}) : super(key: key);

  @override
  State<ResubaleTextfield> createState() => _ResubaleTextfieldState();
}

class _ResubaleTextfieldState extends State<ResubaleTextfield> {

  AppColors colors = AppColors();
  

  @override
  Widget build(BuildContext context) {
    return  Padding(
        padding: const EdgeInsets.only(left:16, right: 16,),
        child: TextFormField(
          validator: (value){
              if (EmailValid.validate(value.toString()) == false){
                  return 'Enter a valid Email';
              }
              if (value!.isEmpty){
                return "Enter Email";
              }
          },
          obscureText: widget.obscuretext ,
          focusNode: widget.focusnode,
          onChanged: widget.onchanged,
          controller: widget.controller ,
          decoration: InputDecoration(
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(5),
              borderSide: BorderSide(
                color: widget.bordercolor
              )
            ),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(5),
              
            ),
            hintText: widget.hinttext,
            prefixIcon: Padding(
              padding: const EdgeInsets.all(8.0),
              child: SvgIcon(
                color: widget.iconcolor,
                icon: SvgIconData(widget.svgimage),
              ),
            ),
          ),
        ),
      );
  }
}