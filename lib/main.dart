import 'package:coderoofs_flutter_internship_assignment/widgets/bottom_nav_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: Size(411, 914),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) =>  MaterialApp(
        debugShowCheckedModeBanner: false,

        title: 'Mixer',
        home: const BottomNavigation(),
      ),
    );
  }
}
