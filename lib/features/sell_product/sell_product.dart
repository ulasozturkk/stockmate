import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:stockmate/features/sell_product/sell_product_repo.dart';


class SellProductPage extends ConsumerStatefulWidget {
  @override
  _SellProductPageState createState() => _SellProductPageState();
}

class _SellProductPageState extends ConsumerState<SellProductPage> {
  final TextEditingController _productNameController = TextEditingController();
  String _stockData = ''; // Verileri tutmak için bir değişken oluşturun

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Ürün Bilgisi')),
      body: Padding(
        padding: EdgeInsets.all(20.0),
        child: Column(
          children: [
            TextField(
              controller: _productNameController,
              decoration: InputDecoration(labelText: 'Ürün Adı'),
            ),
            ElevatedButton(
              onPressed: () {
                final productName = _productNameController.text;
                ref.refresh(stockDataStateNotifierProvider); // Provider'ı yenileyin
                final stockDataFuture = ref.watch(stockDataStateNotifierProvider);
                stockDataFuture.when(
                  data: (data) {
                    final stockData = data.getStockData(productName);
                    stockData.then((value) {
                      // setState kullanmadan _stockData değişkenini güncelleyin
                      _productNameController.clear();
                      _stockData = value;
                    });
                  },
                  loading: () {
                    // Yükleme durumunda uygun işlemler yapılabilir
                  },
                  error: (error, stackTrace) {
                    // Hata durumunda uygun işlemler yapılabilir
                  },
                );
              },
              child: Text('Bilgileri Al'),
            ),
            SizedBox(height: 20),
            Text(
              _stockData, // _stockData değişkenini ekranda gösterin
              style: TextStyle(fontSize: 18),
            ),
          ],
        ),
      ),
    );
  }
}
