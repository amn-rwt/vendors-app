class Vendor {
  final String uId;
  final String name;
  final String resturantName;
  final int pricePerTiffin;
  final String phone;
  final String email;
  final String? upiID;
  // final String userID;
  Vendor(
      {required this.uId,
      required this.name,
      required this.resturantName,
      required this.pricePerTiffin,
      required this.phone,
      required this.email,
      this.upiID});
  Map<String, dynamic> toMap() {
    return {
      'uId': uId,
      'name': name,
      'resturantName': resturantName,
      'email': email,
      'phone': phone,
      'upiID': upiID ?? '',
      'pricePerTiffin': pricePerTiffin,
    };
  }
}
