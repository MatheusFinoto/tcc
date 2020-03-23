import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

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
      body: SingleChildScrollView(
        child: PageView(
          controller: pageController,
          children: <Widget>[
            SingleChildScrollView(
              child: Container(
                padding: EdgeInsets.symmetric(vertical: 50, horizontal: 16),
              ),
            ),
          ],
        )
      ),
    );
  }
}
