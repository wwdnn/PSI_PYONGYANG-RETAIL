import 'package:flutter/material.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  //TODO: Implement HomeController

  final count = 0.obs;

  // buatkan array untuk menampung data menu
  final listMenu = [1, 2, 3, 4].obs;

  String barcodeResult = "";

  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
  }

  @override
  void onClose() {}

  void scanBarcode() async {
    try {
      String barcodeResult = await FlutterBarcodeScanner.scanBarcode(
        "#ff6666", // Warna untuk latar belakang scanner
        "Cancel", // Label untuk tombol cancel
        true, // Apakah menggunakan mode scan continous
        ScanMode.QR, // Tipe barcode yang akan dipindai
      );

      if (barcodeResult != '-1') {
        barcodeResult = barcodeResult;
        // Lakukan aksi dengan hasil scan barcode disini
        if (barcodeResult == "Kimbab") {
          listMenu[0] = listMenu[0] - 1;
        } else if (barcodeResult == "Odeng") {
          listMenu[1] = listMenu[1] - 1;
        } else if (barcodeResult == "Soju") {
          listMenu[2] = listMenu[2] - 1;
        } else if (barcodeResult == "Tteokbokki") {
          listMenu[3] = listMenu[3] - 1;
        }
        update();

        // quick alert dialog to show the result
        Get.defaultDialog(
            title: "Berhasil Mengurangi Stok",
            middleText: barcodeResult,
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
