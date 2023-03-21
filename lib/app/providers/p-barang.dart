import 'package:get/get.dart';

import '../utils/base_url.dart';

class PBarang extends GetConnect {
  Future<dynamic> getAllBarang() async {
    var response = await get('$BaseUrl/barang');
    if (response.statusCode == 200) {
      return response;
    }
    return null;
  }

  // buatkan method post untuk menambahkan data
  Future<dynamic> addBarang(int id, int quantity) async {
    var response = await post('$BaseUrl/barang/add/$id/$quantity', {
      'id': id,
      'quantity': quantity,
    });
    if (response.statusCode == 200) {
      return response;
    }
  }
}
