


import 'package:equatable/equatable.dart';

class ChatConversationDataEntity extends Equatable {

  final String? text;
  final num? index;
  final String? finish_reason;

  ChatConversationDataEntity({this.text, this.index, this.finish_reason});

  @override
  // TODO: implement props
  List<Object?> get props => [text,index,finish_reason];


}