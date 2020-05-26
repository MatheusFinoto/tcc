import 'dart:convert';
import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:app_tcc/utils/helper.dart' as globals;
import 'package:http/http.dart' as http;
import 'package:image_picker/image_picker.dart';

class CadastroUsuarioPage extends StatefulWidget {
  @override
  _CadastroUsuarioPageState createState() => _CadastroUsuarioPageState();
}

class _CadastroUsuarioPageState extends State<CadastroUsuarioPage> {

  @override
  void initState() {
    super.initState();
  }

  File file;
  int passoAtual = 0;

  String fotoSelecionada;
  var fotoProf;

  TextEditingController nomeController = TextEditingController();
  TextEditingController sobrenomeController = TextEditingController();
  TextEditingController celularController = TextEditingController();
  TextEditingController telefoneController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController senhaController = TextEditingController();
  TextEditingController cpfcnpjController = TextEditingController();

  mainBottomSheet(BuildContext context){
    showModalBottomSheet(
        context: context,
        builder: (BuildContext context){
          return Column(
            mainAxisSize: MainAxisSize.min,
            children: <Widget>[
              _createTile(context, 'Camera', Icons.camera_alt, _action1),
              _createTile(context, 'Galeria', Icons.photo_library, _action2),
              //_createTile(context, 'Sair', Icons.exit_to_app, _action3)
            ],
          );
        }
    );
  }

  ListTile _createTile(BuildContext context, String name, IconData icon, Function action){
    return ListTile(
      leading: Icon(icon),
      title: Text(name),
      onTap: (){
        Navigator.pop(context);
        action();
      },
    );
  }

  _action1()async{
    var image = await ImagePicker.pickImage(source: ImageSource.camera);
    setState(() {
      fotoSelecionada =  image.path;
      file = image;
    });
  }

  _action2()async{
    var image = await ImagePicker.pickImage(source: ImageSource.gallery);
    setState(() {
      fotoSelecionada =  image.path;
      file = image;
    });
  }

  _cadatraUsuario()async{
    String nome = nomeController.text;
    String sobrenome = sobrenomeController.text;
    String celular = celularController.text;
    String telefone = telefoneController.text;
    String cpfCnpj = cpfcnpjController.text;
    String email = emailController.text;
    String senha = senhaController.text;

    String nomeCompleto = "$nome $sobrenome";
    String foto = "";
    //File photo = File(fotoSelecionada);
    if(file != null){
      setState(() {
        foto = base64Encode(file.readAsBytesSync());
      });
    }


    var body = jsonEncode(
        {
          "name":nomeCompleto,
          "cpf":cpfCnpj,
          "cel":celular,
          "tel":telefone,
          "email":email,
          "password":senha,
          "image": foto
        }
      );

    print(body);

    var data = await http.post(
        "https://emob-app.herokuapp.com/customers",
        headers: {"Content-Type":"application/json"},
      body: body
    );

    var resposta = jsonDecode(data.body);
    print("$resposta");


  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Cadastro", style: TextStyle(color: Colors.black  ),),
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black,),
          onPressed: (){Navigator.of(context).pop();},
        ),
        backgroundColor: globals.background,
      ),
      backgroundColor: globals.background,
      body:SingleChildScrollView(
        child: Theme(
          data: ThemeData(
              primaryColor: globals.azul
          ),
          child: Stepper(
            steps: _mySteps(),
            currentStep: this.passoAtual,
            onStepTapped: (step){
              setState(() {
                this.passoAtual = step;
              });
            },
            controlsBuilder: (BuildContext context, {VoidCallback onStepContinue, VoidCallback onStepCancel}) {
              return Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: <Widget>[
                  RaisedButton(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                    elevation: 5,
                    onPressed: onStepCancel,
                    child: const Text('Voltar'),
                  ),
                  RaisedButton(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                    elevation: 5,
                    onPressed: onStepContinue,
                    child: const Text('Continuar',style: TextStyle(color: Colors.white),),
                    color: globals.azul,
                  ),

                ],
              );
            },
            onStepContinue: (){
              setState(() {
                if(this.passoAtual < this._mySteps().length -1){
                  this.passoAtual = this.passoAtual +1;
                }else{


                  if(this.passoAtual == 3){
                    print("passo 4");
                    _cadatraUsuario();
                  }
                }
              });
            },
            onStepCancel: (){
              setState(() {
                if(this.passoAtual > 0 ){
                  this.passoAtual = this.passoAtual -1;
                }else{
                  this.passoAtual = 0;
                }
              });
            },
          ),
        ),
      )
    );
  }

  List<Step> _mySteps(){
    List<Step> _steps = [
      Step(
        isActive: passoAtual >= 0,
        title: Text("Dados Pessoais"),
        content: Column(
          children: <Widget>[
            TextField(
              keyboardType: TextInputType.text,
              controller: nomeController,
              decoration: InputDecoration(
                hintText: "Nome",
                border: InputBorder.none,
              ),
              textAlignVertical: TextAlignVertical.center,
            ),
            SizedBox(height: 10,),
            TextField(
              keyboardType: TextInputType.text,
              controller: sobrenomeController,
              decoration: InputDecoration(
                hintText: "Sobrenome",
                border: InputBorder.none,
              ),
              textAlignVertical: TextAlignVertical.center,
            ),
            SizedBox(height: 10,)
          ],
        )
      ),
      Step(
          isActive: passoAtual >= 1,
          title: Text("Dados da Conta"),
          content: Column(
            children: <Widget>[
              TextField(
                keyboardType: TextInputType.number,
                controller: celularController,
                decoration: InputDecoration(
                  hintText: "Celular",
                  border: InputBorder.none,
                ),
                textAlignVertical: TextAlignVertical.center,
              ),
              SizedBox(height: 10,),
              TextField(
                keyboardType: TextInputType.number,
                controller: telefoneController,
                decoration: InputDecoration(
                  hintText: "Telefone",
                  border: InputBorder.none,
                ),
                textAlignVertical: TextAlignVertical.center,
              ),
              SizedBox(height: 10,),
              TextField(
                keyboardType: TextInputType.emailAddress,
                controller: emailController,
                decoration: InputDecoration(
                  hintText: "E-mail",
                  border: InputBorder.none,
                ),
                textAlignVertical: TextAlignVertical.center,
              ),
              SizedBox(height: 10,),
              TextField(
                controller: senhaController,
                obscureText: true,
                decoration: InputDecoration(
                  hintText: "Senha",
                  border: InputBorder.none,
                ),
                textAlignVertical: TextAlignVertical.center,
              ),
              SizedBox(height: 10,)
            ],
          )
      ),
      Step(
          isActive: passoAtual >= 2,
          title: Text("CPF / CNPJ"),
          content: Column(
            children: <Widget>[
              TextField(
                keyboardType: TextInputType.number,
                controller: cpfcnpjController,
                decoration: InputDecoration(
                  hintText: "CPF / CNPJ",
                  border: InputBorder.none,
                ),
                textAlignVertical: TextAlignVertical.center,
              ),
              SizedBox(height: 10,)
            ],
          )
      ),
      Step(
          isActive: passoAtual >= 3,
          title: Text("Foto"),
          content: Column(
            children: <Widget>[
              GestureDetector(
                child: Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30)
                  ),
                  elevation: 5,
                  child: Container(
                      width: 200,
                      height: 200,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30),
                        color: Colors.grey[300],
                      ),
                      child: fotoSelecionada == null ?
                      Center(
                        child: Icon(Icons.photo_camera, size: 50,),
                      ):
                      ClipRRect(
                        borderRadius: BorderRadius.circular(30),
                        child: Image(
                          image: FileImage(File(fotoSelecionada)),
                          fit: BoxFit.cover,
                        ),
                      )
                  ),
                ),
                onTap: (){mainBottomSheet(context);},
              ),
              SizedBox(height: 10,)
            ],
          )
      ),
    ];
    return _steps;
  }
}

/*
PageView(
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
                                  pageController.animateToPage(4, curve: Curves.ease,
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
                                  pageController.animateToPage(4, curve: Curves.ease,
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
      */
