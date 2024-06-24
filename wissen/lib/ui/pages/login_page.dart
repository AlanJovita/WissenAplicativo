import 'package:flutter/material.dart';
import 'package:wissen/server/bll/usuario_bll.dart';
import 'package:wissen/server/models/usuario.dart';
import 'package:wissen/ui/pages/cadastro/cadastro_usuario_page.dart';
import 'package:wissen/ui/pages/cliente/selecao_servico_page.dart';
import 'package:wissen/ui/widgets/utils.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  var usuario = Usuario();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Expanded(
        child: Container(
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
                    const SizedBox(height: 20),
                    const CircleAvatar(
                      radius: 70,
                      backgroundImage:
                          AssetImage('assets/images/wissen_logo.jpeg'),
                    ),
                    const SizedBox(height: 10),
                    TextFormField(
                      decoration: const InputDecoration(
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
                        usuario.email = value!;
                      },
                    ),
                    const SizedBox(height: 10),
                    TextFormField(
                      obscureText: true,
                      decoration: const InputDecoration(
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
                      padding: const EdgeInsets.symmetric(
                          horizontal: 16, vertical: 4),
                      child: ElevatedButton(
                        onPressed: () {
                          if (_formKey.currentState!.validate()) {
                            _formKey.currentState!.save(); // Save the form data
                            _realizarLogin(usuario.email, usuario.senha);
                          }
                        },
                        child: const Text('Entrar',
                            style: TextStyle(fontSize: 20)),
                      ),
                    ),
                    TextButton(
                        onPressed: () {
                          showPage(context, const CadastroUsuarioPage());
                        },
                        child: const Text("Cadastre-se")),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }

  void _realizarLogin(String login, String senha) async {
    var loginOk = await UsuarioBLL().validarLogin(login, senha);
    if (loginOk) {
      // ignore: use_build_context_synchronously
      showPage(context, const SelecaoServicosPage());
    } else {
      var snackBar = const SnackBar(
          content: Text(
            'Usuário ou senha inválidos',
            style: TextStyle(color: Colors.white),
          ),
          backgroundColor: Colors.red);
      // ignore: use_build_context_synchronously
      ScaffoldMessenger.of(context).showSnackBar(snackBar);
    }
    //}
  }
}
