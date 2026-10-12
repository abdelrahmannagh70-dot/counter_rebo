import 'package:flutter/material.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:my_app/core/model/task_model.dart';
import 'package:my_app/features/login/data/user_model.dart';
import 'package:my_app/todo_app.dart';
import 'package:my_app/utils/app_constans.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await EasyLocalization.ensureInitialized();

  await Hive.initFlutter();

  Hive.registerAdapter(UserModelAdapter());
  Hive.registerAdapter(TaskModelAdapter());

  await Hive.openBox<UserModel>(
    AppConstans.userBox,
  );
  await Hive.openBox<TaskModel>(
    AppConstans.tasksBox,

  );

  runApp(
    EasyLocalization(
      supportedLocales: const [
        Locale('en'),
        Locale('ar'),
      ],
      path: 'assets/translations',
      fallbackLocale: const Locale('en'),
      startLocale: const Locale('en'),
      child: const TodoApp(),
    ),
  );
}

