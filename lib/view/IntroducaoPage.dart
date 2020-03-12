import 'package:app_tcc/view/HomeScreen.dart';
import 'package:flare_flutter/flare_actor.dart';
import 'package:flutter/material.dart';

class IntrotucaoPage extends StatefulWidget {
  @override
  _IntrotucaoPageState createState() => _IntrotucaoPageState();
}

class _IntrotucaoPageState extends State<IntrotucaoPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xfff2ede4),
      body: Center(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height * 0.5,
              child: FlareActor('flare/boasvindas.flr', animation: "Untitled", fit: BoxFit.cover)
            ),
            Text("Seja bem vindo!", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),),
            GestureDetector(
              onTap: (){
                Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => HomePage()));
              },
              child: Container(
                width: 150,
                margin: EdgeInsets.only(top: 50),
                padding: EdgeInsets.all(16),
                decoration: BoxDecoration(
                    color: Color(0xff195073),
                    borderRadius: BorderRadius.circular(15)
                ),
                child: Center(child: Text("Começar", style: TextStyle(color: Colors.white),),),
              ),
            )
          ],
        )
      )
    );
  }
}
