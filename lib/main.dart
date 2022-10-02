import 'package:flutter/material.dart';
import 'package:productos_apps/screens/screens.dart';
import 'package:productos_apps/services/services.dart';
import 'package:provider/provider.dart';

void main() => runApp(AppState());

class AppState extends StatelessWidget {
  

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: ( _ ) => ProductsService() ),
        ChangeNotifierProvider(create: ( _ ) => AuthService() ),

      ],
      child: MyApp(),
    );
  }
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Productos app',
      initialRoute: 'checking',
      routes: {
        'login'     : ( _ ) => LoginScreen(),
        'register'  : ( _ ) => ResgiterScreen(),
        'home'      : ( _ ) => HomeScreen(),
        'product'   : ( _ ) => ProductScreen(),
        'checking'   : ( _ ) => CheckAuthScreen(),
      },
      scaffoldMessengerKey: NotificationsService.messengerKey,
      theme: ThemeData.light().copyWith(
        scaffoldBackgroundColor: Colors.grey[200],
        appBarTheme: const AppBarTheme(
          color:  Color.fromARGB(255, 255, 64, 129),
        ),
        floatingActionButtonTheme: const FloatingActionButtonThemeData(
          backgroundColor: Color.fromARGB(255, 255, 64, 129),
          elevation: 0,
        )
      ),
    );
  }
}