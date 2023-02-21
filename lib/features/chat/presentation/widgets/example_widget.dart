


import 'package:flutter/material.dart';
import 'package:flutter_chatgpt_clone/features/chat/domain/entities/prompt_entitiy.dart';
import 'package:flutter_chatgpt_clone/features/global/provider/high_order_functions.dart';
import 'package:flutter_chatgpt_clone/features/global/theme/style.dart';
import 'package:flutter_icons/flutter_icons.dart';

class ExampleWidget extends StatefulWidget {
  final OnMessageController onMessageController;

  const ExampleWidget({Key? key, required this.onMessageController})
      : super(key: key);

  @override
  State<ExampleWidget> createState() => _ExampleWidgetState();
}

class _ExampleWidgetState extends State<ExampleWidget> {
  int _itemHoverIndex = -1;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 120),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              height: 140,
            ),
            Text(
              "ChatGPT",
              style: TextStyle(fontSize: 38, fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: 60,
            ),
            Expanded(
              child: Row(
                children: [
                  _rowItem(
                      icon: Icons.light_mode_outlined,
                      title: "Examples",
                      data: PromptEntity.exampleListData,
                      isClickAble: true),
                  _rowItem(
                      icon: SimpleLineIcons.energy,
                      title: "Capabilities",
                      data: PromptEntity.capabilitiesListData,
                      isClickAble: false),
                  _rowItem(
                      icon: AntDesign.warning,
                      title: "Limitation",
                      data: PromptEntity.limitationListData,
                      isClickAble: false),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget _rowItem({required IconData icon,
    required String title,
    required List<PromptEntity> data,
    required bool isClickAble}) {
    return Expanded(
      child: Column(
        children: [
          Icon(
            icon,
            size: 40,
          ),
          SizedBox(
            height: 10,
          ),
          Text(
            "$title",
            style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          SizedBox(
            height: 20,
          ),
          Expanded(
            child: ListView.builder(
              shrinkWrap: true,
              physics: ScrollPhysics(),
              itemCount: data.length,
              itemBuilder: (context, index) {
                final prompt = data[index];
                return InkWell(
                  hoverColor: Colors.transparent,
                  onHover: isClickAble == false
                      ? null
                      : (value) {
                    setState(() {
                      _itemHoverIndex = value == true ? index : -1;
                    });
                  },
                  onTap: isClickAble == false
                      ? null
                      : () {
                    widget.onMessageController(prompt.title!);
                  },
                  child: Container(
                    margin: EdgeInsets.symmetric(horizontal: 40, vertical: 3),
                    child: Card(
                      color: _itemHoverIndex == index && isClickAble == true
                          ? Colors.black87
                          : colorDarkGray,
                      child: Container(
                        padding:
                        EdgeInsets.symmetric(horizontal: 15, vertical: 15),
                        child: Text("${prompt.title}"),
                      ),
                    ),
                  ),
                );
              },
            ),
          )
        ],
      ),
    );
  }
}