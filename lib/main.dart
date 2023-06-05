import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sgmobile/bussiness_logic/controller/SJ_Controller.dart';
import 'package:sgmobile/ui/pages/default/root.dart';

void main() {
  Get.lazyPut(() => SJController());
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'ASM',
      theme: ThemeData(primarySwatch: Colors.amber, useMaterial3: true),
      home: RootPage(),
    );
  }
}
