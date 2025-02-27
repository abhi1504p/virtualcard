import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:virtualcard/pages/scan_page.dart';

import '../getx/landing_page.dart';

class HomePage extends StatelessWidget {
  static const String routeName = '/';

  HomePage({super.key});

  LandingPageController controller = Get.put(LandingPageController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Virtual Card')),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(
          shape: CircleBorder(),
          child: Icon(Icons.add),
          onPressed: () {
            Get.to(ScanPage());
          }),
      bottomNavigationBar: BottomAppBar(
        shape: CircularNotchedRectangle(),
        padding: EdgeInsets.zero,
        notchMargin: Get.height * 0.01,
        clipBehavior: Clip.antiAlias,
        child: Obx(() {
          return BottomNavigationBar(
            selectedItemColor: Colors.red,
            onTap: controller.changeTabIndex,
            currentIndex: controller.tabIndex.value,
            backgroundColor: Colors.blue.shade100,
            items: [
              BottomNavigationBarItem(icon: Icon(Icons.home), label: "All"),
              BottomNavigationBarItem(
                  icon: Icon(Icons.favorite), label: "Favourites"),
            ],
          );
        }),
      ),
    );
  }
}
