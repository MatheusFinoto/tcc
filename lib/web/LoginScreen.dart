import 'package:app_tcc/view/HomeScreen.dart';
import 'package:app_tcc/web/HomeScreen.dart';
import 'package:app_tcc/widgets/CustonDecoration.dart';
import 'package:app_tcc/widgets/CustonWidget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class LoginScreenWEB extends StatefulWidget {
  @override
  _LoginScreenWEBState createState() => _LoginScreenWEBState();
}

class _LoginScreenWEBState extends State<LoginScreenWEB> {

  final emailController = TextEditingController();
  final senhaController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
       body: Row(
         children: <Widget>[
           Container(
             width: MediaQuery.of(context).size.width * 0.3,
             height: MediaQuery.of(context).size.height,
             decoration: BoxDecoration(
               color: Colors.white,
             ),
             child: Center(
               child: Column(
                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
                 children: <Widget>[
                   Container(),
                   Column(
                     mainAxisSize: MainAxisSize.min,
                     children: <Widget>[
                       Container(
                         child: Center(
                           child: Text("+ que \nAgenda", style: TextStyle(fontSize: 60, fontWeight: FontWeight.bold),),
                         ),
                       ),
                       SizedBox(height: 40,),
                       Container(
                         decoration: custonDecoraton,
                         padding: EdgeInsets.symmetric(horizontal: 16),
                         width: MediaQuery.of(context).size.width * 0.26,
                         height: 70,
                         child: Center(
                           child: TextField(
                             controller: emailController,
                             keyboardType: TextInputType.emailAddress,
                             autofocus: false,
                             cursorColor: Colors.black,
                             cursorWidth: 2,
                             style: TextStyle(color:Colors.black,),
                             decoration: InputDecoration(
                                 labelText: "Email",
                                 labelStyle: TextStyle(color: Colors.black,),
                                 prefixIcon: Icon(Icons.email, color: Colors.black),
                                 border: InputBorder.none
                             ),
                           ),
                         ),
                       ),
                       SizedBox(height: 20,),
                       Container(
                         decoration: custonDecoraton,
                         padding: EdgeInsets.symmetric(horizontal: 16),
                         width: MediaQuery.of(context).size.width * 0.26,
                         height: 70,
                         child: Center(
                           child: TextField(
                             controller: senhaController,
                             keyboardType: TextInputType.emailAddress,
                             autofocus: false,
                             obscureText: true,
                             cursorColor: Colors.black,
                             cursorWidth: 2,
                             style: TextStyle(color:Colors.black,),
                             decoration: InputDecoration(
                                 labelText: "Senha",
                                 labelStyle: TextStyle(color: Colors.black,),
                                 prefixIcon: Icon(Icons.email, color: Colors.black),
                                 border: InputBorder.none
                             ),
                           ),
                         ),
                       ),
                       SizedBox(height: 40,),
                       CustonWidget(
                         color: Colors.black,
                         width: 150,
                         heigh: 60,
                         child: Center(
                           child: InkWell(
                             child: Center(
                               child: Text("Entrar", style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.white),),
                             ),
                             onTap: (){
                               Navigator.of(context).push(MaterialPageRoute(builder: (context) => HomeScreenWEB()));
                             },
                           ),
                         ),
                       ),
                       SizedBox(height: 40,),

                     ],
                   ),
                   Container(
                       margin: EdgeInsets.symmetric(vertical: 10),
                       /*child: Column(
                         children: <Widget>[
                           Text("From", style: TextStyle(color: Colors.deepOrange, fontSize: 10),),
                           Text("Confly", style: TextStyle(color: Colors.deepOrange, fontSize: 16),),
                         ],
                       )*/
                   )
                 ],
               )
             )
           ),
           Container(
               width: MediaQuery.of(context).size.width * 0.7,
               height: MediaQuery.of(context).size.height,
               decoration: BoxDecoration(
                   color: Colors.green,
                   borderRadius: BorderRadius.circular(15)
               ),
           ),
         ],
       ),
    );
  }
}
