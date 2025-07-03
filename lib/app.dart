import 'package:first_class/stateful_class.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'module_10_live_test.dart';
import 'module_11/class_1/Alert/all_alart.dart';
import 'module_11/class_1/Life Cycle/class-1_life_cycle.dart';
import 'module_11/class_2/calculator_app.dart';
import 'module_11/class_3/water_tracker.dart';
import 'module_12/class_1/expense_tracker.dart';
import 'module_12/class_2/to_do_list.dart';
import 'module_12/class_3/REST_API_Concept.dart';
import 'module_14/Product_CRUD_Application.dart';
import 'module_9_class_2.dart';
import 'module_9_class_3.dart';
import 'module_9_mediaQuery.dart';
import 'module_9_toDoApp.dart';
import 'login_form.dart';
import 'flutter_class_1.dart';
import 'flutter_class_2.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(360, 690),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (_ , child) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          home: child,
        );
      },
      child: const ProductCrudApplication(),
    );
  }
}