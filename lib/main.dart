import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/get.dart';
import 'package:virtualcard/getx/contact_getx.dart';
import 'package:virtualcard/pages/form_page.dart';
import 'package:virtualcard/pages/home_page.dart';
import 'package:virtualcard/pages/scan_page.dart';


void main() {
  runApp(MyApp());
}

// class MyApp extends StatelessWidget {
//   const MyApp({super.key});
//   @override
//   Widget build(BuildContext context) {
//     Get.put(ContactGetx());
//     return GetMaterialApp.router(
//       builder: EasyLoading.init(),
//       debugShowCheckedModeBanner: false,
//       getPages: [
//         GetPage(
//           name: '/', // Route name
//           page: () =>  HomePage(), // Page builder
//         ),
//         GetPage(
//           name:"/scanPage",
//           page: () =>  ScanPage(),
//         ),
//       ],
//     );
//   }
// }
class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    Get.put(ContactGetx());
    return GetMaterialApp(
      builder: EasyLoading.init(),
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      getPages: [
        GetPage(
          name: '/',
          page: () => HomePage(),
        ),
        GetPage(
          name: '/scan',
          page: () => ScanPage(),
        ),
        GetPage(
          name: '/form',
          page: () => FormPage(contactModel: Get.arguments),
        ),
      ],
    );
  }
}
