import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final firebaseAuth = FirebaseAuth.instance;

Stream<QuerySnapshot<Map<String, dynamic>>> getStockCollection() async* {
  
  
  String? userId = firebaseAuth.currentUser!.uid;
  DocumentReference userRef = FirebaseFirestore.instance.collection('Users').doc(userId);
  CollectionReference<Map<String, dynamic>> stockCollectionRef = userRef.collection('stock');


  yield* stockCollectionRef.snapshots();
}

final stockStreamProvider =
    StreamProvider.autoDispose<QuerySnapshot<Map<String, dynamic>>>(
  (ref) => getStockCollection(),
);

