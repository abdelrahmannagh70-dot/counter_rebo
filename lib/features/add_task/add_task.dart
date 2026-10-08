
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:my_app/features/add_task/custom_text_field.dart';

class AddTaskScreen extends StatefulWidget {
const AddTaskScreen({super.key});

@override
State<AddTaskScreen> createState() => _AddTaskScreenState();
}

class _AddTaskScreenState extends State<AddTaskScreen> {
final TextEditingController titleController = TextEditingController();
final TextEditingController descriptionController = TextEditingController();
final TextEditingController dateController = TextEditingController();
final TextEditingController timeController = TextEditingController();

DateTime? selectedDate;
TimeOfDay? selectedTime;

String selectedStatus = "pending";

Color selectedColor = const Color(0xff2196F3);

// Select Date
Future<void> selectDate() async {
final DateTime now = DateTime.now();

final DateTime? pickedDate = await showDatePicker(
context: context,
initialDate: selectedDate ?? now,
firstDate: DateTime(now.year, now.month, now.day),
lastDate: DateTime(2027, 12, 31),
);

if (pickedDate != null) {
setState(() {
selectedDate = pickedDate;

dateController.text =
"${pickedDate.day.toString().padLeft(2, '0')}/"
"${pickedDate.month.toString().padLeft(2, '0')}/"
"${pickedDate.year}";
});
}
}

// Select Time
Future<void> selectTime() async {
final TimeOfDay? pickedTime = await showTimePicker(
context: context,
initialTime: selectedTime ?? TimeOfDay.now(),
);

if (pickedTime != null) {
setState(() {
selectedTime = pickedTime;
timeController.text = pickedTime.format(context);
});
}
}

// Save Task
void saveTask() {
// Check if title is empty
if (titleController.text.trim().isEmpty) {
ScaffoldMessenger.of(context).showSnackBar(
SnackBar(
content: Text(
"task_title_required".tr(),
),
),
);

return;
}

// Create task data
final Map<String, dynamic> task = {
"title": titleController.text.trim(),
"description": descriptionController.text.trim(),
"date": dateController.text,
"time": timeController.text,
"status": selectedStatus,
"color": selectedColor.value,
};

// Return task data to Home
Navigator.pop(context, task);
}

@override
void dispose() {
titleController.dispose();
descriptionController.dispose();
dateController.dispose();
timeController.dispose();

super.dispose();
}

@override
Widget build(BuildContext context) {
return Scaffold(
backgroundColor: const Color(0xffF5F7FC),

appBar: AppBar(
backgroundColor: const Color(0xffF5F7FC),
elevation: 0,

leading: IconButton(
icon: const Icon(
Icons.arrow_back,
color: Colors.black,
),
onPressed: () {
Navigator.pop(context);
},
),

title: Text(
"add_task".tr(),
style: TextStyle(
color: Colors.black,
fontSize: 20.sp,
fontWeight: FontWeight.bold,
),
),
),

body: SingleChildScrollView(
padding: EdgeInsets.all(20.w),

child: Column(
crossAxisAlignment: CrossAxisAlignment.start,
children: [
// Task Title
Text(
"task_title".tr(),
style: TextStyle(
fontSize: 14.sp,
fontWeight: FontWeight.w600,
),
),

SizedBox(height: 8.h),

TextField(
controller: titleController,
decoration: InputDecoration(
hintText: "design_login_screen".tr(),
filled: true,
fillColor: Colors.white,

border: OutlineInputBorder(
borderRadius: BorderRadius.circular(14.r),
borderSide: BorderSide.none,
),
),
),

SizedBox(height: 20.h),

// Description
Text(
"description".tr(),
style: TextStyle(
fontSize: 14.sp,
fontWeight: FontWeight.w600,
),
),

SizedBox(height: 8.h),

TextField(
controller: descriptionController,
maxLines: 5,
decoration: InputDecoration(
hintText: "task_description".tr(),
filled: true,
fillColor: Colors.white,

border: OutlineInputBorder(
borderRadius: BorderRadius.circular(14.r),
borderSide: BorderSide.none,
),
),
),

SizedBox(height: 20.h),

// Date & Time
Text(
"date_time".tr(),
style: TextStyle(
fontSize: 14.sp,
fontWeight: FontWeight.w600,
),
),

SizedBox(height: 8.h),

Row(
children: [
Expanded(
child: CustomTextField(
hintText: dateController.text.isEmpty
? "date".tr()
    : dateController.text,
onTap: selectDate,
),
),

10.horizontalSpace,

Expanded(
child: CustomTextField(
hintText: timeController.text.isEmpty
? "time".tr()
    : timeController.text,
onTap: selectTime,
),
),
],
),

SizedBox(height: 20.h),

// Status
Text(
"status".tr(),
style: TextStyle(
fontSize: 14.sp,
fontWeight: FontWeight.w600,
),
),

SizedBox(height: 8.h),

Container(
padding: EdgeInsets.symmetric(
horizontal: 15.w,
),

decoration: BoxDecoration(
color: Colors.white,
borderRadius: BorderRadius.circular(14.r),
),

child: DropdownButtonHideUnderline(
child: DropdownButton<String>(
value: selectedStatus,
isExpanded: true,

items: [
DropdownMenuItem(
value: "pending",
child: Text("pending".tr()),
),

DropdownMenuItem(
value: "done",
child: Text("done".tr()),
),

DropdownMenuItem(
value: "in_progress",
child: Text("in_progress".tr()),
),
],

onChanged: (value) {
if (value != null) {
setState(() {
selectedStatus = value;
});
}
},
),
),
),

SizedBox(height: 25.h),

// Choose Color
Text(
"choose_color".tr(),
style: TextStyle(
fontSize: 14.sp,
fontWeight: FontWeight.w600,
),
),

SizedBox(height: 15.h),

Row(
mainAxisAlignment: MainAxisAlignment.spaceBetween,
children: [
_colorButton(
const Color(0xff2196F3),
),

_colorButton(
const Color(0xff4CAF50),
),

_colorButton(
const Color(0xffff9800),
),

_colorButton(
const Color(0xff9C27B0),
),

_colorButton(
const Color(0xffF44336),
),

_colorButton(
const Color(0xff009688),
),
],
),

SizedBox(height: 35.h),

// Save Button
SizedBox(
width: double.infinity,
height: 52.h,

child: ElevatedButton(
onPressed: saveTask,

style: ElevatedButton.styleFrom(
backgroundColor: const Color(0xff5665A5),

shape: RoundedRectangleBorder(
borderRadius: BorderRadius.circular(28.r),
),
),

child: Text(
"save_task".tr(),
style: TextStyle(
color: Colors.white,
fontSize: 15.sp,
fontWeight: FontWeight.w600,
),
),
),
),
],
),
),
);
}

// Color Button
Widget _colorButton(Color color) {
final bool isSelected = selectedColor == color;

return GestureDetector(
onTap: () {
setState(() {
selectedColor = color;
});
},

child: Container(
width: 42.w,
height: 42.w,

decoration: BoxDecoration(
color: color,
shape: BoxShape.circle,

border: isSelected
? Border.all(
color: Colors.black,
width: 3,
)
    : null,
),
),
);
}
}

