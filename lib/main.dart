import 'package:flutter/material.dart';
import 'package:noticias_proyect/src/pages/tabs_page.dart';
import 'package:noticias_proyect/src/services/news_services.dart';
import 'package:noticias_proyect/src/services/provider.dart';

import 'package:provider/provider.dart';

void main() {
  runApp(MultiProvider(providers: [
    ChangeNotifierProvider(
      create: (_) => ProviderNoticias(),
      lazy: false,
    ),
    ChangeNotifierProvider(create: (_) => NewServics()),
  ], child: MyAppNext()));
}

class MyAppNext extends StatelessWidget {
  const MyAppNext({
    Key? key,
  }) : super(key: key);
  @override

  @override
  Widget build(BuildContext context) {
    return const MyApp();
  }
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,

      theme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.dark(),
      ),
      home: TabsPage(),
    );
  }
}
