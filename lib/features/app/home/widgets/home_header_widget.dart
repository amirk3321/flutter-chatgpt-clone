

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_chatgpt_clone/features/app/navigation_bar/chat_gpt_nav_bar.dart';
import 'package:flutter_chatgpt_clone/features/global/const/page_const.dart';
import 'package:flutter_chatgpt_clone/features/global/theme/style.dart';

class HomeHeaderWidget extends StatelessWidget {
  const HomeHeaderWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 25),
      decoration: BoxDecoration(
          color: colorDarkGreen
      ),
      child: Column(
        children: [
          ChatGptNavBar(),
          SizedBox(height: 90,),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: Container(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(right: 90),
                        child: Text(
                          "ChatGPT: Optimizing Language Models\nfor Dialogue",
                          style: TextStyle(fontSize: 45, fontWeight: FontWeight.w400,color: colorPink),
                        ),
                      ),
                      SizedBox(
                        height: 30,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(right: 60),
                        child: _bodyTextData(),
                      ),
                      SizedBox(
                        height: 30,
                      ),
                      InkWell(
                        onTap: (){
                          Navigator.pushNamed(context, PageConst.conversationPage);
                        },
                        child: Container(
                          width: 160,
                          padding: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                          decoration: BoxDecoration(
                              color: colorPink
                          ),
                          child: Row(
                            children: [
                              Text(
                                "TRY CHATGPT",
                                style: TextStyle(color: Colors.black),
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              Icon(
                                Icons.call_made_outlined,
                                color: Colors.black,
                                size: 20,
                              ),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 200,
                      ),
                      Text(
                        "November 30, 2022\n13 minute read",
                        style: TextStyle(color: colorPink, fontSize: 16),
                      ),
                    ],
                  ),
                ),
              ),
              Expanded(
                child: Image.asset("assets/chatgpt_img.jpeg"),
              ),
            ],
          ),
          SizedBox(height: 60,)
        ],
      ),
    );
  }

  Widget _bodyTextData() {
    return RichText(
      text: TextSpan(
        children: [
          TextSpan(
            text:
            "We’ve trained a model called ChatGPT which interacts in a conversational way. The dialogue format makes it possible for ChatGPT to answer followup questions, admit its mistakes, challenge incorrect premises, and reject inappropriate requests. ChatGPT is a sibling model to ",
            style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w400,
                color: colorPink
            ),
          ),
          TextSpan(
            text: "InstructGPT",
            style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w400,
                color: colorPink,
                decoration: TextDecoration.underline),
            mouseCursor: SystemMouseCursors.click,
            recognizer: TapGestureRecognizer()
              ..onTap = () {
                // single tapped
              },
          ),
          TextSpan(
            text:
            ", which is trained to follow an instruction in a prompt and provide a detailed response.",
            style: TextStyle(
                fontSize: 20, fontWeight: FontWeight.w400, color: colorPink),
          ),
        ],
      ),
    );
  }
}
