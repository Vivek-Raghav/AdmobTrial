import 'dart:io';
import 'package:flutter/material.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';

void main(){
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Screen(),
    );
  }
}

class Screen extends StatefulWidget {
  const Screen({super.key});

  @override
  State<Screen> createState() => _ScreenState();
}

class _ScreenState extends State<Screen> {

final BannerAd myBanner = BannerAd(
  adUnitId: Platform.isAndroid
    ? 'ca-app-pub-3940256099942544/6300978111'
    : 'ca-app-pub-3940256099942544/2934735716',
  size: AdSize.banner,
  request: const AdRequest(),
  listener: const BannerAdListener(),
);

void initState() {
   super.initState();
   myBanner.load();
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('This is my admob test'),
      ),
      body: Stack(
        children: [
          Positioned(child: Container(
            child: AdWidget(ad: myBanner),
          ))
        ],
      ),
    );
  }
}