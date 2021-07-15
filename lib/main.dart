
import 'package:fashion_shop/pages/home.dart';
import 'package:fashion_shop/pages/signUp.dart';
import 'package:fashion_shop/pages/splash.dart';
import 'package:fashion_shop/provider/user_provider.dart';
import 'package:flutter/material.dart';
import 'package:fashion_shop/pages/login.dart';
import 'package:provider/provider.dart';
import 'provider/user_provider.dart';

// this is the stating pg screen
void main() {
  runApp(ChangeNotifierProvider(create: (_) => UserProvider.initialize(),
    child: MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: Colors.deepOrange
      ),
      home: screenController(),
    )));
      }

      class screenController extends StatelessWidget {
        @override
        Widget build(BuildContext context) {
          final user = Provider.of<UserProvider>(context); // fetchng this class
          switch (user.status){
            case Status.Uninitialized:
              return Splash();
            case Status.Unauthenticated:
              return Login();
            case Status.Authenticating:
              return Login();
            case Status.Authenticated:
              return Homepage();
            default: return Login();
          }
        }
      }


// shortcut for building statefulwidget = stf+enter


// for reaaranging code we use 'ctrl+alt+shift+l'
// giving ht specific no is not good