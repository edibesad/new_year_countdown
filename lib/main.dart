import 'package:flutter/material.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:new_year_countdown/MyMaterialApp.dart';

void main() {
  RequestConfiguration(testDeviceIds: ["B3EEABB8EE11C2BE770B684D95219ECB"]);
  WidgetsFlutterBinding.ensureInitialized();
  MobileAds.instance.initialize();
  final initFuture = MobileAds.instance.initialize();
  // final adState = AdState(initFuture);
  // runApp(Provider.value(
  //   value: adState,
  //   builder: (context, child) => const MyApp(),
  // ));
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MyMaterialApp();
  }
}
