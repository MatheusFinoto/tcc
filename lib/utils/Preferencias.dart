import 'package:shared_preferences/shared_preferences.dart';

class Preferencias{
  Preferencias();

  SharedPreferences preferences;

  //LOGADO
  Future<bool> getLogado()async{
    preferences = await SharedPreferences.getInstance();
    return preferences.getBool("logado") ?? false;
  }

  Future<bool> setLogado(bool logado)async{
    preferences = await SharedPreferences.getInstance();
    return preferences.setBool("logado", logado);
  }

  //INTRODUCAO
  Future<bool> getIntro()async{
    preferences = await SharedPreferences.getInstance();
    return preferences.getBool("intro") ?? false;
  }

  Future<bool> setIntro(bool intro)async{
    preferences = await SharedPreferences.getInstance();
    return preferences.setBool("intro", intro);
  }

  //E-MAIL
  Future<String> getEmail()async{
    preferences = await SharedPreferences.getInstance();
    return preferences.getString("email");
  }

  Future<bool> setEmail(String email)async{
    preferences = await SharedPreferences.getInstance();
    return preferences.setString("email", "$email");
  }

}