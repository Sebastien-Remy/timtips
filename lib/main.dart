import 'package:app_tracking_transparency/app_tracking_transparency.dart';
import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:firebase_analytics/observer.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:provider/provider.dart';
import 'package:rate_my_app/rate_my_app.dart';
import 'ad_state.dart';
import 'auth/firebase_user_provider.dart';
import 'package:timtips/login_page/login_page_widget.dart';
import 'package:timtips/main_page/main_page_widget.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  // Ads
  final appTrackingState = AppTrackingTransparency.requestTrackingAuthorization();
  final initFuture = MobileAds.instance.initialize();
  final adState = AdState(appTrackingState.then((value) => initFuture));

  runApp(
      Provider.value(
        value: adState,
        builder: (context, child) => MyApp(),
      )
  );
}

class MyApp extends StatefulWidget {
  // This widget is the root of your application.
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  // Login
  Stream<TimtipsFirebaseUser> userStream;
  TimtipsFirebaseUser initialUser;

  // Firebase Analytics
  FirebaseAnalytics analytics = FirebaseAnalytics();

  // Rate App
  RateMyApp rateMyApp = RateMyApp(
    preferencesPrefix: 'rateMyApp_',
    minDays: 5, // Show rate popup on first day of install.
    minLaunches: 7, // Show rate popup after 5 launches of app after minDays is passed.
    remindLaunches: 10,
    remindDays: 7,
  );

  @override
  void initState() {
    super.initState();

    // Rate
    WidgetsBinding.instance?.addPostFrameCallback((_) async {
      await rateMyApp.init();
      if (mounted && rateMyApp.shouldOpenDialog) {
        rateMyApp.showRateDialog(context);
      }
    });

    // User listening
    userStream = timtipsFirebaseUserStream()
      ..listen((user) => initialUser ?? setState(() => initialUser = user));
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'timtips',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: initialUser == null
          ? Center(
              child: Builder(
                builder: (context) => Image.asset(
                  'assets/images/mac512.png',
                  width: MediaQuery.of(context).size.width / 2,
                  fit: BoxFit.fitWidth,
                ),
              ),
            )
          : currentUser.loggedIn
              ? MainPageWidget()
              : LoginPageWidget(),
      navigatorObservers: [
        FirebaseAnalyticsObserver(analytics: analytics),
      ],
    );
  }
}
