



import 'package:flutter_chatgpt_clone/features/chat/domain/entities/chat_converstaion_entity.dart';

abstract class ChatRepository{
  Future<ChatConversationEntity> chatConversation(
      String prompt,
      Function(bool isReqComplete) onCompleteReqProcessing,
      );
}