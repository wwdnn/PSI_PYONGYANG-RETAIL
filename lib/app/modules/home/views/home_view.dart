import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Color(0xff20262E),
          title: Text('CASHIER PYONGYANG 🍜',
              style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'Roboto',
                  letterSpacing: 1.5)),
          centerTitle: true,
        ),
        body: Obx(() => Stack(
              children: [
                Container(
                    child: GridView.count(crossAxisCount: 2, children: <Widget>[
                  MenuProduk(
                      // passing data from controller to view
                      namaProduk: "Kimbab",
                      stokProduk: controller.listMenu[0],
                      gambarProduk: "assets/images/produk_Kimbab.png"),
                  MenuProduk(
                      // passing data from controller to view
                      namaProduk: "Odeng",
                      stokProduk: controller.listMenu[1],
                      gambarProduk: "assets/images/produk_Odeng.png"),
                  MenuProduk(
                      // passing data from controller to view
                      namaProduk: "Soju",
                      stokProduk: controller.listMenu[2],
                      gambarProduk: "assets/images/produk_Soju.png"),
                  MenuProduk(
                      // passing data from controller to view
                      namaProduk: "Tteokbokki",
                      stokProduk: controller.listMenu[3],
                      gambarProduk: "assets/images/produk_Tteokbokki.png"),
                ])),

                // button scan qr barcode in bottom right corner
                Positioned(
                  bottom: 20,
                  right: 20,
                  child: FloatingActionButton(
                    // hexa color
                    backgroundColor: Color(0xffFBC252),
                    onPressed: () => {controller.scanBarcode()},
                    child: Icon(Icons.qr_code_scanner),
                  ),
                ),

                // notification dialog when stock is empty or stock berkurang
                
              ],
            )));
  }
}

class MenuProduk extends StatelessWidget {
  // deklarasi variabel yang akan digunakan untuk menampung data dari controller berupa object
  final String namaProduk;
  final int stokProduk;
  final String gambarProduk;

  MenuProduk(
      {required this.namaProduk,
      required this.stokProduk,
      required this.gambarProduk});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Card(
        child: Column(
          children: [
            Expanded(
              child: Container(
                  child: Image.asset(gambarProduk, fit: BoxFit.cover)),
            ),
            Container(
              margin: EdgeInsets.all(10),
              child: Column(
                children: [
                  Text(namaProduk,
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                          fontFamily: 'Roboto')),
                  Text("Stok: $stokProduk",
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 12,
                          fontFamily: 'Roboto')),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
