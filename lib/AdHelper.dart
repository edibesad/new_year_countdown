import 'dart:io';

class AdHelper {
  static String get bannerAdUnitId {
    if (Platform.isAndroid) {
      return "ca-app-pub-3940256099942544/6300978111";
    } else if (Platform.isIOS) {
      return "ca-app-pub-8373925838947436/3970258342";
    } else {
      throw new UnsupportedError("Unsupported platform");
    }
  }
}
