import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:my_app/counter/counter_screen.dart';
import 'package:my_app/counter/cubit/counter_cubit.dart';
import 'package:my_app/features/login/login_screen.dart';

class TodoApp extends StatelessWidget {
  const TodoApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(420, 812),
      minTextAdapt: true,
      splitScreenMode: true,

      builder: (context, child) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          locale: context.locale,
          supportedLocales: context.supportedLocales,

          localizationsDelegates: context.localizationDelegates,

          home: BlocProvider(
            create: (context) => CounterCubit(),
            child: CounterScreen(),
          ),
        );
      },
    );
  }
}
