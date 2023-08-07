


import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final addNewProductProvider = ChangeNotifierProvider<AddNewProductRepo>((ref) => AddNewProductRepo());

class AddNewProductRepo extends ChangeNotifier{

  final firebaseAuth = FirebaseAuth.instance;
  final firestore = FirebaseFirestore.instance;

  Map<String,dynamic> productInfo = {};

  Future<void> addNewProduct(String productname, String alisfiyati, String satisfiyati, String miktar,BuildContext context) async {
  try {
    // Firestore bağlantısı ve Users koleksiyonunu alınması
    CollectionReference<Map<String, dynamic>> usersCollectionRef = firestore.collection('Users');
    // Kullanıcının belgesini almak için DocumentReference oluşturun

    String? userId = firebaseAuth.currentUser!.uid;
    DocumentReference userRef = usersCollectionRef.doc(userId);

    // Stock koleksiyonunu almak için collection() yöntemini kullanın
    CollectionReference<Map<String, dynamic>> stockCollectionRef = userRef.collection('stock');

    // Yeni ürün verilerini bir Map olarak oluşturun
    Map<String, dynamic> productData = {
      'productname': productname,
      'miktar': miktar,
      'alisfiyati': alisfiyati,
      'satisfiyati': satisfiyati,
    };

    // Stock koleksiyonuna veriyi ekleyin
    await stockCollectionRef.add(productData);

    // productData'yı productInfo'ya ekleyin
    productInfo.addAll(productData);

    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Ürün Başarıyla Eklendi")));

    // Değişiklikleri bildirin
    notifyListeners();


  } catch (e) {
    // Hata durumunda gerekli işlemleri yapabilirsiniz
    print('Hata oluştu: $e');
  }
}



  }
