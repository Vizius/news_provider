import 'package:flutter/material.dart';
import 'package:news_provider/src/models/category_model.dart';
import 'package:news_provider/src/services/new_services.dart';
import 'package:news_provider/src/theme/tema.dart';
import 'package:news_provider/src/widgets/listas_noticias.dart';
import 'package:provider/provider.dart';

class Tabs2Page extends StatelessWidget {
  const Tabs2Page({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final newsService = Provider.of<NewsService>(context);
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
           _ListaCategoria(),
           Expanded(
            child: ListasNoticias(newsService.getArticulos)
           )
          ],
        ),
        
      ),
    );
  }
}

class _ListaCategoria extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    final categories = Provider.of<NewsService>(context).category;

    return Container(
      width: double.infinity,
      height: 80,
      child: ListView.builder(
        physics: BouncingScrollPhysics(),
        scrollDirection: Axis.horizontal,
        itemCount: categories.length,
        itemBuilder: (context, index) {
          final nomb = categories[index].name;
          return Padding(
            padding: EdgeInsets.all( 8 ),
            child: Column(
              children: [
                _CategoryButton(categories[index]),
                SizedBox(width: 10,),
                Text('${nomb[0].toUpperCase()}${nomb.substring(1)}')
              ],
            ),
         );
        },

      ),
    );
  }
}

class _CategoryButton extends StatelessWidget {
  
  final Category categoria;

  const _CategoryButton( this.categoria);

  @override
  Widget build(BuildContext context) {
    final newsService = Provider.of<NewsService>(context);
    return GestureDetector(
      onTap: () {
        print('${categoria.name}');
        final newsService = Provider.of<NewsService>(context, listen: false);
        newsService.selectedCategory = categoria.name;
      },
      child: Container(
        width: 40,
        height: 40,
        margin: EdgeInsets.symmetric(horizontal: 10),
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: Colors.white
        ),
        child: Icon(
          categoria.icon,
          color: (newsService.selectedCategory == categoria.name)
          ?
          myTheme.colorScheme.secondary
          :Colors.black54
           ,
        ),
      ),
    );
  }
}