import 'package:flutter_chatgpt_clone/features/chat/domain/entities/chat_conversation_data_entity.dart';

class ChatConversationData extends ChatConversationDataEntity {
  ChatConversationData({String? text, String? finish_reason, num? index})
      : super(text: text, finish_reason: finish_reason, index: index);


  factory ChatConversationData.fromJson(Map<String, dynamic> json) {
    return ChatConversationData(
      text: json['text'],
      index: json['index'],
      finish_reason: json['finish_reason'],
    );
  }
}
