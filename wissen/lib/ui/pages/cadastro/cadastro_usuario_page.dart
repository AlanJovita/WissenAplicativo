import 'package:flutter/material.dart';
import 'package:wissen/server/models/usuario.dart';

class CadastroUsuarioPage extends StatefulWidget {
  const CadastroUsuarioPage({super.key});

  @override
  State<CadastroUsuarioPage> createState() => _CadastroUsuarioPageState();
}

class _CadastroUsuarioPageState extends State<CadastroUsuarioPage> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  var usuario = Usuario();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Cadastro de Prestador'),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 30.0),
          child: Form(
            key: _formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: const CircleAvatar(
                    radius: 80,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Icon(Icons.camera_alt, size: 50),
                        ),
                        Text("Adicionar Foto"),
                      ],
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
          border: OutlineInputBorder(),
          labelText: labelText,
        ),
        validator: validator,
      ),
    );
  }
}
