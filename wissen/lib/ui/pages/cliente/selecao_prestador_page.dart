import 'package:flutter/material.dart';
import 'package:wissen/ui/widgets/card_widget.dart';

class SelecaoPrestadorPage extends StatefulWidget {
  const SelecaoPrestadorPage({Key? key}) : super(key: key);

  @override
  State<SelecaoPrestadorPage> createState() => _SelecaoPrestadorPageState();
}

class _SelecaoPrestadorPageState extends State<SelecaoPrestadorPage> {
  @override
  Widget build(BuildContext context) {
    // Dados de exemplo para os prestadores de serviço
    List<Map<String, dynamic>> prestadoresServico = [
      {
        'nome': 'José Silva',
        'online': true,
        'distancia': 2.5,
        'preco': 50.0,
        'imagem':
            'https://i2.wp.com/blog.mundomidia.com/wp-content/uploads/2018/06/como-contratar-um-bom-mecanico.jpg?fit=1200%2C1200&ssl=1', // Substitua pelo caminho da imagem real
      },
      {
        'nome': 'Douglas G.',
        'online': false,
        'distancia': 3.2,
        'preco': 40.0,
        'imagem':
            'https://encanador24hs.com.br/wp-content/uploads/2013/07/dd.jpg', // Substitua pelo caminho da imagem real
      },
      {
        'nome': 'Guilherme',
        'online': true,
        'distancia': 1.8,
        'preco': 60.0,
        'imagem':
            'https://media.istockphoto.com/id/478291108/pt/foto/trabalhador-pedreiro-constru%C3%A7%C3%A3o-mason.jpg?s=1024x1024&w=is&k=20&c=J8OAi65PXkfJXP0P44KSCg57HGzRJJbf_393B1EwE2M=', // Substitua pelo caminho da imagem real
      },
      {
        'nome': 'Ronald F.',
        'online': false,
        'distancia': 5.0,
        'preco': 45.0,
        'imagem':
            "https://media.istockphoto.com/id/176772750/pt/foto/trabalhador-da-constru%C3%A7%C3%A3o-civil.webp?s=1024x1024&w=is&k=20&c=Ax9cjLaquYmSix3ROU_4iB7D0CTyx8ALdUIFzosY1Sk=", // Substitua pelo caminho da imagem real
      },
      // Adicione mais dados de prestadores de serviço, se necessário
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text('Seleção de Prestadores'),
      ),
      body: ListView.builder(
          itemCount: prestadoresServico.length,
          itemBuilder: (context, index) {
            final prestador = prestadoresServico[index];
            return CardWidget(
                nome: prestador["nome"],
                distancia: prestador["distancia"],
                preco: prestador["preco"],
                statusOnline: prestador["online"],
                urlImagem: prestador["imagem"]);
          }),
    );
  }
}
