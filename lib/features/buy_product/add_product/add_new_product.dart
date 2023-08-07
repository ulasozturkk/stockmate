


import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:stockmate/features/buy_product/add_product/add_product_repo.dart';
import 'package:stockmate/widgets/custom_button.dart';
import 'package:stockmate/widgets/custom_sized_box.dart';
import 'package:stockmate/widgets/custom_textfield.dart';

class AddNewProduct extends ConsumerStatefulWidget {
  const AddNewProduct({super.key});
  @override
  ConsumerState<ConsumerStatefulWidget> createState() => AddNewProductState();
}

class AddNewProductState extends ConsumerState<AddNewProduct> {
    final productNameController = TextEditingController();
    final miktarController = TextEditingController();
    final alisFiyatiController = TextEditingController();
    final satisFiyatiController = TextEditingController();

  @override
  Widget build(BuildContext context) {

    final double height = MediaQuery.of(context).size.height;
    final double width = MediaQuery.of(context).size.width;
    final provider = ref.watch(addNewProductProvider);
    

    

    return Scaffold(
      appBar: AppBar(title: Text("Yeni Ürün Ekle"),),

      body: SingleChildScrollView(
        child: Center(child: Column(
          children: [
            Container(
                height: height * 0.1,
                width: width * 0.8,
                child: CustomTextField(controller: productNameController , hinttext: "Ürün Adı"),
              ),
            CustomSizedbox(height: height, width: width),
            Container(
                height: height * 0.1,
                width: width * 0.8,
                child: CustomTextField(controller: alisFiyatiController, hinttext: "Alış Fiyatı"),
              ),
            CustomSizedbox(height: height, width: width),
            Container(
                height: height * 0.1,
                width: width * 0.8,
                child: CustomTextField(controller: satisFiyatiController, hinttext: "Satış Fiyatı"),
              ),
            CustomSizedbox(height: height, width: width),
            Container(
                height: height * 0.1,
                width: width * 0.8,
                child: CustomTextField(controller: miktarController, hinttext: "Ürün adedi"),
              ),
            CustomSizedbox(height: height*0.5, width: width),

            CustomButton(text: "Ekle", onpressed: (){
              provider.addNewProduct(
                productNameController.text.trim(), 
                alisFiyatiController.text.trim(), 
                satisFiyatiController.text.trim(), 
                miktarController.text.trim(),
                context
                );
              productNameController.clear();
              miktarController.clear();
              alisFiyatiController.clear();
              satisFiyatiController.clear();
            }, height: height, width: width)  
          ],
        ),),
      ),
    );
  }

}
