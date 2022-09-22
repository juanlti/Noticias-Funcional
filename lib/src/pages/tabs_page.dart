import 'package:flutter/material.dart';
import 'package:noticias_proyect/src/pages/tabs1_page.dart';
import 'package:noticias_proyect/src/pages/tabs2_page.dart';
import 'package:noticias_proyect/src/services/news_services.dart';

import 'package:noticias_proyect/src/services/provider.dart';
import 'package:provider/provider.dart';

class TabsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final NewServics providerNew =
        Provider.of<NewServics>(context, listen: true);
    return Scaffold(
      body: _pages(),
      bottomNavigationBar: buttonPages(),
    );
  }
}

class buttonPages extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final ProviderNoticias pageSelect =
        Provider.of<ProviderNoticias>(context, listen: true);

    return BottomNavigationBar(
      enableFeedback: false,
      selectedItemColor: Colors.black,
      onTap: (value) {
        if (pageSelect.pagesActual != value) {
          pageSelect.ChangePagesCurrent = value;
        }
      },
      currentIndex: pageSelect.pagesActual,
      items: const [
        BottomNavigationBarItem(
            icon: Icon(Icons.person_add_alt_outlined), label: '${'Para ti'}'),
        BottomNavigationBarItem(
            icon: Icon(Icons.public), label: '${'Encabezado'}'),
      ],
    );
  }
}

class _pages extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final ProviderNoticias pageSelect =
        Provider.of<ProviderNoticias>(context, listen: false);
    return PageView(
      //      physics:BouncingScrollPhysics(), quita la curbatura que indica que no hay mas paginas para scrollear
      physics: NeverScrollableScrollPhysics(),

      controller: pageSelect.getPageController,
      // controller: pageSelect.getPageController, sabe en que pagina se encuentra ! porque contiene la referencia

      children: [Tabs1(), Tabs2()],
    );
  }
}
