


import 'package:flutter/material.dart';
import 'package:flutter_chatgpt_clone/features/app/footer/footer_widget.dart';
import 'package:flutter_chatgpt_clone/features/app/home/widgets/home_content.dart';
import 'package:flutter_chatgpt_clone/features/app/home/widgets/home_header_widget.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          HomeHeaderWidget(),
          SizedBox(
            height: 90,
          ),
          HomeContent(),
          SizedBox(
            height: 90,
          ),
          FooterWidget(),
          SizedBox(
            height: 20,
          ),
        ],
      )
    );
  }
}
