import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:tonbrains_quanton_mobile_app/common/dark_apptheme.dart';
import 'package:tonbrains_quanton_mobile_app/globals.dart';
import 'package:tonbrains_quanton_mobile_app/pages/home_page.dart';
import 'package:tonbrains_quanton_mobile_app/pages/signin_page.dart';
import 'package:tonbrains_quanton_mobile_app/common/apptheme.dart';
import 'package:provider/provider.dart' show ChangeNotifierProvider, Provider;
import 'package:tonbrains_quanton_mobile_app/services/api.dart';
import 'package:tonbrains_quanton_mobile_app/services/auth_svc.dart';
import 'package:tonbrains_quanton_mobile_app/services/theme_svc.dart';

import 'controls/controls_animations.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initAppTheme();
  return runApp(
    ChangeNotifierProvider<AuthService>(
        child: MyApp(), create: (context) => AuthService()),
  );
}

// void main() {
//   runApp(
//     /// Providers are above [MyApp] instead of inside it, so that tests
//     /// can use [MyApp] while mocking the providers
//     MultiProvider(
//       providers: [
//         ChangeNotifierProvider(create: (context) => AuthService()),
//       ],
//       create: (context) => CartModel(),
//       child: MyApp(),
//       // builder: (BuildContext context) {
//       //      return AuthService();
//       //    },
//     ),
//   );
// }
class MyApp extends StatefulWidget {
  @override
  State createState() => MyAppState();
}

class MyAppState extends State<MyApp> {
  @override
  void initState() {
    super.initState();
    navigator = GlobalKey<NavigatorState>();
    appTheme.addListener(() {
      if (mounted) setState(() {});
    });
  }

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'QUANTON',
      navigatorKey: navigator,
      routes: {
        '/login': (context) => LoginPage(),
      },
      debugShowCheckedModeBanner: false,
      themeMode: appTheme.currentTheme(),
      darkTheme: ThemeData(
        dividerColor: AppDarkTheme.blue,
        cursorColor: AppDarkTheme.blue,
        textSelectionHandleColor: AppDarkTheme.blue,
        textSelectionColor: AppDarkTheme.blue,
        selectedRowColor: AppDarkTheme.blue,
        tabBarTheme: TabBarTheme(
          indicator: UnderlineTabIndicator(
              borderSide: BorderSide(color: AppDarkTheme.blue)),
        ),
        bottomNavigationBarTheme:
            BottomNavigationBarThemeData(unselectedItemColor: Colors.red),
        toggleableActiveColor: AppDarkTheme.blue,
        accentColor: AppDarkTheme.blue,
        focusColor: AppDarkTheme.blue,
        brightness: Brightness.dark,
        buttonTheme: ButtonThemeData(
          buttonColor: AppDarkTheme.blue,
        ),
        iconTheme: IconThemeData(color: AppDarkTheme.white),
        bottomAppBarColor: AppDarkTheme.dark,
        textTheme: TextTheme(
          caption: TextStyle(color: AppDarkTheme.white),
          button: TextStyle(color: AppDarkTheme.white),
          overline: TextStyle(color: AppDarkTheme.white),
          bodyText1: TextStyle(color: AppDarkTheme.white),
          bodyText2: TextStyle(color: AppDarkTheme.white),
          headline1: TextStyle(color: AppDarkTheme.white),
          headline2: TextStyle(color: AppDarkTheme.white),
          headline3: TextStyle(color: AppDarkTheme.white),
          headline4: TextStyle(color: AppDarkTheme.white),
          subtitle1: TextStyle(fontSize: 19, color: AppDarkTheme.white),
          subtitle2: TextStyle(fontSize: 19, color: AppDarkTheme.white),
        ),
        inputDecorationTheme: InputDecorationTheme(
            hintStyle: TextStyle(color: AppDarkTheme.blue),
            labelStyle: TextStyle(color: AppDarkTheme.blue),
            errorStyle: TextStyle(color: AppDarkTheme.blue),
            enabledBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: AppDarkTheme.blue)),
            border: UnderlineInputBorder(
                borderSide: BorderSide(color: AppDarkTheme.blue)),
            errorBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: AppDarkTheme.blue)),
            focusedBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: AppDarkTheme.blue))),
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        // primarySwatch: Colors.blue,
        primaryColor: AppDarkTheme.blue,
        scaffoldBackgroundColor: AppDarkTheme.dark,
        backgroundColor: AppDarkTheme.blue,
        appBarTheme: new AppBarTheme(
            elevation: 0.0,
            color: AppDarkTheme.dark,
            textTheme: AppTheme.textThemeAppBar),

        // This makes the visual density adapt to the platform that you run
        // the app on. For desktop platforms, the controls will be smaller and
        // closer together (more dense) than on mobile platforms.
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      theme: ThemeData(
        dividerColor: AppTheme.primaryRed,
        cursorColor: AppTheme.primaryRed,
        textSelectionHandleColor: AppTheme.primaryRed,
        textSelectionColor: AppTheme.primaryRed,
        selectedRowColor: AppTheme.primaryRed,
        tabBarTheme: TabBarTheme(
          indicator: UnderlineTabIndicator(
              borderSide: BorderSide(color: AppTheme.primaryRed)),
        ),
        toggleableActiveColor: AppTheme.primaryRed,
        accentColor: AppTheme.primaryRed,
        focusColor: AppTheme.primaryRed,
        brightness: Brightness.dark,

        buttonTheme: ButtonThemeData(
            buttonColor: AppTheme.white, textTheme: ButtonTextTheme.accent
            //textTheme: TextTheme()
            // textTheme:
            ),
        bottomAppBarColor: Colors.white,
        textTheme: TextTheme(
          caption: TextStyle(color: AppTheme.darkText),
          button: TextStyle(color: AppTheme.darkText),
          overline: TextStyle(color: AppTheme.darkText),
          bodyText1: TextStyle(color: AppTheme.darkText),
          bodyText2: TextStyle(color: AppTheme.darkText),
          headline1: TextStyle(color: AppTheme.darkText),
          headline2: TextStyle(color: AppTheme.darkText),
          headline3: TextStyle(color: AppTheme.darkText),
          headline4: TextStyle(color: AppTheme.darkText),
          subtitle1: TextStyle(fontSize: 19, color: AppTheme.darkText),
          subtitle2: TextStyle(fontSize: 19, color: AppTheme.darkText),
        ),
        inputDecorationTheme: InputDecorationTheme(
            hintStyle: TextStyle(color: AppTheme.primaryRed),
            labelStyle: TextStyle(color: AppTheme.primaryRed),
            errorStyle: TextStyle(color: AppTheme.primaryRed),
            enabledBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: AppTheme.primaryRed)),
            border: UnderlineInputBorder(
                borderSide: BorderSide(color: AppTheme.primaryRed)),
            errorBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: AppTheme.primaryRed)),
            focusedBorder: UnderlineInputBorder(
                borderSide: BorderSide(color: AppTheme.primaryRed))),
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        // primarySwatch: Colors.blue,
        primaryColor: AppTheme.primaryRed,
        scaffoldBackgroundColor: Colors.white,
        backgroundColor: Colors.white,
        appBarTheme: new AppBarTheme(
            elevation: 0.0,
            color: Colors.white,
            textTheme: AppTheme.textThemeAppBar),

        // This makes the visual density adapt to the platform that you run
        // the app on. For desktop platforms, the controls will be smaller and
        // closer together (more dense) than on mobile platforms.
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: FutureBuilder<QuanTonUser>(
          future: Provider.of<AuthService>(context).getUser(),
          builder: (context, AsyncSnapshot<QuanTonUser> snapshot) {
            if (snapshot.connectionState == ConnectionState.done) {
              // log error to console
              if (snapshot.error != null) {
                print("error");
                return Text(snapshot.error.toString());
              }
              // redirect to the proper page
              return snapshot.hasData && snapshot.data.authorized
                  ? HomePage()
                  : LoginPage();
            } else {
              // show loading indicator
              return LoadingCircle();
            }
          }),
    );
  }
}

class LoadingCircle extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        child: CircularProgressIndicator(),
        alignment: Alignment(0.0, 0.0),
      ),
    );
  }
}
