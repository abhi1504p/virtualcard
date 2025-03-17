class ContactModel {
  int id;

  ContactModel({
    this.id = -1,
    required this.name,
    required this.mobile,

    this.email = "",
    this.address = "",
    this.designition = "",
    this.company = "",
    this.website = "",
    this.image = "",
    this.favorite = false,
    this.designation="",
  });

  String name;
  String mobile;
  String email;
  String address;
  String designition;
  String company;
  String website;
  String image;
  bool favorite;
  String designation;
}
