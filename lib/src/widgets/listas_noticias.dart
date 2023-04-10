import 'package:flutter/material.dart';
import 'package:news_provider/src/models/news_models.dart';
import 'package:news_provider/src/theme/tema.dart';

class ListasNoticias extends StatelessWidget {
  
  final List<Article> noticias;

  const ListasNoticias(this.noticias);

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: this.noticias.length,
      itemBuilder: (context, index) {
        return _Noticia(noticia: noticias[index], index: index);
      },
    );
  }
}

class _Noticia extends StatelessWidget {
  
  final Article noticia;
  final int index;

  const _Noticia({super.key, required this.noticia, required this.index});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [

        SizedBox(height: 20,),
        _TarjetaTopBar(noticia,index),

        _TarjetaTitulo( noticia ),

        _TarjetaImagen( noticia ),

        _TarjetaBody (noticia),

        _TarjetaBotones(),


        SizedBox(height: 10,),
        Divider()



      ],

    );
  }

}
class _TarjetaBotones extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          RawMaterialButton(
            onPressed: () {
              
            },
            fillColor: myTheme.colorScheme.secondary,
            shape:  RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
            child: Icon(Icons.star_border),
          ),
          SizedBox(width: 20,),
          RawMaterialButton(
            onPressed: () {
              
            },
            fillColor: Colors.cyan,
            shape:  RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
            child: Icon(Icons.more),
          ),
        ],
      ),
    );
  }
}

class _TarjetaBody extends StatelessWidget {

  final Article noticia;

  const _TarjetaBody(this.noticia);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 20),
      child: Text((noticia.description !=null) ? noticia.description.toString() : ""),
    );
  }
}

class _TarjetaImagen extends StatelessWidget {
  
  final Article noticia;

  const _TarjetaImagen( this.noticia);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      child: ClipRRect(
        borderRadius: BorderRadius.only(
        topLeft: Radius.circular(50), 
        bottomRight: Radius.circular(50)
        ),

        child: Container(
          child: (noticia.urlToImage != null)
                ? FadeInImage(
                    imageErrorBuilder: (context, error, stackTrace) {
                      return Text(
                        '   Image not load   ',
                        style:
                            TextStyle(fontSize: 25, color: myTheme.colorScheme.secondary),
                      );
                    },
                    placeholder: AssetImage('assets/giphy.gif'),
                    image: NetworkImage('${noticia.urlToImage}'),
                    
                  )
                : Image(
                    image: AssetImage('assets/no-image.png'),
                  )
                  ),
      ),
    );
  }
}

class _TarjetaTitulo extends StatelessWidget {
  
  final Article noticia;

  const _TarjetaTitulo( this.noticia);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 15),
      child: Text(noticia.title.toString(), style: TextStyle(fontSize: 20, fontWeight: FontWeight.w700) ,),
    );
  }
}

class _TarjetaTopBar extends StatelessWidget {
  final Article noticia;
  final int index;

  const _TarjetaTopBar(this.noticia,this.index);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10),
      margin: EdgeInsets.only(bottom: 10),
      child: Row(
        children: [
          Text('${index + 1}. ',style: TextStyle(color: myTheme.colorScheme.secondary),),
          Text('${noticia.source.name}. ',)
        ],
      ),

    );
  }
}