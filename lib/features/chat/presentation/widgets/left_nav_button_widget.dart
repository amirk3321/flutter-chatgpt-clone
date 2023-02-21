import 'package:flutter/material.dart';

class LeftNavButtonWidget extends StatelessWidget {
  final IconData iconData;
  final String textData;
  const LeftNavButtonWidget({Key? key,required this.iconData,required this.textData}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return  Container(
      width: double.infinity,
      padding:
      EdgeInsets.symmetric(horizontal: 15, vertical: 10),
      child: Row(
        children: [
          Icon(iconData,color: Colors.white,size: 20),
          Text(
            "$textData",
            style: TextStyle(color: Colors.white),
          ),
        ],
      ),
    );
  }
}