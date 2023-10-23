import 'dart:io';

import 'package:flutter/material.dart';
import 'package:wissen/server/models/usuario.dart';
import 'package:wissen/ui/pages/cliente/selecao_servico_page.dart';
import 'package:wissen/ui/widgets/utils.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

class LoginPage extends StatefulWidget {
  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  var usuario = Usuario();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Login')),
      body: Container(
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
            child: Form(
              key: _formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  const CircleAvatar(
                    radius: 100,
                    backgroundImage:
                        AssetImage('assets/images/wissen_logo.jpeg'),
                  ),
                  SizedBox(height: 30),
                  TextFormField(
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Login',
                    ),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Please enter your login';
                      }
                      return null;
                    },
                    onSaved: (value) {
                      usuario.login = value!;
                    },
                  ),
                  SizedBox(height: 10),
                  TextFormField(
                    obscureText: true,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      labelText: 'Senha',
                    ),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return 'Please enter your password';
                      }
                      return null;
                    },
                    onSaved: (value) {
                      usuario.senha = value!;
                    },
                  ),
                  Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: ElevatedButton(
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          _formKey.currentState!.save(); // Save the form data
                          _realizarLogin(usuario.login, usuario.senha);
                        }
                      },
                      child:
                          const Text('Entrar', style: TextStyle(fontSize: 20)),
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

  void _realizarLogin(String login, String senha) async {
    final Uri url = Uri.parse(
        'http://api.wissen.premiodelivery.com.br/autenticacao/$login/$senha');
    final response = await http.get(url);

    if (response.statusCode == 200) {
      var dados = jsonDecode(response.body);
      if (dados == "{status:True}") {
        showPage(context, SelecaoServicosPage());
      } else {
        var snackBar = SnackBar(
            content: Text(
              'Usuário ou senha inválidos',
              style: TextStyle(color: Colors.white),
            ),
            backgroundColor: Colors.red);
        ScaffoldMessenger.of(context).showSnackBar(snackBar);
      }
    }
  }
}
