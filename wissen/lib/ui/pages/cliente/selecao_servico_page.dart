import 'package:flutter/material.dart';
import 'package:wissen/ui/pages/cliente/anotacoes_servico_page.dart';
import 'package:wissen/ui/widgets/utils.dart';

class SelecaoServicosPage extends StatefulWidget {
  const SelecaoServicosPage({super.key});

  @override
  State<SelecaoServicosPage> createState() => _SelecaoServicosPageState();
}

class _SelecaoServicosPageState extends State<SelecaoServicosPage> {
  List<Servico> _servicos = [
    Servico(
      nome: 'Elétrica',
      descricao: 'Instalação de tomadas, interruptores, luminárias, etc.',
      isExpanded: false,
    ),
    Servico(
      nome: 'Hidráulica',
      descricao:
          'Instalação de torneiras, chuveiros, válvulas de descarga, etc.',
      isExpanded: false,
    ),
    Servico(
      nome: 'Marcenaria',
      descricao: 'Instalação de guarda-roupas, armários, etc.',
      isExpanded: false,
    ),
    Servico(
      nome: 'Alvenaria',
      descricao: 'Construção de paredes, muros, etc.',
      isExpanded: false,
    ),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Seleção de Serviços'),
      ),
      body: ListView(
        children: [
          ExpansionPanelList(
            expansionCallback: (int index, bool isExpanded) {
              setState(() {
                _servicos[index].isExpanded = !_servicos[index].isExpanded;
              });
            },
            children: _servicos.map<ExpansionPanel>((Servico servico) {
              return ExpansionPanel(
                backgroundColor: Color.fromARGB(255, 50, 50, 50),
                headerBuilder: (BuildContext context, bool isExpanded) {
                  return GestureDetector(
                    onTap: () {
                      setState(() {
                        servico.isExpanded = !servico.isExpanded;
                      });
                    },
                    child: Padding(
                      padding: const EdgeInsets.all(8),
                      child: ListTile(
                        title: Text(servico.nome,
                            style: const TextStyle(fontSize: 26)),
                      ),
                    ),
                  );
                },
                body: ListTile(
                  title: Padding(
                    padding: const EdgeInsets.only(bottom: 25.0, left: 16),
                    child: Text(servico.descricao),
                  ),
                  trailing: ElevatedButton(
                    onPressed: () {
                      showPage(context, AnotacoesServicoPage(servico.nome));
                    },
                    child: const Text('Selecionar'),
                  ),
                ),
                isExpanded: servico.isExpanded,
              );
            }).toList(),
          ),
        ],
      ),
    );
  }
}

class Servico {
  String nome;
  String descricao;
  bool isExpanded;

  Servico({
    required this.nome,
    required this.descricao,
    required this.isExpanded,
  });
}
