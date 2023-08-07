


import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:stockmate/auth/authRepository/authRepository.dart';
import 'package:stockmate/widgets/custom_inkwell.dart';

class HomePage extends ConsumerWidget{
  const HomePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final height = MediaQuery.of(context).size.height;
    final width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(title: Text("Ana Sayfa"),),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
              CustomInkWell(height: height, width: width, ontap: (){
                Navigator.of(context).pushNamed("/sellproductpage");
              }, insideWidget: const Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Center(child: Icon(Icons.shopping_cart_checkout_sharp,size: 50,),),
                  Text("Ürün Satış",style: TextStyle(fontSize: 24,fontWeight: FontWeight.bold,color: Colors.white),)
                ],
              )),
              VerticalDivider(thickness: 1,),
              CustomInkWell(height: height, width: width, ontap: (){
                Navigator.of(context).pushNamed("/stockpage");
              }, insideWidget: const Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Center(child: Icon(Icons.add_shopping_cart_sharp,size: 50,),),
                  Text("Ürün Alış",style: TextStyle(fontSize: 24,fontWeight: FontWeight.bold,color: Colors.white),)
                ],
              )),            ],),
            Divider(),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                            
              VerticalDivider(thickness: 1,),
              CustomInkWell(height: height, width: width, ontap: (){}, insideWidget: const Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Center(child: Icon(Icons.maps_home_work_outlined,size: 50,),),
                  Text("Stok Envanteri",style: TextStyle(fontSize: 24,fontWeight: FontWeight.bold,color: Colors.white),)
                ],
              )),
            ],),
            
          ],
        ),
      ) ,
    );
  }

}