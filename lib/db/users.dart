
import 'package:cloud_firestore/cloud_firestore.dart';

class UserServices{
Firestore _firestore = Firestore.instance;
String collection ="users";

createUser(Map<String, dynamic>data) async {
  try {
      await _firestore.collection(collection).document(data["userId"]).setData(data);
      print("USER WAS CREATED");
  }catch(e){
    print('ERROR: ${e.toString()}');
  }
}
}
