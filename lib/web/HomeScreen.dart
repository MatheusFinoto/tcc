import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomeScreenWEB extends StatefulWidget {
  @override
  _HomeScreenWEBState createState() => _HomeScreenWEBState();
}

class _HomeScreenWEBState extends State<HomeScreenWEB> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff090D28),
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child:Row(
          children: <Widget>[
            Expanded(
              flex: 2,
              child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.only(topRight: Radius.circular(15), bottomRight: Radius.circular(15) ),
                  color: Color(0xff181C3A)
                ),
                height: MediaQuery.of(context).size.height,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Container(
                      width: 100,
                      height: 100,
                      padding: EdgeInsets.all(16),
                      child: FlutterLogo(),
                    ),
                    Column(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: <Widget>[
                        meusIconer(Icons.home),
                        meusIconer(Icons.account_balance_wallet),
                        meusIconer(Icons.block),
                        meusIconer(Icons.format_line_spacing),
                        meusIconer(Icons.credit_card),
                        Divider(
                          height: 10,
                        ),
                        meusIconer(Icons.add)
                      ],
                    ),
                    Container(
                      width: 100,
                      height: 100,
                      child: Center(child: Icon(Icons.exit_to_app, color: Colors.white,),),
                    ),
                  ],
                ),

              ),
            ),
            Expanded(
              flex: 10,
              child: Container(
                  height: MediaQuery.of(context).size.height,
                  //color: Color(0xff413C59)
              ),
            ),
          ],
        )
      ),
    );
  }

  Widget meusIconer(IconData icone){
    return Padding(
      padding: EdgeInsets.all(8),
      child: Icon(icone, color: Colors.white,),
    );
  }
}
