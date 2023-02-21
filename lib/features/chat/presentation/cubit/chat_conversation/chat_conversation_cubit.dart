import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_chatgpt_clone/core/custom_exception.dart';
import 'package:flutter_chatgpt_clone/features/chat/domain/entities/chat_message_entity.dart';
import 'package:flutter_chatgpt_clone/features/chat/domain/usecases/chat_converstaion_usecase.dart';
import 'package:flutter_chatgpt_clone/features/global/const/app_const.dart';

part 'chat_conversation_state.dart';

class ChatConversationCubit extends Cubit<ChatConversationState> {
  final ChatConversationUseCase chatConversationUseCase;

  ChatConversationCubit({required this.chatConversationUseCase})
      : super(ChatConversationInitial());


  List<ChatMessageEntity> _chatMessages = [];

  Future<void> chatConversation({
    required ChatMessageEntity chatMessage,
    required Function(bool isReqComplete) onCompleteReqProcessing,
  })async{
    try {

      _chatMessages.add(chatMessage);

      emit(
        ChatConversationLoaded(
          chatMessages: _chatMessages,
        ),
      );


      final conversationData = await chatConversationUseCase.call(
          chatMessage.queryPrompt!, onCompleteReqProcessing);


      final chatMessageResponse = ChatMessageEntity(
          messageId: ChatGptConst.AIBot,
          promptResponse: conversationData.choices!.first.text);

      _chatMessages.add(chatMessageResponse);

      emit(ChatConversationLoaded(
        chatMessages: _chatMessages,
      ));


    } on SocketException catch (e) {
      final chatMessageResponse = ChatMessageEntity(
          messageId: ChatGptConst.AIBot, promptResponse: e.message);

      _chatMessages.add(chatMessageResponse);

      emit(ChatConversationLoaded(
        chatMessages: _chatMessages,
      ));
    } on ChatGPTServerException catch (e) {
      final chatMessageResponse = ChatMessageEntity(
          messageId: ChatGptConst.AIBot, promptResponse: e.message);

      _chatMessages.add(chatMessageResponse);

      emit(ChatConversationLoaded(
        chatMessages: _chatMessages,
      ));
    }
  }
}
