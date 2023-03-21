// To parse this JSON data, do
//
//     final mbarang = mbarangFromJson(jsonString);

import 'dart:convert';

List<Mbarang> mbarangFromJson(String str) => List<Mbarang>.from(json.decode(str).map((x) => Mbarang.fromJson(x)));

String mbarangToJson(List<Mbarang> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class Mbarang {
    Mbarang({
        required this.id,
        required this.namaBarang,
        required this.harga,
        required this.stok,
        required this.gambar,
        this.barcode,
    });

    String id;
    String namaBarang;
    String harga;
    String stok;
    String gambar;
    dynamic barcode;

    factory Mbarang.fromJson(Map<String, dynamic> json) => Mbarang(
        id: json["id"],
        namaBarang: json["nama_barang"],
        harga: json["harga"],
        stok: json["stok"],
        gambar: json["gambar"],
        barcode: json["barcode"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "nama_barang": namaBarang,
        "harga": harga,
        "stok": stok,
        "gambar": gambar,
        "barcode": barcode,
    };
}
