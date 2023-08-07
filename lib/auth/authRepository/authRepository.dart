


import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';


final AuthRepositoryProvider = Provider((ref) => AuthRepository());

class AuthRepository {
  var firebaseAuth = FirebaseAuth.instance;
  var firestore = FirebaseFirestore.instance;

 

  Future<String?> signUpWithEmail(
  String email,
  String password,
  String verifyPassword,
  String shopName,
  String nameSurname,
  BuildContext context,
) async {
  try {
    if (password == verifyPassword) {
      final result = await firebaseAuth.createUserWithEmailAndPassword(email: email, password: password);
      Navigator.of(context).pushNamed("/homepage");

      // Oluşturulan kullanıcının kimlik bilgisi
      final String userId = result.user!.uid;

      // Kullanıcı bilgilerini ekleyin ve dönen belgenin referansını alın
      final DocumentReference userRef = await firestore.collection("Users").add({
        'id': userId,
        'email': email,
        'password': password,
        'isletmeadi': shopName,
        'nameSurname': nameSurname,
      });

      // Kullanıcının koleksiyonuna ait "stock" adında yeni bir koleksiyon oluşturun ve boş bir belge ekleyin
      await userRef.collection('stock').add({
        'productname': "",
        'miktar': "",
        'alisfiyati': "",
        'satisfiyati': "",
      });

      print("başarılı");
    } else {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("parolalar aynı değil")));
    }
  } catch (e) {
    print(e.toString());
  }
}


  
  Future<String?> signInWithEmail(String email,String password,BuildContext context) async {
    try {
      final result = await firebaseAuth.signInWithEmailAndPassword(email: email, password: password);
      Navigator.of(context).pushNamed("/homepage");
    } catch (e) {
      print(e.toString());
    }
  }

  Future addProduct (String productname,double miktar,double alisfiyati,double satisfiyati) async{
    String? userId = firebaseAuth.currentUser!.uid;
    DocumentReference userRef = firestore.collection("Users").doc(userId);

    CollectionReference<Map<String, dynamic>> stockCollectionRef = userRef.collection("stock");

    try {
      await stockCollectionRef.add(
        {
          'productname' : productname,
          'miktar' : miktar,
          'alisfiyati' : alisfiyati,
          'satisfiyati':satisfiyati
          }

      );
    } catch (e) {
      
    }


  }

  Future<CollectionReference<Map<String,dynamic>>> getUserRef () async{
    String? userId = firebaseAuth.currentUser!.uid;
    DocumentReference userRef = firestore.collection("Users").doc(userId);
    CollectionReference<Map<String, dynamic>> stockCollectionRef = userRef.collection("stock");

    return stockCollectionRef;

  }
}