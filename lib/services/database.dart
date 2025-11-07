import 'package:cloud_firestore/cloud_firestore.dart';

class DatabaseMethods {
  Future addUserDetails(Map<String,dynamic> userInfoMap,String id) async {
   return await FirebaseFirestore.instance
        .collection("users")
        .doc(id)
        .set(userInfoMap);
  }

  Future<QuerySnapshot> getUserbyemail(String email)async{
    return FirebaseFirestore.instance
    .collection("users").where("Email",isEqualTo: email).get();
  }
}

