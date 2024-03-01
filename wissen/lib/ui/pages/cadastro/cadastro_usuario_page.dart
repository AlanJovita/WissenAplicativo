import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:wissen/server/models/usuario.dart';

class CadastroUsuarioPage extends StatefulWidget {
  const CadastroUsuarioPage({super.key});

  @override
  State<CadastroUsuarioPage> createState() => _CadastroUsuarioPageState();
}

class _CadastroUsuarioPageState extends State<CadastroUsuarioPage> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  var usuario = Usuario();
// A imagem selecionada
  XFile? _image;

  // Abre a galeria
  void _openGallery() async {
    // Abra a galeria e selecione uma imagem
    _image = await ImagePicker().pickImage(source: ImageSource.gallery);

    // Se uma imagem foi selecionada, exiba-a
    if (_image != null) {
      setState(() {});
    }
  }

  @override
  Widget build(BuildContext context) {
    var usuario = Usuario();
    return Scaffold(
      appBar: AppBar(
        title: const Text('Cadastro de Prestador'),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30.0),
            child: Form(
              key: _formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  rjTextBox("Nome Completo", (value) {
                    usuario.nome = value;
                    return null;
                  }),
                  rjTextBox("E-mail", (value) {
                    usuario.email = value;
                    return null;
                  }),
                  rjTextBox("Telefone", (value) {
                    usuario.telefone = value;
                    return null;
                  }),
                  rjTextBox("Endereço", (value) {
                    usuario.endereco = value;
                    return null;
                  }),
                  rjTextBox("Cidade", (value) {
                    usuario.cidade = value;
                    return null;
                  }),
                  rjTextBox("Estado", (value) {
                    usuario.estado = value;
                    return null;
                  }),
                  rjTextBox("Bairro", (value) {
                    usuario.bairro = value;
                    return null;
                  }),
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: ElevatedButton(
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          var usuario = Usuario();
                          usuario.nome = "Nome";
                        }
                      },
                      child:
                          const Text('Salvar', style: TextStyle(fontSize: 20)),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget rjTextBox(String labelText, validator) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextFormField(
        decoration: InputDecoration(
          border: const OutlineInputBorder(),
          labelText: labelText,
        ),
        validator: validator,
      ),
    );
  }
}
