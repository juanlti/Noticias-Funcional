import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:noticias_proyect/src/models/category_models.dart';
import 'package:noticias_proyect/src/models/newModels.dart';
import 'package:http/http.dart' as http;

const _urlBase = 'https://newsapi.org/v2';
//first api consumida
//final _apiKey = '594064b6a7234ea8ac33f260e27bf66f';
//seconds apii 901877cb84bc48a1847b721e6b911bc6
const _apiKey = '901877cb84bc48a1847b721e6b911bc6';

class NewServics with ChangeNotifier {
  List<Article> headlines = [];
  String _CategorySelec = 'business';
  List<Category> categoriesList = [
    Category(FontAwesomeIcons.building, "business"),
    Category(FontAwesomeIcons.tv, "entertainment"),
    Category(FontAwesomeIcons.addressCard, "general"),
    Category(FontAwesomeIcons.headSideVirus, "health"),
    Category(FontAwesomeIcons.vials, "science"),
    Category(FontAwesomeIcons.volleyball, "sports"),
    Category(FontAwesomeIcons.memory, "technology"),
  ];
  final Map<String, List<Article>> categoryaArticles = {
    //creo un mapa que tiene como llave un String y Lista de Articulos como contenido y lo guardo
  };
  getCategorySelect() {
    return _CategorySelec;
  }

  set setCategorySelect(String unaCategoria) {
    if (_CategorySelec != unaCategoria) {
      print('carga nueva categoria');
      _CategorySelec = unaCategoria;
      //cargar
      getArticuloSelectPorCategory(_CategorySelec);
      notifyListeners();
    }
  }

  getArticuloSelectPorCategory(_CategorySelec) async {
    if (this.categoryaArticles != null &&
        categoryaArticles[_CategorySelec]!.length > 0) {
      return this.categoryaArticles[_CategorySelec];
    } else {
      final urlCustom =
          '$_urlBase/top-headlines?apiKey=$_apiKey&country=ar&category=$_CategorySelec';
      final url = Uri.parse(urlCustom);
      final resp = await http.get(url);
      final newResponse = NewResponse.fromJson(resp.body);
      this.categoryaArticles[_CategorySelec]?.addAll(newResponse.articles);
    }
    notifyListeners();
  }

  bool isLoading = false;

  getIsLoading() {
    if (headlines.length > 0) {
      isLoading = true;
    }

    return isLoading;
  }

  NewServics() {
    print('que valor antes ? ${getIsLoading()}');
    getTopHeadLines();
    if (this.headlines != null) {
      categoriesList.forEach((unaCategoria) {
        List<Article> unaListaXunArticulo = [];
        categoryaArticles[unaCategoria.name] = unaListaXunArticulo;
      });
    }
    print('que valor despues ? ${getIsLoading()}');
    this.getArticuloSelectPorCategory(this._CategorySelec);
  }

  getTopHeadLines() async {
    print('ultimo valor! ${headlines.length} ');
    if (headlines.length < 10) {
      print('volvio a cargar estoy adentro? ');
      //armo la dirrecion a consultar!
      final urlCustom = '$_urlBase/top-headlines?apiKey=$_apiKey&country=ar';

      //recibo una una data de la dirrecion consultada 'urlCustom'
      //es una data no desserializada, es decir sin formato, por lo tanto esta en json

      final url = Uri.parse(urlCustom);

      /*
    var uri = Uri.https('$_urlBase', '/v2/top-headlines',
        {'country': 'ar', 'apiKey': '$_apiKey'});
        */

      final resp = await http.get(url);
      print('informacion en uri ${url}');
      // 'resp' contiene la informacion de 'url' pero codificada, es decir en String

      //ahora 'newResponse' tiene la informacion recibida de 'resp' pero ya  serializada en formato .map

      final newResponse = NewResponse.fromJson(resp.body);

      print('titulo  ==> ${newResponse.articles[1].author}');
      print('informacion del primer autor ${newResponse.articles[1].title}');
      headlines.addAll(newResponse.articles);
      notifyListeners();
    }
    print('ultimo valor! actualizado? ${headlines.length} ');
    print('volvio a cargar? ');
  }

  List<Article> get getArticulosCateoriasSelecionadas =>
      this.categoryaArticles[_CategorySelec]!;
}
