

import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_chatgpt_clone/features/chat/domain/entities/chat_message_entity.dart';
import 'package:flutter_chatgpt_clone/features/global/const/app_const.dart';
import 'package:flutter_chatgpt_clone/features/global/theme/style.dart';
import 'package:flutter_markdown/flutter_markdown.dart';
import 'package:share_plus/share_plus.dart';

class ChatMessageSingleItem extends StatelessWidget {
  final ChatMessageEntity chatMessage;
  const ChatMessageSingleItem({Key? key,required this.chatMessage}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Animate(
      effects: [
        SlideEffect(begin: Offset(0, 1), duration: Duration(milliseconds: 300))
      ],
      child: _chatMessageItem(context),
    );
  }

  Widget _chatMessageItem(BuildContext context) {
    if (chatMessage.messageId == ChatGptConst.AIBot) {
      return Container(
        padding: EdgeInsets.symmetric(vertical: 25,horizontal: 150),
        decoration: BoxDecoration(
          color: colorGrayLight,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                    height: 35,
                    width: 35,
                    child: ClipRRect(
                        borderRadius: BorderRadius.circular(8),
                        child: Image.asset("assets/openAIChatbot.png"))),
                SizedBox(
                  width: 20,
                ),
                Expanded(
                  child: Container(
                    margin: EdgeInsets.only(bottom: 10, top: 10),
                    child: AnimatedTextKit(
                      totalRepeatCount: 1,
                      repeatForever: false,
                      displayFullTextOnTap: true,
                      isRepeatingAnimation: false,
                      animatedTexts: [
                        TyperAnimatedText(chatMessage.promptResponse!.trim())
                      ],
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 8,
            ),
            Container(
              margin: EdgeInsets.only(left: 50),
              child: Row(
                children: [
                  InkWell(
                      onTap: () {
                        Clipboard.setData(
                            ClipboardData(text: chatMessage.promptResponse));
                        //toast("Copied");
                      },
                      child: Icon(Icons.copy, size: 18)),
                  SizedBox(
                    width: 10,
                  ),
                  InkWell(
                      onTap: () {
                        Share.share(chatMessage.promptResponse!);
                      },
                      child: Icon(Icons.share, size: 18)),
                ],
              ),
            ),
            SizedBox(
              height: 8,
            ),
          ],
        ),
      );
    } else {
      return Container(
        padding: EdgeInsets.symmetric(vertical: 25,horizontal: 150),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              height: 35,
              width: 35,
              decoration: BoxDecoration(
                  color: Colors.blueGrey, borderRadius: BorderRadius.circular(8)),
              child: Center(
                child: Text(
                  "U",
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
            SizedBox(
              width: 20,
            ),
            Expanded(
              child: Container(
                margin: EdgeInsets.only(bottom: 10, top: 10),
                child: MarkdownBody(
                  selectable: true,
                  data: chatMessage.queryPrompt!,
                ),
              ),
            ),
          ],
        ),
      );
    }
  }
}
