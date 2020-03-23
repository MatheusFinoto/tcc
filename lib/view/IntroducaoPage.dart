import 'package:app_tcc/utils/Preferencias.dart';
import 'package:app_tcc/view/HomePage.dart';
import 'package:flutter/material.dart';

class IntrotucaoPage extends StatefulWidget {
  @override
  _IntrotucaoPageState createState() => _IntrotucaoPageState();
}

class _IntrotucaoPageState extends State<IntrotucaoPage> {
  PageController pageController;
  Preferencias preferencias = Preferencias();

  int pag = 0;
  @override
  void initState() {
    super.initState();
    pageController = PageController(initialPage: pag, keepPage: true);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xfff2ede4),
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
                      width: MediaQuery.of(context).size.width,
                      height: MediaQuery.of(context).size.height * 0.5,
                      child: Row(
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
                      /*decoration: BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage("assets/images/intro_1.png"),
                          )
                      ),*/
                    ),
                    Text("Seja bem vindo ao eMob!", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),),
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
                                child: Center(child: Text("Próximo", style: TextStyle(fontSize: 18 ,color: Color(0xff195073),),),),
                              ),
                            ),
                          ),
                        ),

                      ],
                    ),

                  ],
                )
            ),
          ),
          Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            child: Center(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    Container(
                      width: MediaQuery.of(context).size.width,
                      height: MediaQuery.of(context).size.height * 0.5,
                      decoration: BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage("assets/images/intro_1.png"),
                          )
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.all(16),
                      child: Text("Encontrar seu novo lar ficou muito mais facil!", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20,),textAlign: TextAlign.center,),
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
                                child: Center(child: Text("Próximo", style: TextStyle(fontSize: 18 ,color: Color(0xff195073),),),),
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
          Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            child: Center(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: <Widget>[
                    Container(
                      width: MediaQuery.of(context).size.width,
                      height: MediaQuery.of(context).size.height * 0.5,
                      decoration: BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage("assets/images/intro_2.png"),
                          )
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.all(16),
                      child: Text("Com apenas alguns toques você podera ver seu futuro imovel", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20,),textAlign: TextAlign.center,),
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
                                preferencias.setIntro(true);
                                Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context) => HomePage()));
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
          )
        ],
      )
    );
  }
}