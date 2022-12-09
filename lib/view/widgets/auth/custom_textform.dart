import 'package:flutter/material.dart';

class CustomTextForm extends StatelessWidget {
  final String? hinttext;
  final String? labeltext;
  final IconData? suffixicon;
  final TextInputType? textInputType;
  final TextEditingController? controller;
  final bool? obscureText;
  final String? Function(String?)? validator;
  final void Function()? onTap;

  const CustomTextForm(
      {super.key,
      required this.hinttext,
      required this.labeltext,
      this.suffixicon,
      required this.textInputType,
      required this.controller,
      this.obscureText,
      required this.validator,
      this.onTap});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: validator,
      controller: controller,
      decoration: InputDecoration(
          hintStyle: const TextStyle(fontSize: 14),
          contentPadding:
              const EdgeInsets.symmetric(vertical: 7, horizontal: 20),
          hintText: hinttext,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(30),
          ),
          label: Text(labeltext!),
          suffixIcon: InkWell(onTap: onTap, child: Icon(suffixicon)),
          floatingLabelBehavior: FloatingLabelBehavior.always),
      keyboardType: textInputType,
      obscureText: obscureText ?? false,
    );
  }
}
