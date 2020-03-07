import 'package:flutter/material.dart';

class PerfilUsuario extends StatefulWidget {
  @override
  _PerfilUsuarioState createState() => _PerfilUsuarioState();
}

class _PerfilUsuarioState extends State<PerfilUsuario> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        elevation: 0,
      ),
      backgroundColor: Color(0xfff2ede4),
      body: SingleChildScrollView(
        child: Column(
          children: <Widget>[
            Stack(
              children: <Widget>[
                Container(
                  height: 250,
                ),
                Container(
                  height: 150,
                  color: Colors.blue,
                ),
                Container(
                  margin: EdgeInsets.only(top: 75),
                  height: 150,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Container(
                        width: 150,
                        height: 150,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(75),
                            color: Colors.white
                        ),
                      )
                    ],
                  )
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
