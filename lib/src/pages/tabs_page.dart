import 'package:flutter/material.dart';
import 'package:news_provider/src/pages/tab1_page.dart';
import 'package:news_provider/src/pages/tab2_page.dart';
import 'package:news_provider/src/services/new_services.dart';
import 'package:provider/provider.dart';

class TabsPageScreen extends StatelessWidget {
   
  const TabsPageScreen({Key? key}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    return  ChangeNotifierProvider(
      create: (_) => new _NavegacionModel() ,
      child: Scaffold(
        body: _Paginas(),
        bottomNavigationBar: _Navegacion(),
      ),
    );
  }
}


class _Navegacion extends StatelessWidget {
  const _Navegacion({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {

    final navegacionModel = Provider.of<_NavegacionModel>(context);
    

    return BottomNavigationBar(
      currentIndex: navegacionModel.paginaActual,
      onTap: (value) => navegacionModel.paginaActual = value,
      items: [
        BottomNavigationBarItem(icon: Icon(Icons.person_outline),label: "pagina 1"),
        BottomNavigationBarItem(icon: Icon(Icons.public),label: "pagina 2")

      ]
    );
  }
}



class _Paginas extends StatelessWidget {
  const _Paginas({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {

    final navegacionModel = Provider.of<_NavegacionModel>(context);
    

    return PageView(
      controller: navegacionModel.pageController,
      physics: BouncingScrollPhysics(),
      children: <Widget>[
        Tabs1Screen(),
        Tabs2Page(),
      ],
      
    );
  }
}


class _NavegacionModel with ChangeNotifier
{
  int _paginaActual = 0;

  PageController _pageController = new PageController();

  PageController get pageController => this._pageController;

  int get paginaActual => this._paginaActual;

  set paginaActual(int valor)
  {
    this._paginaActual = valor;

    _pageController.animateToPage(
      valor,
      duration: Duration(milliseconds: 200), 
      curve: Curves.easeOut
    );
    
    notifyListeners();
  }




}