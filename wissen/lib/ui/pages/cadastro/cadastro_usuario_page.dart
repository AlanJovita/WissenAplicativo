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
    return Scaffold(
      appBar: AppBar(
        title: const Text('Cadastro de Prestador'),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30.0),
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Center(
                  child: GestureDetector(
                    onTap: () {
                      _openGallery();
                    },
                    child: CircleAvatar(
                      backgroundImage:
                          _image != null ? FileImage(File(_image!.path)) : null,
                      radius: 80,
                      child: _image != null
                          ? Container()
                          : const Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Padding(
                                  padding: EdgeInsets.all(8.0),
                                  child: Icon(Icons.add_a_photo, size: 40),
                                ),
                                Text("Adicionar Foto"),
                              ],
                            ),
                    ),
                  ),
                ),
                rjTextBox("Nome Completo", (value) {
                  return null;
                }),
                rjTextBox("Endereço", (value) {
                  return null;
                }),
                rjTextBox("Bairro", (value) {
                  return null;
                }),
                rjTextBox("Cidade", (value) {
                  return null;
                }),
                rjTextBox("Estado", (value) {
                  return null;
                }),
                rjTextBox("Telefone", (value) {
                  return null;
                }),
                rjTextBox("E-mail", (value) {
                  return null;
                }),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: ElevatedButton(
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        //_salvarDados
                      }
                    },
                    child: const Text('Salvar', style: TextStyle(fontSize: 20)),
                  ),
                ),
              ],
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
