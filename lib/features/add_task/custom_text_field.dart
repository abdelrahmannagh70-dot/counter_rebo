
import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
final String hintText;
final TextEditingController? controller;
final VoidCallback? onTap;
final bool readOnly;
final int maxLines;
final TextInputType keyboardType;
final Widget? suffixIcon;

const CustomTextField({
super.key,
required this.hintText,
this.controller,
this.onTap,
this.readOnly = false,
this.maxLines = 1,
this.keyboardType = TextInputType.text,
this.suffixIcon,
});

@override
Widget build(BuildContext context) {
return TextField(
controller: controller,

onTap: onTap,

// If onTap exists, the user should not type manually.
readOnly: readOnly || onTap != null,

maxLines: maxLines,

keyboardType: keyboardType,

decoration: InputDecoration(
hintText: hintText,

suffixIcon: suffixIcon,

filled: true,

fillColor: Colors.white,

contentPadding: const EdgeInsets.symmetric(
horizontal: 16,
vertical: 14,
),

border: OutlineInputBorder(
borderRadius: BorderRadius.circular(12),

borderSide: BorderSide.none,
),

enabledBorder: OutlineInputBorder(
borderRadius: BorderRadius.circular(12),

borderSide: BorderSide.none,
),

focusedBorder: OutlineInputBorder(
borderRadius: BorderRadius.circular(12),

borderSide: const BorderSide(
color: Color(0xff5665A5),
width: 1.5,
),
),
),
);
}
}
