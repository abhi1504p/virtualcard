import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:virtualcard/pages/scan_page.dart';
import 'package:virtualcard/utils/helper_functions.dart';

import '../getx/contact_getx.dart';
import '../getx/landing_page.dart';

class HomePage extends StatelessWidget {
  static const String routeName = '/';

  HomePage({super.key});

  final LandingPageController controller = Get.put(LandingPageController());
  final ContactGetx contact = Get.find<ContactGetx>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Virtual Card',
          style: TextStyle(
              color: Color(0xFF0066b2),
              fontSize: 25,
              fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.black,
      ),
      body: ListView.builder(
          itemCount: contact.contactList.length,
          itemBuilder: (context, index) {
            final currentContact = contact.contactList[index];
            return Dismissible(
              key: UniqueKey(),
              direction: DismissDirection.endToStart,
              background: Container(
                padding: EdgeInsets.only(right: 20),
                alignment: FractionalOffset.centerRight,
                color: Colors.red,
                child: Icon(
                  CupertinoIcons.delete,
                  size: 30,
                  color: Colors.white,
                ),
              ),
              confirmDismiss: _showConfirmation,
              onDismissed: (_) async {
                await contact.deleteContact(currentContact.id);
                showMsg(context, "Delete");
              },
              child: ListTile(
                onTap: () => () {},
                title: Text(currentContact.name),
                trailing: GetBuilder<ContactGetx>(builder: (controller) {
                  return IconButton(
                    onPressed: () async {
                      await contact.updateFavorite(currentContact);
                    },
                    icon: Icon(
                      currentContact.favorite
                          ? Icons.favorite
                          : Icons.favorite_border,
                      color: currentContact.favorite ? Colors.red : Colors.blue,
                    ),
                  );
                }),
              ),
            );
          }),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      floatingActionButton: FloatingActionButton(
          shape: CircleBorder(),
          child: Icon(Icons.add),
          onPressed: () {
            Get.to(ScanPage());
          }),
      bottomNavigationBar: Obx(() => BottomAppBar(
            shape: CircularNotchedRectangle(),
            padding: EdgeInsets.zero,
            notchMargin: Get.height * 0.01,
            clipBehavior: Clip.antiAlias,
            child: BottomNavigationBar(
              selectedItemColor: Colors.red,
              onTap: controller.changeTabIndex,
              currentIndex: controller.tabIndex.value,
              backgroundColor: Colors.blue.shade100,
              items: [
                BottomNavigationBarItem(icon: Icon(Icons.home), label: "All"),
                BottomNavigationBarItem(
                    icon: Icon(Icons.favorite), label: "Favourites"),
              ],
            ),
          )),
    );
  }

  Future<bool?> _showConfirmation(DismissDirection direction) {
    return Get.dialog<bool>(AlertDialog(
      title: Text("Delete"),
      content: Text(" Are you sure to Delete"),
      actions: [
        OutlinedButton(
            onPressed: () {
              Get.back(result: true);
            },
            child: Text("Yes")),
        OutlinedButton(
            onPressed: () {
              Get.back(result: false);
            },
            child: Text("No")),
      ],
    ));
  }
  void _fetchData() async {
    final ContactGetx contact = Get.find<ContactGetx>();
    final LandingPageController controller = Get.find<LandingPageController>();

    switch(controller.tabIndex.value) {
      case 0:
        await contact.getAllContacts();
        break;
      case 1:
      // Add this method to your ContactGetx class
        await contact.getAllFavoriteContacts();
        break;
    }
  }
}
