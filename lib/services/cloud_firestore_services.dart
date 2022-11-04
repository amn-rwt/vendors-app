import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:vendors_app/model/vendor.dart';

class CloudFirestoreServices {
  static FirebaseFirestore firebaseFirestore = FirebaseFirestore.instance;
  static CollectionReference vendors = firebaseFirestore.collection('vendors');
  static Future addUser(Vendor vendor) async {
    vendors.doc(vendor.uId).set(vendor.toMap());
  }
}
