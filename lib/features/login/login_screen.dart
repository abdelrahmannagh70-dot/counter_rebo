
import 'dart:io';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hive/hive.dart';
import 'package:image_picker/image_picker.dart';

import 'package:my_app/core/widget/main_buttom.dart';
import 'package:my_app/features/home/home_screen.dart';
import 'package:my_app/features/login/data/user_model.dart';
import 'package:my_app/utils/app_constans.dart';

class LoginScreen extends StatefulWidget {
const LoginScreen({super.key});

@override
State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
final ImagePicker picker = ImagePicker();

XFile? photo;

final TextEditingController nameController =
TextEditingController();

Future<void> pickImageFromCamera() async {
final XFile? pickedPhoto = await picker.pickImage(
source: ImageSource.camera,
);

if (pickedPhoto != null) {
setState(() {
photo = pickedPhoto;
});
}
}

Future<void> pickImageFromGallery() async {
final XFile? pickedPhoto = await picker.pickImage(
source: ImageSource.gallery,
);

if (pickedPhoto != null) {
setState(() {
photo = pickedPhoto;
});
}
}

Future<void> saveUserData(UserModel user) async {
try {
await Hive.box<UserModel>(
AppConstans.userBox,
).add(user);

debugPrint("User saved successfully");
} catch (error) {
debugPrint("Hive Error: $error");
}

if (!mounted) return;

Navigator.pushReplacement(
context,
MaterialPageRoute(
builder: (context) => HomeScreen(
name: user.name,
),
),
);
}

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
child: SingleChildScrollView(
padding: EdgeInsets.symmetric(
horizontal: 24.w,
vertical: 20.h,
),
child: ConstrainedBox(
constraints: BoxConstraints(
minHeight:
MediaQuery.of(context).size.height - 40.h,
),
child: Column(
mainAxisAlignment: MainAxisAlignment.center,
children: [

// Profile Image
InkWell(
onTap: () {
showModalBottomSheet(
context: context,
builder: (context) {
return Padding(
padding: const EdgeInsets.all(16),
child: Column(
mainAxisSize: MainAxisSize.min,
children: [

MainButton(
title: 'camera'.tr(),
onTap: () {
Navigator.pop(context);
pickImageFromCamera();
},
),

20.verticalSpace,

MainButton(
title: 'gallery'.tr(),
onTap: () {
Navigator.pop(context);
pickImageFromGallery();
},
),
],
),
);
},
);
},

child: CircleAvatar(
radius: 60.r,
backgroundColor:
Colors.grey.shade200,

backgroundImage: photo != null
? FileImage(
File(photo!.path),
)
    : null,

child: photo == null
? Icon(
Icons.person,
size: 60.r,
color:
const Color(0xff4054B2),
)
    : null,
),
),

SizedBox(height: 28.h),

// Title
Text(
"login_title".tr(),
textAlign: TextAlign.center,
style: TextStyle(
fontSize: 24.sp,
fontWeight: FontWeight.bold,
color:
const Color(0xff202124),
),
),

SizedBox(height: 8.h),

// Subtitle
Text(
"login_subtitle".tr(),
textAlign: TextAlign.center,
style: TextStyle(
fontSize: 13.sp,
color: Colors.grey,
),
),

SizedBox(height: 35.h),

// Full Name
Align(
alignment: Alignment.centerLeft,
child: Text(
"full_name".tr(),
style: TextStyle(
fontSize: 13.sp,
fontWeight:
FontWeight.w600,
color:
const Color(0xff202124),
),
),
),

SizedBox(height: 8.h),

// Text Field
TextField(
controller: nameController,
style: TextStyle(
fontSize: 14.sp,
color:
const Color(0xff404040),
),
decoration:
InputDecoration(
hintText:
"full_name_hint".tr(),

hintStyle: TextStyle(
fontSize: 13.sp,
color:
Colors.grey.shade500,
),

filled: true,
fillColor: Colors.white,

contentPadding:
EdgeInsets.symmetric(
horizontal: 16.w,
vertical: 16.h,
),

border:
OutlineInputBorder(
borderRadius:
BorderRadius.circular(
12.r,
),
borderSide:
BorderSide.none,
),

enabledBorder:
OutlineInputBorder(
borderRadius:
BorderRadius.circular(
12.r,
),
borderSide:
BorderSide.none,
),

focusedBorder:
OutlineInputBorder(
borderRadius:
BorderRadius.circular(
12.r,
),
borderSide:
const BorderSide(
color:
Color(0xff5665A5),
width: 1.5,
),
),
),
),

SizedBox(height: 20.h),

// Continue Button
SizedBox(
width: double.infinity,
height: 50.h,

child: ElevatedButton(
onPressed: () async {
String name =
nameController.text.trim();

if (name.isEmpty) {
name = "name";
}

final UserModel user =
UserModel(
name: name,
image:
photo?.path ?? "",
);

await saveUserData(user);
},

style:
ElevatedButton.styleFrom(
backgroundColor:
const Color(0xff5665A5),
elevation: 0,
shape:
RoundedRectangleBorder(
borderRadius:
BorderRadius.circular(
25.r,
),
),
),

child: Text(
"continue".tr(),
style: TextStyle(
fontSize: 13.sp,
color: Colors.white,
fontWeight:
FontWeight.w600,
),
),
),
),

SizedBox(height: 18.h),

// Language Button
IconButton(
onPressed: () {
if (context
    .locale.languageCode ==
'ar') {
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
color:
Colors.grey.shade700,
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

