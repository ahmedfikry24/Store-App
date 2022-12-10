import 'package:flutter/material.dart';

class CustomSginUpBotton extends StatelessWidget {
  final String body;
  final String text;
  final void Function() onPressed;
  const CustomSginUpBotton(
      {super.key,
      required this.body,
      required this.text,
      required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Row(children: [
          Text(body),
          TextButton(onPressed: onPressed, child: Text(text)),
        ]),
      ],
    );
  }
}
