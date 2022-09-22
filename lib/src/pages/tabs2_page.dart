import 'package:flutter/material.dart';
import 'package:noticias_proyect/src/models/category_models.dart';
import 'package:noticias_proyect/src/services/news_services.dart';
import 'package:noticias_proyect/src/widgets/listaNoticias.dart';
import 'package:provider/provider.dart';

class Tabs2 extends StatelessWidget {
  const Tabs2({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final categorias = Provider.of<NewServics>(context);
    return SafeArea(
      minimum: EdgeInsets.only(top: 50),
      child: Scaffold(
          body: Wrap(
        children: [
          Container(
            height: 140,
            width: double.infinity,
            color: Colors.red,
            child: _ListaCategorias(),
          ),
          Expanded(
              child: Container(
            width: double.infinity,
            height: 400,
            child: ListaNoticias(
                ultimasNoticias: categorias.getArticulosCateoriasSelecionadas),
          ))
        ],
      )),
    );
  }
}

class _ListaCategorias extends StatelessWidget {
  const _ListaCategorias({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final categorias = Provider.of<NewServics>(context).categoriesList;

    final aMostrarArticuloXcategoria =
        Provider.of<NewServics>(context, listen: false);

    return ListView.builder(
      scrollDirection: Axis.horizontal,
      physics: BouncingScrollPhysics(),
      itemCount: categorias.length,
      itemBuilder: (BuildContext context, int index) {
        final cName = categorias[index].name;

        return GestureDetector(
          onTap: () {
            //recordatorio!
            /*
            El constructor de las categorias no se va a ejecutar por mas de que ya me encuentra en la pagina
            porque  para que se se ejecute de manera autmatica el 'listen'  tiene qu estar en true
            y como esta en false, va a ejecutar siempre y cuando yo haga la primera selecion


            */

            Provider.of<NewServics>(context, listen: false).setCategorySelect =
                cName;

            print('$index');
          },
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 20),
            child: Column(
              children: [
                _CategoryButton(
                  categorias: categorias[index],
                ),
                SizedBox(
                  height: 15,
                ),
                Text(
                  '${cName[0].toUpperCase()}${cName.substring(1)}',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}

class _CategoryButton extends StatelessWidget {
  const _CategoryButton({
    Key? key,
    required this.categorias,
  }) : super(key: key);

  final Category categorias;

  @override
  Widget build(BuildContext context) {
    print('wfwqefwef ${categorias.name}');
    bool cambiar = false;
    final selectColorCategory = Provider.of<NewServics>(context, listen: true);
    print(
        'wfwqefweqweqweq3333333333f ${selectColorCategory.getCategorySelect()}');
    if (categorias.name == selectColorCategory.getCategorySelect()) {
      cambiar = true;
    }
    return Container(
      width: 40,
      height: 40,
      decoration:
          const BoxDecoration(shape: BoxShape.circle, color: Colors.white),
      child: Icon(
        categorias.icon,
        color: (cambiar) ? Colors.red : Colors.black54,
      ),
    );
  }
}
