import 'package:app_tcc/model/ImoveisData.dart';
import 'package:app_tcc/view/ImovelPage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class PerfilPage extends StatefulWidget {
  @override
  _PerfilPageState createState() => _PerfilPageState();
}

class _PerfilPageState extends State<PerfilPage> {
  PageController _pageController;

  @override
  void initState() {
    super.initState();
    _pageController = PageController(viewportFraction: 0.9, initialPage: 0);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xffd96b0b),
        elevation: 0,
      ),
      backgroundColor: Color(0xfff2ede4),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Stack(
              children: <Widget>[
                Container(
                  height: 250,
                  color: Color(0xfff2ede4),
                ),
                Container(
                  height: 150,
                  color: Color(0xffd96b0b),
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
            ),
            Container(
              padding: EdgeInsets.only(bottom: 50),
              width: MediaQuery.of(context).size.width,
              child: Column(
                children: <Widget>[
                  Text("Matheus Finoto", style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),),
                  Text("Bebedouro - SP", style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400),),
                ],
              ),
            ),
            Divider(
              height: 10,
            ),
            Padding(
              padding: EdgeInsets.all(16),
              child: Text("Meus Imoveis", style: TextStyle(fontSize: 23, fontWeight: FontWeight.w500),),
            ),
            Container(
              height: 550,
              child: FutureBuilder(
                future: Future.delayed(Duration(seconds: 2), (){
                  List<ImoveisData> listImoveisData = [
                    ImoveisData("Rua de casa","5", "https://images.pexels.com/photos/106399/pexels-photo-106399.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940", ["https://images.pexels.com/photos/106399/pexels-photo-106399.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940","https://images.pexels.com/photos/87223/pexels-photo-87223.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940","https://images.pexels.com/photos/32870/pexels-photo.jpg?auto=compress&cs=tinysrgb&dpr=2&h=750&w=1260"], "23.00", "24.00", "Casa", "Sala, Cozinha, Copa, 2 Suits", "Aluguel"),
                    ImoveisData("Rua de casa","5", "https://images.pexels.com/photos/323780/pexels-photo-323780.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500", ["https://images.pexels.com/photos/323780/pexels-photo-323780.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500","https://images.pexels.com/photos/87223/pexels-photo-87223.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940","https://images.pexels.com/photos/32870/pexels-photo.jpg?auto=compress&cs=tinysrgb&dpr=2&h=750&w=1260"], "23.00", "24.00", "Casa", "Sala, Cozinha, Copa, 2 Suits", "Aluguel"),
                    ImoveisData("Rua de casa","5", "https://images.pexels.com/photos/2102587/pexels-photo-2102587.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500", ["https://images.pexels.com/photos/2102587/pexels-photo-2102587.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500","https://images.pexels.com/photos/87223/pexels-photo-87223.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940","https://images.pexels.com/photos/32870/pexels-photo.jpg?auto=compress&cs=tinysrgb&dpr=2&h=750&w=1260"], "23.00", "24.00", "Casa", "Sala, Cozinha, Copa, 2 Suits", "Aluguel"),
                  ];
                  return  listImoveisData;
                }),
                builder: (context, snapshot){
                  switch(snapshot.connectionState){
                    case ConnectionState.none:
                    case ConnectionState.waiting:
                      return Center(child: CircularProgressIndicator(),);
                      break;
                    default:
                      if(!snapshot.hasData){
                        return Text("Você não possui turmas cadastradas");
                      }else{
                        return PageView.builder(
                          controller: _pageController,
                          itemCount: snapshot.data.length,
                          itemBuilder: (context, index){
                            return AnimatedBuilder(
                              animation: _pageController,
                              builder: (BuildContext context, Widget widget) {
                                double value = 1;
                                if (_pageController.position.haveDimensions) {
                                  value = _pageController.page - index;
                                  value = (1 - (value.abs() * 0.3) + 0.06).clamp(0.0, 1.0);
                                }
                                return Center(
                                  child: Container(
                                    height: Curves.easeInOut.transform(value) *  475,
                                    width: Curves.easeInOut.transform(value) * 400.0,
                                    child: widget,
                                  ),
                                );
                              },
                              child: Container(
                                margin: EdgeInsets.all(2),
                                decoration: BoxDecoration(
                                    color: Theme.of(context).cardColor,
                                    borderRadius: BorderRadius.circular(15)
                                ),
                                child: GestureDetector(
                                  child: Container(
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      children: <Widget>[
                                        Container(
                                          decoration: BoxDecoration(
                                            borderRadius: BorderRadius.only(topLeft: Radius.circular(5), topRight: Radius.circular(5),),
                                            image: DecorationImage(
                                                image: NetworkImage(snapshot.data[index].foto,),
                                                fit: BoxFit.cover
                                            ),
                                          ),
                                          height: 325,
                                        ),
                                        Expanded(
                                          child: ListView(
                                            children: <Widget>[Container(
                                                padding: EdgeInsets.symmetric(vertical: 8,  horizontal: 8),
                                                height: 125,
                                                width: MediaQuery.of(context).size.width - 40,
                                                child: Column(
                                                  crossAxisAlignment: CrossAxisAlignment.start,
                                                  mainAxisAlignment: MainAxisAlignment.start,
                                                  children: <Widget>[
                                                    Text(snapshot.data[index].tipo, style: TextStyle(fontSize: 20, fontWeight: FontWeight.w400, ),),
                                                    Row(
                                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                      crossAxisAlignment: CrossAxisAlignment.start,
                                                      children: <Widget>[
                                                        Text(snapshot.data[index].endereco, style: TextStyle(fontSize: 18, fontWeight: FontWeight.w300, ),),
                                                        Icon(Icons.map)
                                                      ],

                                                    ),
                                                    SizedBox(
                                                      height: 15,
                                                    ),
                                                    Row(
                                                      children: <Widget>[
                                                        Text(snapshot.data[index].tipoVenda, style: TextStyle(fontSize: 25, fontWeight: FontWeight.w400, ),),
                                                        Container(
                                                            width: 70,
                                                            decoration: BoxDecoration(
                                                                color: Color(0xff195073),
                                                                borderRadius: BorderRadius.circular(25)
                                                            ),
                                                            child: Padding(
                                                              padding: EdgeInsets.all(8),
                                                              child: Center(
                                                                  child: Row(
                                                                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                                                                    crossAxisAlignment: CrossAxisAlignment.center,
                                                                    children: <Widget>[
                                                                      Text(snapshot.data[index].avaliacao, style: TextStyle(color: Colors.white, fontSize: 16),),
                                                                      Icon(Icons.star, color: Colors.white,size: 20,)
                                                                    ],
                                                                  )
                                                              ),
                                                            )
                                                        ),
                                                      ],
                                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                                      crossAxisAlignment: CrossAxisAlignment.start,
                                                    ),
                                                  ],
                                                )
                                            ),],
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                  onTap: (){
                                    Navigator.of(context).push(MaterialPageRoute(builder: (context) => ImovelPage(snapshot.data[index])));
                                  },
                                )
                              ),
                            );
                          },
                        );
                      }
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}