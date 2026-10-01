import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:my_app/features/add_task/add_task.dart';

class HomeScreen extends StatelessWidget {
  final String name;

  const HomeScreen({
    super.key,
    required this.name,
  });

  @override
  Widget build(BuildContext context) {
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
                          "User",
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
                      number: "12",
                      title: "tasks",
                    ),

                    _statItem(
                      number: "5",
                      title: "done",
                    ),

                    _statItem(
                      number: "7",
                      title: "pending",
                    ),
                  ],
                ),
              ),

              SizedBox(height: 25.h),

              Text(
                "today_tasks".tr(),
                style: TextStyle(
                  fontSize: 20.sp,
                  fontWeight: FontWeight.bold,
                ),
              ),

              SizedBox(height: 15.h),


              _taskCard(
                title: "flutter_ui".tr(),
                subtitle: "build_register_screen".tr(),
                status: "pending".tr(),
                color: const Color(0xff2196F3),
                statusColor: const Color(0xffD9EEFF),
              ),

              SizedBox(height: 12.h),


              _taskCard(
                title: "workout".tr(),
                subtitle: "gym_at".tr(),
                status: "done".tr(),
                color: const Color(0xff4CAF50),
                statusColor: const Color(0xffDDF3DF),
              ),

              SizedBox(height: 12.h),


              _taskCard(
                title: "meeting".tr(),
                subtitle: "team_sync".tr(),
                status: "in_progress".tr(),
                color: const Color(0xffff9800),
                statusColor: const Color(0xffffedcf),
              ),

              SizedBox(height: 12.h),


              _taskCard(
                title: "read_book".tr(),
                subtitle: "atomic_habits".tr(),
                status: "pending".tr(),
                color: const Color(0xff9C27B0),
                statusColor: const Color(0xffF0D9F5),
              ),

              SizedBox(height: 20.h),
            ],
          ),
        ),
      ),


      floatingActionButton: FloatingActionButton.extended(
        backgroundColor: const Color(0xffDCE2FF),

        onPressed: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => const AddTaskScreen(),
            ),
          );
        },

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

          Container(
            width: 7.w,
            height: 55.h,

            decoration: BoxDecoration(
              color: color,
              borderRadius: BorderRadius.circular(10.r),
            ),
          ),

          SizedBox(width: 14.w),


          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
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
}