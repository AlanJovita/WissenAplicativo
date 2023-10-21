import 'package:flutter/material.dart';

class AnotacoesServicoPage extends StatefulWidget {
  String nomeServico;
  AnotacoesServicoPage(this.nomeServico, {super.key});

  @override
  State<AnotacoesServicoPage> createState() => _AnotacoesServicoPageState();
}

class _AnotacoesServicoPageState extends State<AnotacoesServicoPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Serviço - ${widget.nomeServico}'),
      ),
      body: Container(
        // degrade suave de cinza cinza escuro
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Color.fromARGB(255, 70, 70, 70),
              Color.fromARGB(255, 30, 30, 30),
            ],
          ),
        ),
        child: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Container(
                  height: 200,
                  child: Center(
                    child: Text(
                      'Anotações do Serviço',
                      style: TextStyle(fontSize: 30),
                    ),
                  ),
                ),
                SizedBox(
                  height: 300,
                  child: const TextField(
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Anotações',
                    ),
                    maxLines: 20,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: ElevatedButton(
                    onPressed: () {},
                    child: const Text('Buscar Técnico',
                        style: TextStyle(fontSize: 20)),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
