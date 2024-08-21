import 'package:crypto_app/presentation/screens/crypto_screens.dart';
import 'package:crypto_app/presentation/screens/home.dart';
import 'package:flutter/cupertino.dart';


class Routes{
  static  Route? onGenrate(RouteSettings setting){
    switch(setting.name){
       case Home.routeName:
        return CupertinoPageRoute(builder: (context) => const Home());
         case CryptocurrencyScreen.routeName:
        return CupertinoPageRoute(builder: (context) => const CryptocurrencyScreen());
    }
    return null;
  }
}