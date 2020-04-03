import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:app_tcc/utils/helper.dart' as globals;

class CadastroUsuarioPage extends StatefulWidget {
  @override
  _CadastroUsuarioPageState createState() => _CadastroUsuarioPageState();
}

class _CadastroUsuarioPageState extends State<CadastroUsuarioPage> {

  PageController pageController;


  @override
  void initState() {
    super.initState();
    pageController = PageController(initialPage: 0, keepPage: true);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black,),
          onPressed: (){Navigator.of(context).pop();},
        ),
        backgroundColor: globals.background,
      ),
      backgroundColor: globals.background,
      body: PageView(
        physics: NeverScrollableScrollPhysics(),
        controller: pageController,
        children: <Widget>[
          Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            child: Center(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    Container(
                      width: MediaQuery.of(context).size.width * 0.8,
                      height: MediaQuery.of(context).size.height * 0.5,
                      decoration: BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage("assets/images/step.png"),
                          )
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.all(16),
                      child: Text("Vamos dar inicio ao seu cadastro!", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20,),textAlign: TextAlign.center,),
                    ),
                    Row(
                      children: <Widget>[
                        Expanded(
                          flex: 1,
                          child: Container(),
                        ),
                        Expanded(
                          flex: 1,
                          child: Align(
                            alignment: Alignment.center,
                            child: GestureDetector(
                              onTap: (){
                                pageController.animateToPage(1, curve: Curves.ease,
                                    duration: Duration(milliseconds: 600));
                                //Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => HomePage()));
                              },
                              child: Container(
                                width: 150,
                                margin: EdgeInsets.only(top: 50),
                                padding: EdgeInsets.all(16),
                                child: Center(child: Text("Começar", style: TextStyle(fontSize: 18 ,color: Color(0xff195073),),),),
                              ),
                            ),
                          ),
                        )

                      ],
                    ),

                  ],
                )
            ),
          ),
          SingleChildScrollView(
            child: Container(
              margin: EdgeInsets.only(top: 100),
              child: Center(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      Container(
                        width: MediaQuery.of(context).size.width * 0.8,
                        height: MediaQuery.of(context).size.height * 0.3,
                        decoration: BoxDecoration(
                            image: DecorationImage(
                              image: AssetImage("assets/images/person.png"),
                            )
                        ),
                      ),
                      Row(
                        children: <Widget>[
                          Padding(
                            padding: EdgeInsets.symmetric(vertical: 4, horizontal: 16),
                            child: Text("Precisamos do seu Nome", style: TextStyle(fontWeight: FontWeight.w400, fontSize: 20,),textAlign: TextAlign.start,),
                          ),
                        ],
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(vertical: 4, horizontal: 16),
                        child: TextField(
                          keyboardType: TextInputType.text,
                          cursorColor: Colors.black,
                          cursorWidth: 0.7,
                          style: TextStyle(color: Colors.black, fontSize: 18),
                          decoration: InputDecoration(
                            labelText: "Nome",
                            labelStyle: TextStyle(color: Colors.black),
                            prefixIcon: Icon(Icons.person_outline, color: Colors.black,),
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(15),
                                borderSide: BorderSide(
                                    color: Colors.black
                                )
                            ),
                            focusedBorder:OutlineInputBorder(
                                borderRadius: BorderRadius.circular(15),
                                borderSide: BorderSide(
                                    color: Colors.black
                                )
                            ),
                          ),
                        ),
                      ),

                      Row(
                        children: <Widget>[
                          Expanded(
                            flex: 1,
                            child: Container(),
                          ),
                          Expanded(
                            flex: 1,
                            child: Align(
                              alignment: Alignment.center,
                              child: GestureDetector(
                                onTap: (){
                                  pageController.animateToPage(2, curve: Curves.ease,
                                      duration: Duration(milliseconds: 600));
                                  //Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => HomePage()));
                                },
                                child: Container(
                                  width: 150,
                                  margin: EdgeInsets.only(top: 50),
                                  padding: EdgeInsets.all(16),
                                  child: Center(child: Text("Proximo", style: TextStyle(fontSize: 18 ,color: Color(0xff195073),),),),
                                ),
                              ),
                            ),
                          )

                        ],
                      ),

                    ],
                  )
              ),
            ),
          ),
          SingleChildScrollView(
            child: Container(
              margin: EdgeInsets.only(top: 100),
              child: Center(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      Container(
                        width: MediaQuery.of(context).size.width * 0.8,
                        height: MediaQuery.of(context).size.height * 0.3,
                        decoration: BoxDecoration(
                            image: DecorationImage(
                              image: AssetImage("assets/images/email.png"),
                            )
                        ),
                      ),
                      Row(
                        children: <Widget>[
                          Padding(
                            padding: EdgeInsets.symmetric(vertical: 4, horizontal: 16),
                            child: Text("Agora seu E-mail", style: TextStyle(fontWeight: FontWeight.w400, fontSize: 20,),textAlign: TextAlign.start,),
                          ),
                        ],
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(vertical: 4, horizontal: 16),
                        child: TextField(
                          keyboardType: TextInputType.emailAddress,
                          cursorColor: Colors.black,
                          cursorWidth: 0.7,
                          style: TextStyle(color: Colors.black, fontSize: 18),
                          decoration: InputDecoration(
                            labelText: "E-mail",
                            labelStyle: TextStyle(color: Colors.black),
                            prefixIcon: Icon(Icons.email, color: Colors.black,),
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(15),
                                borderSide: BorderSide(
                                    color: Colors.black
                                )
                            ),
                            focusedBorder:OutlineInputBorder(
                                borderRadius: BorderRadius.circular(15),
                                borderSide: BorderSide(
                                    color: Colors.black
                                )
                            ),
                          ),
                        ),
                      ),

                      Row(
                        children: <Widget>[
                          Expanded(
                            flex: 1,
                            child: Container(),
                          ),
                          Expanded(
                            flex: 1,
                            child: Align(
                              alignment: Alignment.center,
                              child: GestureDetector(
                                onTap: (){
                                  pageController.animateToPage(3, curve: Curves.ease,
                                      duration: Duration(milliseconds: 600));
                                  //Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => HomePage()));
                                },
                                child: Container(
                                  width: 150,
                                  margin: EdgeInsets.only(top: 50),
                                  padding: EdgeInsets.all(16),
                                  child: Center(child: Text("Proximo", style: TextStyle(fontSize: 18 ,color: Color(0xff195073),),),),
                                ),
                              ),
                            ),
                          )

                        ],
                      ),

                    ],
                  )
              ),
            ),
          ),
          SingleChildScrollView(
            child: Container(
              margin: EdgeInsets.only(top: 100),
              child: Center(
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: <Widget>[
                      Container(
                        width: MediaQuery.of(context).size.width * 0.8,
                        height: MediaQuery.of(context).size.height * 0.3,
                        decoration: BoxDecoration(
                            image: DecorationImage(
                              image: AssetImage("assets/images/senha.png"),
                            )
                        ),
                      ),
                      Row(
                        children: <Widget>[
                          Padding(
                            padding: EdgeInsets.symmetric(vertical: 4, horizontal: 16),
                            child: Text("Lembre-se deu usar uma senha forte", style: TextStyle(fontWeight: FontWeight.w400, fontSize: 20,),textAlign: TextAlign.start,),
                          ),
                        ],
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(vertical: 4, horizontal: 16),
                        child: TextField(
                          keyboardType: TextInputType.emailAddress,
                          cursorColor: Colors.black,
                          cursorWidth: 0.7,
                          style: TextStyle(color: Colors.black, fontSize: 18),
                          decoration: InputDecoration(
                            labelText: "Senha",
                            labelStyle: TextStyle(color: Colors.black),
                            prefixIcon: Icon(Icons.vpn_key  , color: Colors.black,),
                            border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(15),
                                borderSide: BorderSide(
                                    color: Colors.black
                                )
                            ),
                            focusedBorder:OutlineInputBorder(
                                borderRadius: BorderRadius.circular(15),
                                borderSide: BorderSide(
                                    color: Colors.black
                                )
                            ),
                          ),
                        ),
                      ),

                      Row(
                        children: <Widget>[
                          Expanded(
                            flex: 1,
                            child: Container(),
                          ),
                          Expanded(
                            flex: 1,
                            child: Align(
                              alignment: Alignment.center,
                              child: GestureDetector(
                                onTap: (){
                                  pageController.animateToPage(2, curve: Curves.ease,
                                      duration: Duration(milliseconds: 600));
                                  //Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => HomePage()));
                                },
                                child: Container(
                                  width: 150,
                                  margin: EdgeInsets.only(top: 50),
                                  padding: EdgeInsets.all(16),
                                  child: Center(child: Text("Proximo", style: TextStyle(fontSize: 18 ,color: Color(0xff195073),),),),
                                ),
                              ),
                            ),
                          )

                        ],
                      ),

                    ],
                  )
              ),
            ),
          ),
        ],
      )
    );
  }
}
