import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AddTaskScreen extends StatefulWidget {
  const AddTaskScreen({super.key});

  @override
  State<AddTaskScreen> createState() => _AddTaskScreenState();
}

class _AddTaskScreenState extends State<AddTaskScreen> {
  String selectedStatus = "pending";

  Color selectedColor = const Color(0xff2196F3);

  final TextEditingController titleController =
  TextEditingController();

  final TextEditingController descriptionController =
  TextEditingController();

  @override
  void dispose() {
    titleController.dispose();
    descriptionController.dispose();

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

            SizedBox(
              width: double.infinity,
              height: 52.h,

              child: ElevatedButton(
                onPressed: () {
                  Navigator.pop(context);
                },

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