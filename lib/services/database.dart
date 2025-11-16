import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

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

String? get userId => FirebaseAuth.instance.currentUser?.uid;
  // ADDED: Method to save a new chat message to Firestore.
  Future<void> saveMessage({
    required String characterName,
    required String text,
    required String sender,
  }) async {
    // We check if the user is logged in before proceeding.
    if (userId == null) return;

    await FirebaseFirestore.instance
        .collection('chats') // A new top-level collection for chats
        .doc(userId) // A document for the current user
        .collection(characterName) // A sub-collection for each character (e.g., 'sofi')
        .add({ // Add the new message document
      'text': text,
      'sender': sender,
      'timestamp': FieldValue.serverTimestamp(),
    });
  }

  
  Stream<QuerySnapshot> getChatHistory(String characterName) {
    
    if (userId == null) return Stream.empty();

    return FirebaseFirestore.instance
        .collection('chats')
        .doc(userId)
        .collection(characterName)
        .orderBy('timestamp', descending: true) 
        .snapshots(); 
  }

    // --- ADD THIS NEW METHOD ---
  // This method gets the chat history just once, instead of listening for changes.
  // It's safer for fetching history before sending it to the API.
  Future<QuerySnapshot> getChatHistoryAsFuture(String characterName) {
    if (userId == null) {
      // Return a future that completes with an empty snapshot
      return Future.value(FirebaseFirestore.instance.collection('empty').get());
    }
    return FirebaseFirestore.instance
        .collection('chats')
        .doc(userId)
        .collection(characterName)
        .orderBy('timestamp')
        .get();
  }
}

