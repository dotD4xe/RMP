import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import '../lab5/router/router.dart';

void main() async {
  await GetStorage.init();
  runApp(
      MaterialApp(
        initialRoute: '/',
        routes: routes,
      )
  );
}