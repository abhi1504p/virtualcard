import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:virtualcard/pages/home_page.dart';
import 'package:virtualcard/pages/scan_page.dart';


void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp.router(
      builder: EasyLoading.init(),
      debugShowCheckedModeBanner: false,
      getPages: [
        GetPage(
          name: '/', // Route name
          page: () =>  HomePage(), // Page builder
        ),
        GetPage(
          name:"/scanPage",
          page: () =>  ScanPage(),
        ),
      ],
    );
  }
}
