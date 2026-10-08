
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:my_app/features/add_task/add_task.dart';

class HomeScreen extends StatefulWidget {
final String name;

const HomeScreen({
super.key,
required this.name,
});

@override
State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
// Tasks list
final List<Map<String, dynamic>> tasks = [
{
"title": "flutter_ui",
"description": "build_register_screen",
"status": "pending",
"color": 0xff2196F3,
},
{
"title": "workout",
"description": "gym_at",
"status": "done",
"color": 0xff4CAF50,
},
{
"title": "meeting",
"description": "team_sync",
"status": "in_progress",
"color": 0xffff9800,
},
{
"title": "read_book",
"description": "atomic_habits",
"status": "pending",
"color": 0xff9C27B0,
},
];

// Open Add Task screen
Future<void> openAddTask() async {
final Map<String, dynamic>? newTask =
await Navigator.push<Map<String, dynamic>>(
context,
MaterialPageRoute(
builder: (context) => const AddTaskScreen(),
),
);

// If a task was returned, add it to the list
if (newTask != null) {
setState(() {
tasks.add(newTask);
});
}
}

@override
Widget build(BuildContext context) {
// Statistics
final int totalTasks = tasks.length;

final int doneTasks = tasks.where((task) {
return task["status"] == "done";
}).length;

final int pendingTasks = tasks.where((task) {
return task["status"] == "pending";
}).length;

return Scaffold(
backgroundColor: const Color(0xffF5F7FC),

body: SafeArea(
child: SingleChildScrollView(
padding: EdgeInsets.symmetric(
horizontal: 20.w,
vertical: 20.h,
),

child: Column(
crossAxisAlignment: CrossAxisAlignment.start,
children: [
// =========================
// Header
// =========================

Row(
children: [
Container(
width: 52.w,
height: 52.w,

decoration: const BoxDecoration(
color: Color(0xffE8ECF8),
shape: BoxShape.circle,
),

child: Icon(
Icons.person,
color: const Color(0xff4054B2),
size: 28.sp,
),
),

SizedBox(width: 12.w),

Expanded(
child: Column(
crossAxisAlignment: CrossAxisAlignment.start,

children: [
Text(
"good_morning".tr(),

style: TextStyle(
fontSize: 13.sp,
color: Colors.grey,
),
),

SizedBox(height: 3.h),

Text(
widget.name.isEmpty ? "User" : widget.name,

style: TextStyle(
fontSize: 18.sp,
fontWeight: FontWeight.bold,
),
),
],
),
),

Icon(
Icons.notifications_none,
size: 28.sp,
color: Colors.grey.shade700,
),
],
),

SizedBox(height: 25.h),

// =========================
// Statistics
// =========================

Container(
width: double.infinity,

padding: EdgeInsets.symmetric(
vertical: 22.h,
),

decoration: BoxDecoration(
color: const Color(0xff4559BC),
borderRadius: BorderRadius.circular(18.r),
),

child: Row(
mainAxisAlignment: MainAxisAlignment.spaceEvenly,

children: [
_statItem(
number: totalTasks.toString(),
title: "tasks",
),

_statItem(
number: doneTasks.toString(),
title: "done",
),

_statItem(
number: pendingTasks.toString(),
title: "pending",
),
],
),
),

SizedBox(height: 25.h),

// =========================
// Today's Tasks
// =========================

Text(
"today_tasks".tr(),

style: TextStyle(
fontSize: 20.sp,
fontWeight: FontWeight.bold,
),
),

SizedBox(height: 15.h),

// =========================
// Tasks
// =========================

if (tasks.isEmpty)
Center(
child: Padding(
padding: EdgeInsets.only(
top: 40.h,
),

child: Column(
children: [
Icon(
Icons.task_alt,
size: 60.sp,
color: Colors.grey,
),

SizedBox(height: 10.h),

Text(
"No tasks yet",

style: TextStyle(
fontSize: 15.sp,
color: Colors.grey,
),
),
],
),
),
)
else
...tasks.map(
(task) {
final Color taskColor = Color(
task["color"] ?? 0xff2196F3,
);

final String status =
task["status"] ?? "pending";

final Color statusColor =
_getStatusBackgroundColor(status);

return Padding(
padding: EdgeInsets.only(
bottom: 12.h,
),

child: _taskCard(
title: task["title"] ?? "",
subtitle: task["description"] ?? "",
status: status.tr(),
color: taskColor,
statusColor: statusColor,
),
);
},
),

SizedBox(height: 20.h),
],
),
),
),

// =========================
// Add Task Button
// =========================

floatingActionButton: FloatingActionButton.extended(
backgroundColor: const Color(0xffDCE2FF),

onPressed: openAddTask,

icon: Icon(
Icons.add,
color: const Color(0xff4054B2),
size: 22.sp,
),

label: Text(
"task".tr(),

style: TextStyle(
color: const Color(0xff4054B2),
fontSize: 13.sp,
fontWeight: FontWeight.w600,
),
),
),
);
}

// =========================
// Statistics Item
// =========================

Widget _statItem({
required String number,
required String title,
}) {
return Column(
children: [
Text(
number,

style: TextStyle(
fontSize: 22.sp,
fontWeight: FontWeight.bold,
color: Colors.white,
),
),

SizedBox(height: 4.h),

Text(
title.tr(),

style: TextStyle(
fontSize: 12.sp,
color: Colors.white70,
),
),
],
);
}

// =========================
// Task Card
// =========================

Widget _taskCard({
required String title,
required String subtitle,
required String status,
required Color color,
required Color statusColor,
}) {
return Container(
width: double.infinity,

padding: EdgeInsets.all(14.w),

decoration: BoxDecoration(
color: Colors.white,

borderRadius: BorderRadius.circular(16.r),

boxShadow: [
BoxShadow(
color: Colors.black.withOpacity(0.05),
blurRadius: 8,
offset: const Offset(0, 3),
),
],
),

child: Row(
children: [
// Color line
Container(
width: 7.w,
height: 55.h,

decoration: BoxDecoration(
color: color,

borderRadius: BorderRadius.circular(10.r),
),
),

SizedBox(width: 14.w),

// Task information
Expanded(
child: Column(
crossAxisAlignment: CrossAxisAlignment.start,

children: [
Text(
title.tr(),

style: TextStyle(
fontSize: 15.sp,
fontWeight: FontWeight.bold,
),
),

SizedBox(height: 4.h),

Text(
subtitle,

style: TextStyle(
fontSize: 12.sp,
color: Colors.grey,
),
),

SizedBox(height: 7.h),

// Status
Container(
padding: EdgeInsets.symmetric(
horizontal: 10.w,
vertical: 4.h,
),

decoration: BoxDecoration(
color: statusColor,
borderRadius: BorderRadius.circular(20.r),
),

child: Text(
status,

style: TextStyle(
fontSize: 10.sp,
color: color,
fontWeight: FontWeight.w600,
),
),
),
],
),
),

// Arrow
Icon(
Icons.chevron_right,
size: 28.sp,
color: Colors.grey.shade700,
),
],
),
);
}



Color _getStatusBackgroundColor(String status) {
switch (status) {
case "done":
return const Color(0xffDDF3DF);

case "in_progress":
return const Color(0xffffedcf);

case "pending":
default:
return const Color(0xffD9EEFF);
}
}
}

