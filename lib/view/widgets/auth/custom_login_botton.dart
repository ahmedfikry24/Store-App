import 'package:flutter/material.dart';

class CustomloginBotton extends StatelessWidget {
  final String textbottom;
  final void Function() onpressed;
  const CustomloginBotton(
      {super.key, required this.textbottom, required this.onpressed});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 40,
      margin: const EdgeInsets.only(
        top: 15,
      ),
      width: double.infinity,
      child: MaterialButton(
        clipBehavior: Clip.antiAliasWithSaveLayer,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        color: Colors.blue,
        textColor: Colors.white,
        onPressed: onpressed,
        child: Text(
          textbottom,
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
