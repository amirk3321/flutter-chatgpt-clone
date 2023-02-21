


import 'package:flutter/material.dart';
import 'package:flutter_chatgpt_clone/features/app/navigation_bar/nav_button.dart';
import 'package:flutter_chatgpt_clone/features/global/theme/style.dart';

class ChatGptNavBar extends StatelessWidget {
  const ChatGptNavBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(top: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(height: 70, child: Image.asset("assets/app_logo.png",color: colorPink,)),
          Row(
            children: [
              NavButton(title: "APIS", onTap: (){
                //TODO:
              }),

              SizedBox(
                width: 25,
              ),
              NavButton(title: "RESEARCH", onTap: (){}),
              SizedBox(
                width: 25,
              ),
              NavButton(title: "BLOG",textColor: colorPink.withOpacity(.4)),
              SizedBox(
                width: 25,
              ),
              NavButton(title: "ABOUT", onTap: (){}),
            ],
          )
        ],
      ),
    );;
  }
}
