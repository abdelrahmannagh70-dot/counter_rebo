import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  final String hintText;
  final void Function()? onTap;

  const CustomTextField({
    super.key,
    required this.hintText, this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      onTap: onTap,
      readOnly: onTap!=null,
      decoration: InputDecoration(
        hintText: hintText,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
        ),
      ),
    );
  }
}