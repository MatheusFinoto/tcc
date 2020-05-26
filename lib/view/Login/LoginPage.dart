import 'dart:convert';

import 'package:app_tcc/view/CadastroUsuario/CadastroUsuarioPage.dart';
import 'package:app_tcc/view/Login/login_store.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:http/http.dart' as http;
import 'package:app_tcc/utils/helper.dart' as global;
import 'package:mobx/mobx.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {

  LoginStore loginStore = LoginStore();


  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    autorun((_){
      if(loginStore.loggedIn){
        //// navigator
      }
    });
  }

  _login()async{

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

                    Observer(
                      builder: (_){
                        return Container(
                            height: 60,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: Colors.white
                            ),
                            child: Center(
                              child: TextField(
                                //controller: emailController,
                                onChanged: (value) => loginStore.setEmail(value),
                                keyboardType: TextInputType.emailAddress,
                                cursorColor: Colors.black,
                                cursorWidth: 0.7,
                                enabled: !loginStore.carregando,
                                style: TextStyle(color: Colors.black, fontSize: 18),
                                decoration: InputDecoration(
                                  hintText: "E-mail",
                                  border: InputBorder.none,
                                  prefixIcon: Icon(Icons.email, color: Colors.black,),
                                ),
                              ),
                            )
                        );
                      },
                    ),


                    SizedBox(
                      height: 20,
                    ),

                    Observer(
                      builder: (_){
                        return Container(
                            height: 60,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: Colors.white
                            ),
                            child: Center(
                              child: TextField(
                                onChanged: (value) => loginStore.setSenha(value),
                                keyboardType: TextInputType.text,
                                cursorColor: Colors.black,
                                cursorWidth: 0.7,
                                obscureText: !loginStore.senhaVisivel,
                                enabled: !loginStore.carregando,
                                style: TextStyle(color: Colors.black, fontSize: 18),
                                decoration: InputDecoration(
                                  suffix:IconButton(
                                    icon:loginStore.senhaVisivel ? Icon(Icons.visibility_off): Icon(Icons.visibility),
                                    onPressed: loginStore.toggleSenhaVisivel,
                                  ),
                                  hintText: "Senha",
                                  border: InputBorder.none,
                                  prefixIcon: Icon(Icons.vpn_key, color: Colors.black,),
                                ),
                              ),
                            )
                        );
                      },
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
                      height: 10,
                    ),

                   Observer(
                     builder: (_){
                       return SizedBox(
                         height: 50,
                         width: 150,
                         child: RaisedButton(
                           elevation: 0,
                           shape: RoundedRectangleBorder(
                               borderRadius: BorderRadius.circular(15)
                           ),
                           child: loginStore.carregando ? CircularProgressIndicator(valueColor: AlwaysStoppedAnimation(Colors.white),) : Text('Entrar'),
                           color: global.azul,
                           disabledColor: global.azul.withAlpha(100),
                           textColor: Colors.white,
                           onPressed: loginStore.loginPressed,
                         ),
                       );
                     },
                   ),
                    
                   /*Center(
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
*/
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
