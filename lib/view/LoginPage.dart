import 'dart:convert';

import 'package:app_tcc/view/CadastroUsuarioPage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController emailController = TextEditingController(text: "iranildo.oliveralinx@gmail.com");
  TextEditingController senhaController = TextEditingController(text: "123456");

  _login()async{
    var email = emailController.text;
    var senha = senhaController.text;

    String body = jsonEncode({"email":email, "password":senha});
    print(body);
    var data = await http.post(
        "https://emob-app.herokuapp.com/customers/login",
        headers: {"Content-Type":"application/json"},
        body: body
    );
    var resposta = jsonDecode(data.body);
    print(resposta.toString());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xfff2ede4),
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Color(0xfff2ede4),
        leading: IconButton(
          onPressed: (){
            Navigator.of(context).pop();
          },
          icon: Icon(Icons.arrow_back, color: Colors.black,),
        ),
      ),
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height,
        child: Center(
          child: SingleChildScrollView(
              child: Container(
                padding: EdgeInsets.all(32),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        Text("e",style: TextStyle(color: Colors.black, fontSize: 50, fontWeight: FontWeight.bold),),
                        Text("M",style: TextStyle(color: Colors.orange, fontSize: 50, fontWeight: FontWeight.bold),),
                        Text("o",style: TextStyle(color: Colors.black, fontSize: 50, fontWeight: FontWeight.bold),),
                        Text("b",style: TextStyle(color: Colors.black, fontSize: 50, fontWeight: FontWeight.bold),),
                      ],
                    ),
                    SizedBox(
                      height: 50,
                    ),
                    Row(
                      children: <Widget>[
                        Text("Entre na sua conta", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),)
                      ],
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    TextField(
                      controller: emailController,
                      keyboardType: TextInputType.emailAddress,
                      cursorColor: Colors.black,
                      cursorWidth: 0.7,
                      style: TextStyle(color: Colors.black, fontSize: 18),
                      decoration: InputDecoration(
                        hintText: "E-mail",
                        border: InputBorder.none,
                        prefixIcon: Icon(Icons.email, color: Colors.black,),
                      ),
                    ),

                    SizedBox(
                      height: 20,
                    ),

                    TextField(
                      controller: senhaController,
                      keyboardType: TextInputType.text,
                      cursorColor: Colors.black,
                      cursorWidth: 0.7,
                      obscureText: true,
                      style: TextStyle(color: Colors.black, fontSize: 18),
                      decoration: InputDecoration(
                        hintText: "Senha",
                        border: InputBorder.none,
                        prefixIcon: Icon(Icons.vpn_key, color: Colors.black,),
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),

                    Center(
                        child: GestureDetector(
                          child: Text("Esqueceu sua senha?", style: TextStyle(color: Color(0xff195073)),),
                          onTap: (){

                          },
                        )
                    ),

                    SizedBox(
                      height: 50,
                    ),
                    
                   Center(
                     child: GestureDetector(
                       onTap: _login,
                       child: Container(
                         width: 150,
                         height: 50,
                         decoration: BoxDecoration(
                           color: Color(0xff195073),
                           borderRadius: BorderRadius.circular(15),
                         ),
                         child: Center(
                           child: Text("Continuar", style: TextStyle(color: Colors.white),),
                         ),
                       ),
                     ),
                   ),

                    SizedBox(
                      height: 20,
                    ),

                    Center(
                        child: GestureDetector(
                          child: Text("Ainda não possui uma conta? Cadastre-se", style: TextStyle(color: Color(0xff195073)),),
                          onTap: (){
                            Navigator.of(context).push(MaterialPageRoute(builder: (context) => CadastroUsuarioPage()));
                          },
                        )
                    ),

                  ],
                ),
              ),
          ),
        )
        ),
    );
  }
}
