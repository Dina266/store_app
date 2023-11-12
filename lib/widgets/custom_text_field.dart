
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class CustomTextFormField extends StatelessWidget {
  CustomTextFormField(
      {super.key, this.hintText, this.onChanged,});

  String? hintText;
  Function(String)? onChanged;

  @override
  Widget build(BuildContext context) {
    return TextField(

      keyboardType: hintText == 'price'? TextInputType.number : null,
      onChanged: onChanged,
      decoration: InputDecoration(
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
          borderSide: BorderSide(),
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(8),
            borderSide: BorderSide()),
        hintText: hintText,
        hintStyle: const TextStyle(color: Colors.grey),
      ),
    );
  }
}
