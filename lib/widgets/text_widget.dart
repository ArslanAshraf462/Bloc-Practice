import 'package:flutter/material.dart';

class TextWidget extends StatelessWidget {
  final String title;
  final Color? color;
  const TextWidget({Key? key,required this.title,this.color}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(title,
    style: TextStyle(
      color: color,
    ),
    );
  }
}
