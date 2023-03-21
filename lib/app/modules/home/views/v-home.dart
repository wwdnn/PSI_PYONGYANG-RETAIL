import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/home_controller.dart';

class VHome extends GetView<HomeController> {
  @override
  Widget build(BuildContext context) {
    HomeController controller = Get.put(HomeController());
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color.fromARGB(255, 0, 0, 0),
        title: Text('TOTOKOANSET APP',
            style: TextStyle(
                color: Colors.white,
                fontSize: 20,
                fontWeight: FontWeight.bold,
                fontFamily: 'Roboto',
                letterSpacing: 1.5)),
        centerTitle: true,
      ),
      body: Obx(() => RefreshIndicator(
            onRefresh: controller.getAllBarang,
            child: Stack(
              children: [
                Container(
                    child: GridView.builder(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                  ),
                  itemCount: controller.dataBarang.length,
                  itemBuilder: ((context, index) {
                    final menu = controller.dataBarang[index];
                    return MenuProduk(
                      namaProduk: menu['nama_barang'],
                      stokProduk: int.parse(menu['stok']),
                      gambarProduk:
                          'http://192.168.100.31:8080/gambar/' + menu['gambar'],
                    );
                  }),
                )),

                // button scan qr barcode in bottom right corner
                Align(
                    alignment: Alignment.bottomCenter,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Container(
                          width: 140,
                          height: 60,
                          margin: EdgeInsets.only(bottom: 20, right: 20),
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Color.fromARGB(255, 0, 0, 0),
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20)),
                            ),
                            onPressed: () {},
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Container(
                                  margin: EdgeInsets.only(right: 10),
                                  child: Icon(Icons.qr_code_scanner,
                                      color: Colors.white, size: 30),
                                ),
                                Text("Cashier",
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold,
                                        fontFamily: 'Roboto',
                                        letterSpacing: 1.5)),
                              ],
                            ),
                          ),
                        ),

                        // button add stock in bottom right corner
                        Container(
                          width: 140,
                          height: 60,
                          margin: EdgeInsets.only(bottom: 20, right: 20),
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Color.fromARGB(255, 0, 0, 0),
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(20)),
                            ),
                            onPressed: () => controller.scanBarcodeAdd(),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Container(
                                  margin: EdgeInsets.only(right: 10),
                                  child: Icon(Icons.qr_code_scanner,
                                      color: Colors.white, size: 30),
                                ),
                                Text("Gudang",
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold,
                                        fontFamily: 'Roboto',
                                        letterSpacing: 1.5)),
                              ],
                            ),
                          ),
                        ),
                      ],
                    )),

                // notification dialog when stock is empty or stock berkurang
              ],
            ),
          )),
    );
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
              child: Container(child: Image.network(gambarProduk)),
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
