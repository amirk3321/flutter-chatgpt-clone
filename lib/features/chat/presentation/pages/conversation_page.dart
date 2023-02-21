


import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_chatgpt_clone/features/chat/domain/entities/chat_message_entity.dart';
import 'package:flutter_chatgpt_clone/features/chat/presentation/cubit/chat_conversation/chat_conversation_cubit.dart';
import 'package:flutter_chatgpt_clone/features/chat/presentation/widgets/chat_message_single_item.dart';
import 'package:flutter_chatgpt_clone/features/chat/presentation/widgets/example_widget.dart';
import 'package:flutter_chatgpt_clone/features/chat/presentation/widgets/left_nav_button_widget.dart';
import 'package:flutter_chatgpt_clone/features/global/common/common.dart';
import 'package:flutter_chatgpt_clone/features/global/const/app_const.dart';
import 'package:flutter_chatgpt_clone/features/global/custom_text_field/custom_text_field.dart';

class ConversationPage extends StatefulWidget {
  const ConversationPage({Key? key}) : super(key: key);

  @override
  State<ConversationPage> createState() => _ConversationPageState();
}

class _ConversationPageState extends State<ConversationPage> {

  TextEditingController _messageController = TextEditingController();
  bool _isRequestProcessing = false;

  ScrollController _scrollController = ScrollController();


  @override
  void dispose() {
    _messageController.dispose();
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {

    if (_scrollController.hasClients) {
      Timer(
        Duration(milliseconds: 100),
            () => _scrollController.animateTo(
            _scrollController.position.maxScrollExtent,
            duration: Duration(milliseconds: 500),
            curve: Curves.decelerate),
      );
    }

    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: Row(
              children: [
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                  width: 300,
                  decoration: BoxDecoration(
                      boxShadow: glowBoxShadow, color: Colors.black87),
                  child: Column(
                    children: [
                      Container(
                        width: double.infinity,
                        decoration: BoxDecoration(
                            border: Border.all(color: Colors.white, width: 1),
                            borderRadius: BorderRadius.circular(10)),
                        padding:
                        EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                        child: Text(
                          "+ New Chat",
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                      Spacer(),
                      SizedBox(
                        height: 10,
                      ),
                      Container(
                        height: 0.50,
                        width: double.infinity,
                        decoration: BoxDecoration(color: Colors.white70),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      LeftNavButtonWidget(
                          iconData: Icons.delete_outline_outlined,
                          textData: "Clear Conversation"),
                      SizedBox(
                        height: 10,
                      ),
                      LeftNavButtonWidget(
                          iconData: Icons.nightlight_outlined,
                          textData: "Dark Mode"),
                      SizedBox(
                        height: 10,
                      ),
                      LeftNavButtonWidget(
                          iconData: Icons.ios_share_sharp,
                          textData: "Update & FAQ"),
                      SizedBox(
                        height: 10,
                      ),
                      LeftNavButtonWidget(
                          iconData: Icons.exit_to_app, textData: "Log out"),
                      SizedBox(
                        height: 10,
                      ),
                    ],
                  ),
                ),
                Expanded(
                    child: Container(
                      decoration:
                      BoxDecoration(color: Color.fromRGBO(52, 53, 64, 1)),
                      child: Column(
                        children: [
                          Expanded(
                            child: BlocBuilder<ChatConversationCubit, ChatConversationState>(
                                builder: (context, chatConversationState) {
                                  if (chatConversationState is ChatConversationLoaded) {

                                    final chatMessages =
                                        chatConversationState.chatMessages;

                                    if (chatMessages.isEmpty) {
                                      return ExampleWidget(
                                        onMessageController: (message) {
                                          setState(() {
                                            _messageController.value =
                                                TextEditingValue(text: message);
                                          });
                                        },
                                      );
                                    } else {
                                      return Container(
                                        child: ListView.builder(
                                          itemCount: _calculateListItemLength(
                                              chatMessages.length),
                                          controller: _scrollController,
                                          itemBuilder: (context, index) {
                                            if (index >= chatMessages.length) {
                                              return _responsePreparingWidget();
                                            } else {
                                              return ChatMessageSingleItem(
                                                chatMessage: chatMessages[index],
                                              );
                                            }
                                          },
                                        ),
                                      );
                                    }
                                  }
                                  return ExampleWidget(
                                    onMessageController: (message) {
                                      setState(() {
                                        _messageController.value =
                                            TextEditingValue(text: message);
                                      });
                                    },
                                  );
                                }),
                          ),
                          CustomTextField(
                            isRequestProcessing: _isRequestProcessing,
                            textEditingController: _messageController,
                            onTap: () async {
                              _promptTrigger();
                            },
                          ),
                          Container(
                            margin: EdgeInsets.symmetric(horizontal: 90),
                            child: Text(
                              "ChatGPT Jan 30 Version. Free Research Preview. Our goal is to make AI systems more natural and safe to interact with. Your feedback will help us improve.",
                              style: TextStyle(color: Colors.grey, fontSize: 13),
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                        ],
                      ),
                    ))
              ],
            ),
          )
        ],
      ),
    );
  }


  int _calculateListItemLength(int length) {
    if (_isRequestProcessing == false) {
      return length;
    } else {
      return length + 1;
    }
  }

  Widget _responsePreparingWidget() {
    return Container(
      height: 60,
      child: Image.asset("assets/loading_response.gif"),
    );
  }

  void _promptTrigger() {
    if (_messageController.text.isEmpty) {
      return;
    }

    final humanChatMessage = ChatMessageEntity(
      messageId: ChatGptConst.Human,
      queryPrompt: _messageController.text,
    );

    BlocProvider.of<ChatConversationCubit>(context)
        .chatConversation(
        chatMessage: humanChatMessage,
        onCompleteReqProcessing: (isRequestProcessing) {
          setState(() {
            _isRequestProcessing = isRequestProcessing;
          });
        })
        .then((value) {
      setState(() {
        _messageController.clear();
      });
      if (_scrollController.hasClients) {
        Timer(
          Duration(milliseconds: 100),
              () => _scrollController.animateTo(
              _scrollController.position.maxScrollExtent,
              duration: Duration(milliseconds: 500),
              curve: Curves.decelerate),
        );
      }
    });
  }
}
