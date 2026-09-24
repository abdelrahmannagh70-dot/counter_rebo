import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:my_app/features/home/home_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController nameController = TextEditingController();

  @override
  void dispose() {
    nameController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xffF5F7FC),

      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            padding: EdgeInsets.symmetric(
              horizontal: 24.w,
              vertical: 20.h,
            ),

            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [


                Container(
                  width: 82.w,
                  height: 82.w,

                  decoration: const BoxDecoration(
                    color: Color(0xffE8ECF8),
                    shape: BoxShape.circle,
                  ),

                  child: Icon(
                    Icons.person,
                    size: 42.sp,
                    color: const Color(0xff4054B2),
                  ),
                ),

                SizedBox(height: 28.h),



                Text(
                  "login_title".tr(),

                  textAlign: TextAlign.center,

                  style: TextStyle(
                    fontSize: 24.sp,
                    fontWeight: FontWeight.bold,
                    color: const Color(0xff202124),
                  ),
                ),

                SizedBox(height: 8.h),



                Text(
                  "login_subtitle".tr(),

                  textAlign: TextAlign.center,

                  style: TextStyle(
                    fontSize: 13.sp,
                    color: Colors.grey,
                  ),
                ),

                SizedBox(height: 35.h),



                Align(
                  alignment: Alignment.centerLeft,

                  child: Text(
                    "full_name".tr(),

                    style: TextStyle(
                      fontSize: 13.sp,
                      fontWeight: FontWeight.w600,
                      color: const Color(0xff202124),
                    ),
                  ),
                ),

                SizedBox(height: 8.h),



                TextField(
                  controller: nameController,

                  style: TextStyle(
                    fontSize: 14.sp,
                    color: const Color(0xff404040),
                  ),

                  decoration: InputDecoration(
                    hintText: "full_name_hint".tr(),

                    hintStyle: TextStyle(
                      fontSize: 13.sp,
                      color: Colors.grey.shade500,
                    ),

                    filled: true,
                    fillColor: Colors.white,

                    contentPadding: EdgeInsets.symmetric(
                      horizontal: 16.w,
                      vertical: 16.h,
                    ),

                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12.r),
                      borderSide: BorderSide.none,
                    ),

                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12.r),
                      borderSide: BorderSide.none,
                    ),

                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12.r),
                      borderSide: const BorderSide(
                        color: Color(0xff5665A5),
                        width: 1.5,
                      ),
                    ),
                  ),
                ),

                SizedBox(height: 20.h),



                SizedBox(
                  width: double.infinity,
                  height: 50.h,

                  child: ElevatedButton(
                    onPressed: () {

                      String name =
                      nameController.text.trim();

                      if (name.isEmpty) {
                        name = "ِAbdelrahman";
                      }

                      Navigator.pushReplacement(
                        context,

                        MaterialPageRoute(
                          builder: (context) => HomeScreen(
                            name: name,
                          ),
                        ),
                      );
                    },

                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xff5665A5),

                      elevation: 0,

                      shape: RoundedRectangleBorder(
                        borderRadius:
                        BorderRadius.circular(25.r),
                      ),
                    ),

                    child: Text(
                      "continue".tr(),

                      style: TextStyle(
                        fontSize: 13.sp,
                        color: Colors.white,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ),

                SizedBox(height: 18.h),



                IconButton(
                  onPressed: () {

                    if (context.locale.languageCode == 'ar') {
                      context.setLocale(
                        const Locale('en'),
                      );
                    } else {
                      context.setLocale(
                        const Locale('ar'),
                      );
                    }
                  },

                  icon: Icon(
                    Icons.language,
                    size: 24.sp,
                    color: Colors.grey.shade700,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}