import 'dart:async';
import 'package:flutter/material.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:new_year_countdown/AdHelper.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:provider/provider.dart';

class MyHomePageBody extends StatefulWidget {
  MyHomePageBody({Key? key}) : super(key: key);

  @override
  State<MyHomePageBody> createState() => _MyHomePageBodyState();
}

class _MyHomePageBodyState extends State<MyHomePageBody> {
  BannerAd? bannerAd;
  bool? isLoaded;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    bannerAd = BannerAd(
      size: AdSize.banner,
      adUnitId: AdHelper.bannerAdUnitId,
      listener: BannerAdListener(onAdLoaded: (ad) {
        setState(() {
          isLoaded = true;
        });
      }, onAdFailedToLoad: (ad, error) {
        print("Ad failed to load with : ${error}");
      }),
      request: AdRequest(),
    );
    bannerAd?.load();
  }

  @override
  void dispose() {
    bannerAd?.dispose();
    super.dispose();
  }

  Widget checkForAd() {
    if (isLoaded == true) {
      return Container(
        child: AdWidget(
          ad: bannerAd!,
        ),
        width: bannerAd!.size.width.toDouble(),
        alignment: Alignment.center,
      );
    } else {
      return CircularProgressIndicator();
    }
  }

  final newYear = DateTime(2023, DateTime.january, 1);
  late String _diffrenceSeconds,
      _diffrenceMinutes,
      _diffrenceHours,
      _diffrenceDays;
  late Timer _everySecond;
  final diffrence =
      DateTime.now().difference(DateTime(2023, DateTime.january, 1));
  @override
  Widget build(BuildContext context) {
    _diffrenceSeconds = (60 - DateTime.now().second).toString();
    _diffrenceMinutes = (60 - DateTime.now().minute).toString();
    _diffrenceHours = (23 - DateTime.now().hour).toString();
    _diffrenceDays = (-diffrence.inDays).toString();
    _everySecond = Timer.periodic(
      Duration(seconds: 1),
      ((timer) {
        setState(() {});
      }),
    );
    return Center(
      child: Column(
        children: [
          Row(
            children: [
              Container(
                width: 200,
                height: 250,
                child: CircularPercentIndicator(
                  radius: 100,
                  center: Column(
                    children: [
                      Text(_diffrenceSeconds, style: TextStyle(fontSize: 60)),
                      Text("Seconds")
                    ],
                    mainAxisAlignment: MainAxisAlignment.center,
                  ),
                  animation: true,
                  addAutomaticKeepAlive: true,
                  animateFromLastPercent: true,
                  percent: 1 - (60 - (int.parse(_diffrenceSeconds))) / 60,
                  progressColor: Colors.black,
                  circularStrokeCap: CircularStrokeCap.round,
                  lineWidth: 20,
                ),
              ),
              Container(
                width: 200,
                height: 250,
                child: CircularPercentIndicator(
                  radius: 100,
                  center: Column(
                    children: [
                      Text(_diffrenceMinutes, style: TextStyle(fontSize: 60)),
                      Text("Minutes")
                    ],
                    mainAxisAlignment: MainAxisAlignment.center,
                  ),
                  animation: true,
                  addAutomaticKeepAlive: true,
                  animateFromLastPercent: true,
                  percent: 1 - (60 - (int.parse(_diffrenceMinutes))) / 60,
                  progressColor: Colors.black,
                  circularStrokeCap: CircularStrokeCap.round,
                  lineWidth: 20,
                ),
              )
            ],
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
          ),
          Row(
            children: [
              Container(
                width: 200,
                height: 250,
                child: CircularPercentIndicator(
                  radius: 100,
                  center: Column(
                    children: [
                      Text(_diffrenceHours, style: TextStyle(fontSize: 60)),
                      Text("Hours")
                    ],
                    mainAxisAlignment: MainAxisAlignment.center,
                  ),
                  animation: true,
                  addAutomaticKeepAlive: true,
                  animateFromLastPercent: true,
                  percent: 1 - (23 - (int.parse(_diffrenceHours))) / 24,
                  progressColor: Colors.black,
                  circularStrokeCap: CircularStrokeCap.round,
                  lineWidth: 20,
                ),
              ),
              Container(
                width: 200,
                height: 250,
                child: CircularPercentIndicator(
                  radius: 100,
                  center: Column(
                    children: [
                      Text(_diffrenceDays, style: TextStyle(fontSize: 60)),
                      Text("Days")
                    ],
                    mainAxisAlignment: MainAxisAlignment.center,
                  ),
                  animation: true,
                  addAutomaticKeepAlive: true,
                  animateFromLastPercent: true,
                  percent: 1 - (365 - (int.parse(_diffrenceDays))) / 365,
                  progressColor: Colors.black,
                  circularStrokeCap: CircularStrokeCap.round,
                  lineWidth: 20,
                ),
              )
            ],
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
          ),
          checkForAd(),
        ],
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
      ),
    );
  }
}
