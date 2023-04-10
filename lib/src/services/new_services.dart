import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:news_provider/src/models/category_model.dart';
import 'package:news_provider/src/models/news_models.dart';
import 'package:http/http.dart' as http;

final _URL_NEW = 'https://newsapi.org/v2/';
final _API_KEY = 'apikey';

class NewsService with ChangeNotifier
{
  List<Article> headlines =[];
  String _selectedCategory = 'business';
  List<Category> category =[
    Category(FontAwesomeIcons.building, 'business' ),
    Category(FontAwesomeIcons.tv, 'entertainment' ),
    Category(FontAwesomeIcons.addressCard, 'general' ),
    Category(FontAwesomeIcons.headSideVirus, 'health' ),
    Category(FontAwesomeIcons.vials, 'science' ),
    Category(FontAwesomeIcons.futbol, 'sports' ),
    Category(FontAwesomeIcons.computer, 'technology' ),
  ];

  Map<String , List<Article>> categotyArticules ={};

  

  NewsService()
  {
    this.getTopHeadLines();

    category.forEach((item) {
      this.categotyArticules[item.name] =  new List<Article>.empty(growable: true);
    });

    this.getArticulesByCategory(this._selectedCategory);
    
  }

  get selectedCategory => this._selectedCategory;

  set selectedCategory( valor)
  {
    this._selectedCategory = valor;
    this.getArticulesByCategory(valor);
    notifyListeners();
  }

  List<Article> get getArticulos => this.categotyArticules[this.selectedCategory]!;

  getTopHeadLines() async
  {
    print("cargando headlines...");

    final url ='$_URL_NEW/top-headlines?apiKey=$_API_KEY&country=us';

    final resp = await http.get(Uri.parse(url));

    final newResponse = newsResponseFromJson(resp.body);

    this.headlines.addAll(newResponse.articles);
    
    notifyListeners();

  }

  getArticulesByCategory(String categorie) async
  {
    if (this.categotyArticules[categorie]!.length > 0) {
      return this.categotyArticules[categorie];
    }

    final url ='$_URL_NEW/top-headlines?apiKey=$_API_KEY&country=us&category=$categorie';

    final resp = await http.get(Uri.parse(url));

    final newResponse = newsResponseFromJson(resp.body);

    this.categotyArticules[categorie] = newResponse.articles;
    
    notifyListeners();
  }

}