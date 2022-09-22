import 'package:flutter/material.dart';
import 'package:noticias_proyect/src/models/newModels.dart';

class ListaNoticias extends StatelessWidget {
  final List<Article> ultimasNoticias;

  const ListaNoticias({super.key, required this.ultimasNoticias});
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: ultimasNoticias.length,
      itemBuilder: (BuildContext context, int index) {
        return Padding(
          padding: EdgeInsets.symmetric(vertical: 20),
          child: _noticias(
            ultimasNoticias: ultimasNoticias[index],
            index: index,
          ),
        );
      },
    );
  }
}

class _noticias extends StatelessWidget {
  const _noticias({
    Key? key,
    required this.ultimasNoticias,
    required this.index,
  }) : super(key: key);

  final Article ultimasNoticias;
  final int index;

  @override
  Widget build(BuildContext context) {
    return Wrap(
      children: [
        _TarjetaTopBar(
          index: index,
          ultimasNoticia: ultimasNoticias,
        ),
        _TarjetaTitulo(
          ultimasNoticia: ultimasNoticias,
        ),
        _TarjetaImagen(
          ultimasNoticia: ultimasNoticias,
        ),
        _TarjetaBody(
          ultimasNoticia: ultimasNoticias,
        ),
        _TarjetaBotones(),
      ],
    );
  }
}

class _TarjetaBotones extends StatelessWidget {
  const _TarjetaBotones({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        RawMaterialButton(
          onPressed: () {},
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
          fillColor: Colors.red,
          child: Icon(Icons.star_border_outlined),
        ),
        RawMaterialButton(
          onPressed: () {},
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
          fillColor: Colors.red,
          child: Icon(Icons.more),
        ),
      ],
    );
  }
}

class _TarjetaBody extends StatelessWidget {
  final Article ultimasNoticia;
  const _TarjetaBody({
    Key? key,
    required this.ultimasNoticia,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text(ultimasNoticia.description ?? 'no hay descripcion'),
    );
  }
}

class _TarjetaImagen extends StatelessWidget {
  final Article ultimasNoticia;
  const _TarjetaImagen({
    Key? key,
    required this.ultimasNoticia,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300,
      child: ClipRRect(
        borderRadius: BorderRadius.only(
            topLeft: Radius.circular(50), bottomRight: Radius.circular(50)),
        child: Container(
            child: (ultimasNoticia.urlToImage != null)
                ? FadeInImage(
                    fit: BoxFit.cover,
                    placeholder: AssetImage('assets/image/giphy.gif'),
                    image: NetworkImage(ultimasNoticia.urlToImage.toString()))
                : const Image(
                    image: AssetImage('assets/image/no-image.png'),
                    fit: BoxFit.cover,
                  )),
      ),
    );
  }
}

class _TarjetaTitulo extends StatelessWidget {
  const _TarjetaTitulo({
    Key? key,
    required this.ultimasNoticia,
  }) : super(key: key);
  final Article ultimasNoticia;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 15),
      child: Text(
        'un titulo: ${ultimasNoticia.title}',
        style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
      ),
    );
  }
}

class _TarjetaTopBar extends StatelessWidget {
  final Article ultimasNoticia;
  final int index;
  const _TarjetaTopBar({
    Key? key,
    required this.ultimasNoticia,
    required this.index,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Wrap(
        children: [
          Text('index de articulo ${index}'),
        ],
      ),
    );
  }
}
