import 'package:flutter/material.dart';
import 'package:lafyuu/Utils/colors.dart';



class Review extends StatelessWidget {
  const Review({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {


    AppColors colors = AppColors();

    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Padding(
        padding: const EdgeInsets.only(left:16,right:16,top:16),
        child: Row(
          children: [
            GestureDetector(
                          onTap: (){
                            Navigator.pop(context);
                          },
                          child: Icon(Icons.arrow_back_ios,color: colors.textcolor1,size: 20,)
                          ),
                        const SizedBox(width: 12,),
            Text('5 Review',style:TextStyle(
              color: colors.textcolor2,
              fontWeight: FontWeight.w700,
              fontSize: 16
            )),
          ],
        ),
      ),

          const SizedBox(
                    height: 25,
                    child: Divider(),
                  ),

            ],
          ),
        ),
      ),
    );
  }
}