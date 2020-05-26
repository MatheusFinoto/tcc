import 'dart:convert';
import 'dart:math';
import 'package:http/http.dart' as http;

import 'package:mobx/mobx.dart';

part 'login_store.g.dart';

class LoginStore = _LoginStore with _$LoginStore;

abstract class _LoginStore with Store {
  
  _LoginStore(){
    autorun((_){
    });
  }

  @observable
  String email = "";

  @action
  void setEmail(String value) => email = value;

  @observable
  String senha = "";

  @action
  void setSenha(String value) => senha = value;


  @computed
  get senhaValida => senha.length >= 6;

  @computed
  get emailValida => RegExp(r"^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,253}[a-zA-Z0-9])?(?:\.[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,253}[a-zA-Z0-9])?)*$").hasMatch(email);



  @observable
  bool senhaVisivel = false;

  @action
  void toggleSenhaVisivel()=> senhaVisivel = !senhaVisivel;


  @observable
  bool carregando = false;

  @action
  Future<void> login()async{
    carregando = true;

    var email;
    var senha;

    String body = jsonEncode({"email":email, "password":senha});
    print(body);
    var data = await http.post(
        "https://emob-app.herokuapp.com/customers/login",
        headers: {"Content-Type":"application/json"},
        body: body
    );
    var resposta = jsonDecode(data.body);
    print(resposta.toString());

    //processar
    await Future.delayed(Duration(seconds: 2));

    carregando = false;
    loggedIn = true;
  }

  @computed
  Function get loginPressed => (emailValida && senhaValida && !carregando) ? login: null;

  @observable
  bool loggedIn = false;


}