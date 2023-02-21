import 'package:flutter/material.dart';
import 'package:flutter_chatgpt_clone/features/global/theme/style.dart';

class NavButton extends StatelessWidget {
  final String title;
  final VoidCallback? onTap;
  final Color? textColor;

  const NavButton({Key? key, required this.title, this.onTap, this.textColor})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Text(
        title,
        style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.w500,
            color: textColor == null ? colorPink : textColor),
      ),
    );
  }
}
