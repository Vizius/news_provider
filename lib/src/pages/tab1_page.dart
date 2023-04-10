import 'package:flutter/material.dart';
import 'package:news_provider/src/services/new_services.dart';
import 'package:news_provider/src/widgets/listas_noticias.dart';
import 'package:provider/provider.dart';

class Tabs1Screen extends StatefulWidget {
  

  @override
  State<Tabs1Screen> createState() => _Tabs1ScreenState();
}

class _Tabs1ScreenState extends State<Tabs1Screen> with AutomaticKeepAliveClientMixin {
  @override
  Widget build(BuildContext context) {
    final newsService = Provider.of<NewsService>(context).headlines;

    

    return Scaffold(
      body: (newsService.length == 0)
      ?
      Center( child: CircularProgressIndicator(),)
      :
      ListasNoticias(newsService)
    );
  }
  
  @override
  // TODO: implement wantKeepAlive
  bool get wantKeepAlive => true;
}