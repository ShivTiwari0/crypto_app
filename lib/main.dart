import 'package:crypto_app/core/routes.dart';
import 'package:crypto_app/core/ui.dart';
import 'package:crypto_app/logic/cubit/crypto_cubit.dart';
import 'package:crypto_app/presentation/screens/home.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});


  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => CryptocurrencyCubit(),
        )
      ],
     
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
         onGenerateRoute: Routes.onGenrate,
     
          theme: Themes.defaultTheme,
         initialRoute: Home.routeName
        ),
      );
  
  }
}
