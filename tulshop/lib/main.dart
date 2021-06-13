import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tulshop/src/bloc/bloc/checkout_bloc.dart';
import 'package:tulshop/src/dependency_injection.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:tulshop/src/ui/pages/splash/splash_page.dart';

import 'src/bloc/products/products_bloc.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  DependencyInjection.initialize();
  runApp(AppState());
}

class AppState extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<ProductsBloc>(create: (_) => ProductsBloc()),
        BlocProvider<CheckoutBloc>(create: (_) => CheckoutBloc())
      ],
      child: MyApp(),
    );
  }
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: SplashPage(),
    );
  }
}
