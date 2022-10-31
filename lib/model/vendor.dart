class Vendor {
  final String name;
  final String resturantName;
  final int pricePerTiffin;
  final String phone;
  final String email;
  final String? upiID;
  Vendor(
      {required this.name,
      required this.resturantName,
      required this.pricePerTiffin,
      required this.phone,
      required this.email,
      this.upiID});
  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'resturantName': resturantName,
      'email': email,
      'phone': phone,
      'upiID': upiID ?? '',
      'pricePerTiffin': pricePerTiffin,
    };
  }
}
