import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:microblog/mobx/FactoryGetIt.dart';
import 'package:microblog/screens/LoginScreen.dart';
import 'package:microblog/screens/MainScreen.dart';
import 'package:microblog/screens/NewsCompanyScreen.dart';
import 'package:microblog/screens/RegisterScreen.dart';
import 'package:microblog/screens/SplashScreen.dart';
import 'package:microblog/util/AppUtil.dart';
import 'package:intl/date_symbol_data_local.dart';


Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await  initGetIt();
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    initializeDateFormatting();
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    AppUtil().rootAppContext = context;
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        scaffoldBackgroundColor: Colors.white,
        dividerTheme: DividerThemeData(
          thickness: 0.3
        ),
        canvasColor: Colors.grey,
        splashColor: Colors.white,
        iconTheme: IconThemeData(
          color: Colors.black,
        ),
        appBarTheme: AppBarTheme(
                    color: Colors.grey[50],
                    textTheme: TextTheme(
                      headline6: GoogleFonts.nunitoSans(
                          fontSize: 20,
                          fontWeight: FontWeight.w500,
                          letterSpacing: 0.15,
                          color: Colors.black),
                      caption: GoogleFonts.nunitoSans(
                          fontSize: 12,
                          fontWeight: FontWeight.w400,
                          letterSpacing: 0.4,
                          color: Colors.white),
                    ))
      ),
      initialRoute: "/splash",
      
      darkTheme: ThemeData(
        iconTheme: IconThemeData(
                  color: Colors.white,
                ),
        canvasColor: Colors.white,
        splashColor: Colors.black,
        dividerTheme: DividerThemeData(
                  color: Colors.grey[600],
                  thickness: 0.3
                ),
        scaffoldBackgroundColor: Colors.grey[900],
        cardColor: Colors.grey[800],
        appBarTheme: AppBarTheme(
                    color:  Colors.grey[700],
                    elevation: 0,
                    textTheme: TextTheme(
                      headline6: GoogleFonts.nunitoSans(
                          fontSize: 20,
                          fontWeight: FontWeight.w500,
                          letterSpacing: 0.15,
                          color: Colors.white),
                      caption: GoogleFonts.nunitoSans(
                          fontSize: 12,
                          fontWeight: FontWeight.w400,
                          letterSpacing: 0.4,
                          color: Colors.white),
                    ))
      ),
      routes: {
        "/splash" : (context) => SplashScreen(),
        "/LoginScreen": (context) => LoginScreen(),
        "/RegisterScreen" : (context)=>RegisterScreen(),
        "/MainScreen": (context) =>MainScreen(),
        "/NewsCompanyScreen": (context) => NewsCompanyScreen(),
      },
    );
  }
}