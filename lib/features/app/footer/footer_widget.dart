


import 'package:flutter/material.dart';
import 'package:flutter_icons/flutter_icons.dart';

class FooterWidget extends StatelessWidget {
  const FooterWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 25,vertical: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Text("OpenAI © 2015–2022",style: TextStyle(fontSize: 18,),),
              Text(" Privacy Policy",style: TextStyle(fontSize: 18,),),
              Text(" Terms of Use",style: TextStyle(fontSize: 18,),),
            ],
          ),
          Row(
            children: [
              Icon(FontAwesome.twitter,size: 20),
              SizedBox(width: 30,),
              Icon(FontAwesome.youtube_play,size: 20,),
              SizedBox(width: 30,),
              Icon(FontAwesome.github,size: 20,),
              SizedBox(width: 30,),
              Icon(FontAwesome.facebook_f,size: 20,),
              SizedBox(width: 30,),
              Icon(FontAwesome.linkedin,size: 20),
              SizedBox(width: 30,),
              Icon(FontAwesome.instagram,size: 20),
              SizedBox(width: 30,),
            ],
          )
        ],
      ),
    );
  }
}
