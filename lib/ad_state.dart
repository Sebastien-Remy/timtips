import 'dart:io';
import 'package:google_mobile_ads/google_mobile_ads.dart';

class AdState {

  // Tests Ad Id
  // https://developers.google.com/admob/android/test-ads
  static const String BANNER_AD_ANDROID = "ca-app-pub-3940256099942544/6300978111"; // TEST
  static const String BANNER_AD_IOS = "ca-app-pub-3940256099942544/6300978111"; // TEST


  /*
  // Production Ad Id
  static const String BANNER_AD_ANDROID = "ca-app-pub-2799698082207881/5338005596";
  static const String BANNER_AD_IOS = "ca-app-pub-2799698082207881/6487435738";
 */

  Future<InitializationStatus> initialization;

  BannerAdListener _bannerAdListener = BannerAdListener(
    onAdLoaded: (ad) => print ('Ad loaded ${ad.adUnitId}.'),
    onAdClosed: (ad) => print ('Ad closed ${ad.adUnitId}.'),
    onAdFailedToLoad: (ad, error) => print ('Ad failed to load ${ad.adUnitId}, $error.'),
    onAdOpened: (ad) => print ('Ad opened ${ad.adUnitId}.'),
    onAdImpression: (ad) => print ('Ad impression ${ad.adUnitId}.'),
    onAdWillDismissScreen: (ad) => print ('Ad will dismiss screen ${ad.adUnitId}.'),
  );

  // Constructor
  AdState(this.initialization);

  // Getters
  String get bannerAdUnit => Platform.isAndroid ? BANNER_AD_ANDROID : BANNER_AD_IOS;
  BannerAdListener get bannerAdListener => _bannerAdListener;
}