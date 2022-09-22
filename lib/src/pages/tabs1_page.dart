import 'package:flutter/material.dart';
import 'package:noticias_proyect/src/services/news_services.dart';
import 'package:noticias_proyect/src/widgets/listaNoticias.dart';

import 'package:provider/provider.dart';

class Tabs1 extends StatefulWidget {
  const Tabs1({Key? key}) : super(key: key);

  @override
  State<Tabs1> createState() => _Tabs1State();
}

class _Tabs1State extends State<Tabs1> with AutomaticKeepAliveClientMixin {
  @override
  Widget build(BuildContext context) {
    final newServics = Provider.of<NewServics>(context);
    final newNoticias = Provider.of<NewServics>(context).headlines;
// AssetImage('assets/image/giphy.gif'),
/*R
ListaNoticias(
        ultimasNoticias: newNoticias,
      ),
*/

    return Scaffold(
      body: (newServics.getIsLoading())
          ? ListaNoticias(
              ultimasNoticias: newNoticias,
            )
          : Center(
              child: Container(
                  width: 250,
                  height: 250,
                  child: const CircularProgressIndicator(
                    strokeWidth: 8,
                    semanticsLabel: 'Cargando, espere porfavor..',
                    color: Colors.purple,
                  )),
            ),
    );
  }

  @override
  // TODO: implement wantKeepAlive
  bool get wantKeepAlive => true;
}
