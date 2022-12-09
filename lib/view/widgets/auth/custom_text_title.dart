import 'package:flutter/material.dart';
import 'package:store_app/core/themes.dart';

class CustomTextTitleAuth extends StatelessWidget {
  final String title;
  const CustomTextTitleAuth({
    super.key,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: Theme.of(context).textTheme.headline4!.copyWith(
            fontSize: 30,
            fontWeight: FontWeight.bold,
            color: AppTheme.primaryColor,
          ),
    );
  }
}
