import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:stockmate/features/buy_product/product_home/product_repo.dart';

class StockDataStateNotifier {
  Future<String> getStockData(String productName) async {
    // Firestore veritabanı referansını al
    final FirebaseFirestore firestore = FirebaseFirestore.instance;
    String? userId = firebaseAuth.currentUser!.uid;

    // "Users" koleksiyonunda "stock" koleksiyonunun referansını al
    final CollectionReference stockCollection =
        firestore.collection('Users').doc(userId).collection('stock');

    // Kullanıcı tarafından girilen ürün adını kullanarak verileri al
    final QuerySnapshot querySnapshot =
        await stockCollection.where('productname', isEqualTo: productName).get();

    if (querySnapshot.docs.isNotEmpty) {
      // Verileri al
      final DocumentSnapshot documentSnapshot = querySnapshot.docs[0];
      final alisFiyati = documentSnapshot['alisfiyati'];
      final satisFiyati = documentSnapshot['satisfiyati'];
      final miktar = documentSnapshot['miktar'];

      // Alınan verileri kullanmak için istediğiniz işlemi yapabilirsiniz
      return 'Alış Fiyatı: $alisFiyati\nSatış Fiyatı: $satisFiyati\nMiktar: $miktar';
    } else {
      return 'Ürün bulunamadı';
    }
  }
}

final stockDataStateNotifierProvider =
    FutureProvider<StockDataStateNotifier>((ref) => StockDataStateNotifier());
