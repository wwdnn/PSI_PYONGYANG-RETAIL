import 'dart:convert';

import 'package:cashier_pyongyang/app/providers/p-barang.dart';
import 'package:flutter/material.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  List<dynamic> dataBarang = [].obs;
  String barcodeResult = "";

  @override
  void onInit() {
    getAllBarang();
    super.onInit();
  }

  Future<void> getAllBarang() async {
    dataBarang.clear();
    await Future.delayed(Duration(seconds: 1));
    PBarang().getAllBarang().then((value) {
      dataBarang.assignAll(value.body);
    });
    update();
  }

  void addBarang(var id, var quantity) {
    PBarang().addBarang(id, quantity);
  }

  void scanBarcodeAdd() async {
    try {
      String barcodeResult = await FlutterBarcodeScanner.scanBarcode(
        "#ff6666", // Warna untuk latar belakang scanner
        "Cancel", // Label untuk tombol cancel
        true, // Apakah menggunakan mode scan continous
        ScanMode.QR, // Tipe barcode yang akan dipindai
      );

      if (barcodeResult != '-1') {
        var data = jsonDecode(barcodeResult);
        var _id = data['id'];
        var _stok = data['stok'];

        addBarang(_id, _stok);

        Get.defaultDialog(
            title: "Berhasil Menambahkan Stok",
            middleText: "${dataBarang[_id - 1]['nama_barang']} sebanyak $_stok",
            textConfirm: "OK",
            confirmTextColor: Colors.white,
            onConfirm: () => Get.back());
      } else {
        barcodeResult = "";
      }
    } catch (e) {
      print(e.toString());
    }
  }
}
