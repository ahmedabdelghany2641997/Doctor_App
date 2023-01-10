
import 'package:doctor_app1/componends/applocal.dart';
import 'package:doctor_app1/pages/splash_screen.dart';
import 'package:doctor_app1/pages/test.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter_localizations/flutter_localizations.dart';


void main() async{

  WidgetsFlutterBinding.ensureInitialized();

  runApp( MyApp());
  // ignore: invalid_use_of_visible_for_testing_member
  SharedPreferences.setMockInitialValues({});


}

class MyApp extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {return MyAppState();
  }

}

class MyAppState extends State<MyApp>{
  @override
  Widget build(BuildContext context) {
   return MaterialApp(
     debugShowCheckedModeBanner: false,
     // title: '${getLang(context, "welcome")}',
     theme: ThemeData(primarySwatch: Colors.blue),
     home: SplashScreen(),


     localizationsDelegates: const [
       AppLocale.delegate,
       GlobalMaterialLocalizations.delegate,
       GlobalWidgetsLocalizations.delegate
     ],
     supportedLocales: const [
       Locale("en", ""),
       Locale("ar", ""),
     ],
     localeResolutionCallback: (currentLang, supportLang) {
       if (currentLang != null) {
         for (Locale locale in supportLang) {
           if (locale.languageCode == currentLang.languageCode) {
             return currentLang;
           }
         }
       }
       return supportLang.first;
     },
   );
  }



}




