import 'package:flutter/material.dart';

class CardWidget extends StatelessWidget {
  final String nome;
  final double distancia;
  final double preco;
  final bool statusOnline;
  final String urlImagem;

  const CardWidget({
    super.key,
    required this.nome,
    required this.distancia,
    required this.preco,
    required this.statusOnline,
    required this.urlImagem,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(18.0),
        child: Row(
          children: [
            // Imagem
            Container(
              width: 100,
              height: 100,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                image: DecorationImage(
                  image: NetworkImage(urlImagem),
                  fit: BoxFit.cover,
                ),
              ),
            ),

            // Nome e informações
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(18.0),
                    child: SizedBox(
                      height: 50,
                      child: Text(
                        nome,
                        style: const TextStyle(
                          fontSize: 25,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ),
                  Row(
                    children: [
                      const Icon(
                        Icons.location_on,
                        color: Colors.grey,
                      ),
                      Text(
                        '$distancia km',
                        style: const TextStyle(
                          fontSize: 20,
                          color: Colors.green,
                        ),
                      ),
                      const SizedBox(width: 10),
                      const Icon(
                        Icons.money,
                        color: Colors.red,
                      ),
                      Text(
                        'R\$ ${preco.toStringAsFixed(2)}',
                        style: const TextStyle(
                          fontSize: 20,
                          color: Colors.grey,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            // Botão
            IconButton(
              icon: Icon(Icons.circle,
                  color: statusOnline ? Colors.green : Colors.red),
              onPressed: () {},
            ),
          ],
        ),
      ),
    );
  }
}
