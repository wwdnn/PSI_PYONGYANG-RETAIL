// ignore: file_names
import 'package:flutter/material.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';

import '../modules/home/views/v-home.dart';

class VTemplate extends StatefulWidget {
  const VTemplate({Key? key}) : super(key: key);

  @override
  // ignore: library_private_types_in_public_api
  _BasePageState createState() => _BasePageState();
}

class _BasePageState extends State<VTemplate> {
  int index = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        bottomNavigationBar: CurvedNavigationBar(
          index: index,
          color: Color.fromARGB(255, 0, 0, 0),
          backgroundColor: Color.fromARGB(255, 255, 255, 255),
          buttonBackgroundColor: Color.fromARGB(255, 0, 0, 0),
          animationDuration: const Duration(milliseconds: 500),
          height: 65,
          items: <Widget>[
            Icon(
              Icons.qr_code_scanner,
              size: 30,
              color: Color.fromARGB(255, 0, 0, 0),
            ),
            Icon(
              Icons.qr_code_scanner,
              size: 50,
              color: Color.fromARGB(255, 255, 255, 255),
            ),
            Icon(
              Icons.qr_code_scanner,
              size: 30,
              color: Color.fromARGB(255, 0, 0, 0),
            ),
          ],
          onTap: (selectedIndex) {
            setState(() {
              index = selectedIndex;
            });
          },
          letIndexChange: (index) => true,
        ),
        body: Container(
          child: getSelectedWidget(index: index),
        ));
  }
}

Widget getSelectedWidget({required int index}) {
  Widget widget;
  switch (index) {
    case 0:
      widget = VHome();
      break;
    case 1:
      widget = VHome();
      break;
    default:
      widget = VHome();
      break;
  }
  return widget;
}
