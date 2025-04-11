const String tableContact = "tbl_contact";
const String tableContactColId = "id";
const String tableContactColName = "name";
const String tableContactColMobile = "mobile";
const String tableContactColEmail = "email";
const String tableContactColAddress = "address";
const String tableContactColCompany = "company";
const String tableContactColDesignation = "designition";
const String tableContactColFavorite = "favorite";
const String tableContactColImage = "image";
const String tableContactColWebsite = "website";

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
    this.designation = "",
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

  Map<String, dynamic> toMap() {
    final map = <String, dynamic>{
      tableContactColName: name,
      tableContactColAddress: address,
      tableContactColCompany: company,
      tableContactColDesignation: designation,
      tableContactColEmail: email,
      tableContactColFavorite: favorite ? 1 : 0,
      tableContactColMobile: mobile,
      tableContactColImage: image,
      tableContactColWebsite: website
    };
    if (id > 0) {
      map[tableContactColId] = id;
    }
    return map;
  }

  factory ContactModel.fromMap(Map<String, dynamic> map) => ContactModel(
      name: map[tableContactColName],
      mobile: map[tableContactColMobile],
      website: map[tableContactColWebsite],
      company: map[tableContactColCompany],
      address: map[tableContactColAddress],
      email: map[tableContactColEmail],
      image: map[tableContactColImage],
      favorite: map[tableContactColFavorite]==1?true:false,
      designation: map[tableContactColDesignation]);
}
