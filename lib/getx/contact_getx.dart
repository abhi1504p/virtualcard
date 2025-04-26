import 'package:get/get.dart';
import 'package:virtualcard/database/db_helper.dart';
import 'package:virtualcard/models/contact_model.dart';

class ContactGetx extends GetxController {
  List<ContactModel> contactList = [];
  final db = DbHelper();

  @override
  void onInit() {
    getAllContacts();
    super.onInit();
  }
  Future<int> insertContact(ContactModel contactModel) async {
    final rowId = await db.insertContact(contactModel);
    contactModel.id = rowId;
    contactList.add(contactModel);
    update(); // Changed from refresh()/notifyListeners() to GetX's update()

    return rowId;
  }

  Future<void> getAllContacts() async {
    contactList = await db.getAllContacts();
    update(); // Changed from notifyListeners() to GetX's update()
  }

  // Future<ContactModel> getContactById(int id) => db.getContactById(id);
  //
  // Future<void> getAllFavoriteContacts() async {
  //   contactList = await db.getAllFavoriteContacts();
  //   update(); // Changed from notifyListeners() to GetX's update()
  // }
  //
  Future<int> deleteContact(int id) {
    return db.deleteContact(id);
  }
  //
  Future<void> updateFavorite(ContactModel contactModel) async {
    final value = contactModel.favorite ? 0 : 1;
    final result = await db.updateFavorite(contactModel.id, value);
    if (result > 0) {
      final index = contactList.indexWhere((contact) => contact.id == contactModel.id);
      if (index != -1) {
        contactList[index].favorite = !contactList[index].favorite;
        update();

      }
    }


  }
  Future<void> getAllFavoriteContacts() async {
    contactList = await db.getAllFavoriteContacts();
    update();
  }
}