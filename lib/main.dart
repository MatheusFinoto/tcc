import 'package:app_tcc/view/HomePage.dart';
import 'package:app_tcc/view/IntroducaoPage.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      //systemNavigationBarColor: Colors.white, // navigation bar color
      statusBarColor: Colors.transparent, // status bar color
    ));
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: IntrotucaoPage()
    );
  }
}

class Splash extends StatefulWidget {
  @override
  _SplashState createState() => _SplashState();
}

class _SplashState extends State<Splash> {

  Future getPlatform()async{
    return Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context)=> HomePage()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
        future: getPlatform(),
        builder: (context, snapshot){
          return Center(
            child: CircleAvatar(maxRadius: 100, backgroundColor: Colors.red,),
          );
        },
      ),
    );
  }
}

