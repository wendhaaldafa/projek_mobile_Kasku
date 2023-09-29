import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'app/routes/app_pages.dart';
import 'package:intl/date_symbol_data_local.dart';

Future<void> main() async {
  await initializeDateFormatting('id_ID', null);
  await GetStorage.init();
  runApp(
    GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Application KasKu",
      theme: ThemeData(primarySwatch: Colors.yellow),
      initialRoute: AppPages.INITIAL,
      getPages: AppPages.routes,
    ),
  );
}
