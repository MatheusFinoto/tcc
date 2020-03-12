import 'package:app_tcc/deafult_widgets/DefaultHorizontalList.dart';
import 'package:app_tcc/deafult_widgets/DefaultListPopular.dart';
import 'package:app_tcc/model/ImoveisData.dart';
import 'package:app_tcc/view/ImovelPage.dart';
import 'package:app_tcc/view/MapsPage.dart';
import 'package:app_tcc/view/PerfilPage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  Future<List<ImoveisData>> getImoveisData()async{
    List<ImoveisData> listImoveisData = [
      ImoveisData("Rua de casa","5", "https://images.pexels.com/photos/106399/pexels-photo-106399.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940", "listaFotos", "23.00", "24.00", "Casa", "Sala, Cozinha, Copa, 2 Suits", "Aluguel"),
      ImoveisData("Rua de casa","5", "https://images.pexels.com/photos/323780/pexels-photo-323780.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500", "listaFotos", "23.00", "24.00", "Casa", "Sala, Cozinha, Copa, 2 Suits", "Aluguel"),
      ImoveisData("Rua de casa","5", "https://images.pexels.com/photos/2102587/pexels-photo-2102587.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500", "listaFotos", "23.00", "24.00", "Casa", "Sala, Cozinha, Copa, 2 Suits", "Aluguel"),
    ];

    return  listImoveisData;

  }


  Future<List<ImoveisData>> getPopular()async{
    String linkCasa = "https://images.pexels.com/photos/106399/pexels-photo-106399.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940";

    List<ImoveisData> newListPopular = [
      ImoveisData("Rua de casa","5", linkCasa, "listaFotos", "23.00", "24.00", "Casa", "Sala, Cozinha, Copa, 2 Suits", "Aluguel"),
      ImoveisData("Rua de casa","5", linkCasa, "listaFotos", "23.00", "24.00", "Casa", "Sala, Cozinha, Copa, 2 Suits", "Aluguel"),
      ImoveisData("Rua de casa","5", linkCasa, "listaFotos", "23.00", "24.00", "Casa", "Sala, Cozinha, Copa, 2 Suits", "Aluguel"),
      ImoveisData("Rua de casa","5", linkCasa, "listaFotos", "23.00", "24.00", "Casa", "Sala, Cozinha, Copa, 2 Suits", "Aluguel"),
      ImoveisData("Rua de casa","5", linkCasa, "listaFotos", "23.00", "24.00", "Casa", "Sala, Cozinha, Copa, 2 Suits", "Aluguel"),
    ];

    return  newListPopular;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xfff2ede4),
      appBar: AppBar(
        elevation: 1,
        backgroundColor: Color(0xfff2ede4),
        title: Text("eMob", style: TextStyle(color: Color(0xffa65c32), fontSize: 30, fontWeight: FontWeight.bold),),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.map, color: Colors.black,),
            onPressed: (){
              Navigator.of(context).push(MaterialPageRoute(builder: (context) => MapsPage()));
            },
          ),
          IconButton(
            icon: Icon(Icons.person, color: Colors.black,),
            onPressed: (){
              Navigator.of(context).push(MaterialPageRoute(builder: (context) => PerfilPage()));
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Padding(
              padding: EdgeInsets.only(left: 16, right: 16, top: 16, bottom: 8),
              child: Text("Recomendado", style: TextStyle(fontSize: 23, fontWeight: FontWeight.w500),),
            ),
            Container(
              height: 500,
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
                      return DefaultHorizontalList();
                      break;
                    default: return ListView.builder(
                        scrollDirection: Axis.horizontal,
                        padding: EdgeInsets.all(16),
                        itemCount: snapshot.data.length,
                        itemBuilder: (context, index){
                          return GestureDetector(
                            child: Container(
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(5),
                                  border: Border.all(color: Colors.black, width: 0.1),
                                  color: Colors.white
                              ),
                              margin: EdgeInsets.all(4),
                              height: 450,
                              width: MediaQuery.of(context).size.width - 80,
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
                                  Container(
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
                                  ),
                                ],
                              ),
                            ),
                            onTap: (){Navigator.of(context).push(MaterialPageRoute(builder: (context) => ImovelPage(snapshot.data[index])));},
                          );
                        }
                    );
                  }
                },
              ),
            ),

            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16, vertical: 4),
              child: Text("Popular", style: TextStyle(fontSize: 23, fontWeight: FontWeight.w500),),
            ),

            Container(
              padding: EdgeInsets.all(16),
              child: FutureBuilder(
                future: Future.delayed(Duration(seconds: 2), (){
                  List<ImoveisData> listImoveisData = [
                    ImoveisData("Rua de casa","5", "https://images.pexels.com/photos/358636/pexels-photo-358636.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940", "listaFotos", "23.00", "24.00", "Casa", "Sala, Cozinha, Copa, 2 Suits", "Aluguel"),
                    ImoveisData("Rua de casa","5", "https://images.pexels.com/photos/1029599/pexels-photo-1029599.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940", "listaFotos", "23.00", "24.00", "Casa", "Sala, Cozinha, Copa, 2 Suits", "Aluguel"),
                    ImoveisData("Rua de casa","5", "https://images.pexels.com/photos/206172/pexels-photo-206172.jpeg?auto=compress&cs=tinysrgb&dpr=2&h=650&w=940", "listaFotos", "23.00", "24.00", "Casa", "Sala, Cozinha, Copa, 2 Suits", "Aluguel"),
                  ];
                  return  listImoveisData;
                }),
                builder: (context, snapshot){
                  switch(snapshot.connectionState){
                    case ConnectionState.none:
                    case ConnectionState.waiting:
                      return DefaultListPopular();
                      break;
                    default: return ListView.builder(
                      physics: NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        itemCount: snapshot.data.length,
                        itemBuilder: (context, index){
                          return Container(
                            margin: EdgeInsets.all(4),
                            width: MediaQuery.of(context).size.width,
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(5)
                            ),
                            height: 125,
                            child: Row(
                              children: <Widget>[
                                Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.only(topLeft: Radius.circular(5), bottomLeft: Radius.circular(5),),
                                    image: DecorationImage(
                                        image: NetworkImage(snapshot.data[index].foto,),
                                        fit: BoxFit.cover
                                    ),
                                  ),
                                  height: 125,
                                  width: 125,
                                ),
                                Expanded(
                                  flex: 1,
                                  child: Padding(
                                    padding: EdgeInsets.all(8),
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
                                    ),
                                  ),
                                )
                              ],
                            ),
                          );
                        }
                    );
                  }
                },
              ),
            ),
          ],
        ),
      )
    );
  }

}