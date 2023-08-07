
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:stockmate/features/buy_product/product_home/product_repo.dart';
import 'package:stockmate/widgets/custom_inkwell.dart';
import 'package:stockmate/widgets/custom_sized_box.dart';
import 'package:stockmate/widgets/custom_textfield.dart';

class StockPage extends ConsumerStatefulWidget {
  const StockPage({Key? key}) : super(key: key);

  @override
  ConsumerState<StockPage> createState() => StockPageState();
}

class StockPageState extends ConsumerState<StockPage> {
  final searchController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final double height = MediaQuery.of(context).size.height;
    final double width = MediaQuery.of(context).size.width;
    final userRefAsyncValue = ref.watch(stockStreamProvider);

    return Scaffold(
      appBar: AppBar(title: Text("Stok Envanteri")),
      body: Center(
        child: Column(
          children: [
            Container(
              height: height * 0.1,
              width: width * 0.8,
              child: CustomTextField(controller: searchController, hinttext: "Ürün Ara"),
            ),
            CustomSizedbox(height: height, width: width),
            userRefAsyncValue.when(
              data: (snapshot) {
                if (snapshot.docs.isNotEmpty) {
                  final documents = snapshot.docs;
                  return SizedBox(
                    height: height*0.5,
                    width: width * 0.6,
                    child: ListView.builder(
                      itemCount: documents.length,
                      itemBuilder: (context, index) {
                        final documentData = documents[index].data();
                        return ListTile(
                          title: Text(documentData['productname'].toString()),
                          subtitle: Text(documentData['alisfiyati'].toString()),
                        );
                      },
                    ),
                  );
                } else {
                  return Text("veri yok");
                }
              },
              error: (error, stackTrace) => Text("Bir hata oluştu: $error"),
              loading: () => CircularProgressIndicator(),
            ),
          ],
        ),
      ),
      bottomNavigationBar: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          CustomInkWell(
            height: height * 0.5,
            width: width,
            ontap: () {
              Navigator.of(context).pushNamed("/addproductpage");
            },
            insideWidget: Text(
              "Yeni Ürün Ekle",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.white),
            ),
          ),
        ],
      ),
    );
  }
}

// Diğer kısımlar aynı...
