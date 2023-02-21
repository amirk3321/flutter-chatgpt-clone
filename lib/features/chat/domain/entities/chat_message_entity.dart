

import 'package:equatable/equatable.dart';

class ChatMessageEntity extends Equatable {

  final String? messageId;
  final String? queryPrompt;
  final String? promptResponse;

  ChatMessageEntity({this.messageId, this.queryPrompt, this.promptResponse});


  @override
  List<Object?> get props => [messageId, queryPrompt, promptResponse];

}