


import 'package:equatable/equatable.dart';

class PromptEntity  extends Equatable{

  final String? title;

  PromptEntity({this.title});


  @override
  List<Object?> get props => [title];


  static List<PromptEntity> exampleListData = [
    PromptEntity(title: "Explain quantum computing in simple terms",),
    PromptEntity(title: "Got any creative ideas for a 10 year old's birthday?",),
    PromptEntity(title: "How do I make an HTTP request in javascript",),
  ];

  static List<PromptEntity> capabilitiesListData = [
    PromptEntity(title: "Remembers what user said earlier in the conversation",),
    PromptEntity(title: "Allows user to provide follow-up corrections",),
    PromptEntity(title: "Trained to decline inappropriate requests",),
  ];
  static List<PromptEntity> limitationListData = [
    PromptEntity(title: "May occasionally generate incorrect information",),
    PromptEntity(title: "May occasionally produce harmful instructions or biased content",),
    PromptEntity(title: "Limited knowledge of world and events after 2021",),
  ];
}