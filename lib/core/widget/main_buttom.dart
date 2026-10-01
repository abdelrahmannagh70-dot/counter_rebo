import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:my_app/core/widget/main_buttom.dart';
class MainButton extends StatelessWidget {
  final String title;
  final void Function()? onTap;
  const MainButton ({super.key, required this.title, this.onTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: EdgeInsets.symmetric(vertical:16.h),
        width: double.infinity,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: Colors.blue,
              borderRadius: BorderRadius.circular(50),
        ),
        child: Text(title, style: TextStyle(
            fontSize: 20.sp,
          color: Colors.white,
          fontWeight: FontWeight.bold
        ),),
      ),
    );
  }
}
