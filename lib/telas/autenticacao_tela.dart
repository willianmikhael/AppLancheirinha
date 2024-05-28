import 'package:flutter/material.dart';
import 'package:gymapp/_comum/minhas_cores.dart';
import 'package:gymapp/componentes/decoracao_campo_autenticacao.dart';

class AutenticacaoTela extends StatefulWidget {
  const AutenticacaoTela({super.key});

  @override
  State<AutenticacaoTela> createState() => _AutenticacaoTelaState();
}

class _AutenticacaoTelaState extends State<AutenticacaoTela> {
  bool queroEntrar = true;
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  Color.fromARGB(255, 6, 112, 10),
                  Color.fromARGB(255, 81, 192, 75),
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16),
            child: Form(
              key: _formKey,
              child: Center(
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Stack(
                        alignment: Alignment.topCenter,
                        children: [
                          Column(
                            children: [
                              const SizedBox(height: 360), // Espaço para a imagem
                              const Text(
                                "Menu Lancheirinha",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontSize: 38,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                  fontFamily: 'CustomFont', // Fonte personalizada
                                ),
                              ),
                              const SizedBox(height: 32),
                              TextFormField(
                                decoration: getAuthenticationInputDecoration("E-mail"),
                                validator: (String? value) {
                                  if (value == null ||
                                      value.isEmpty ||
                                      !value.contains('@')) {
                                    return 'Por favor, insira um e-mail';
                                  }
                                  return null;
                                },
                              ),
                              const SizedBox(height: 8),
                              TextFormField(
                                decoration: getAuthenticationInputDecoration("Senha"),
                                obscureText: true,
                                validator: (String? value) {
                                  if (value == null || value.isEmpty) {
                                    return 'Por favor, insira uma senha';
                                  }
                                  return null;
                                },
                              ),
                              const SizedBox(height: 8),
                              Visibility(
                                visible: !queroEntrar,
                                child: Column(
                                  children: [
                                    TextFormField(
                                      decoration: getAuthenticationInputDecoration(
                                          "Confirmar Senha"),
                                      obscureText: true,
                                      validator: (String? value) {
                                        if (value == null || value.isEmpty) {
                                          return 'Por favor, insira uma senha';
                                        }
                                        return null;
                                      },
                                    ),
                                    const SizedBox(height: 8),
                                    TextFormField(
                                      decoration: getAuthenticationInputDecoration("Nome"),
                                      validator: (String? value) {
                                        if (value == null || value.isEmpty) {
                                          return 'Por favor, insira um nome';
                                        }
                                        return null;
                                      },
                                    ),
                                  ],
                                ),
                              ),
                              const SizedBox(height: 16),
                              SizedBox(
                                width: double.infinity,
                                child: ElevatedButton(
                                  onPressed: () {
                                    botaoPrincipalClicado();
                                  },
                                  child: Text(
                                    (queroEntrar) ? "Entrar" : "Cadastrar",
                                    style: const TextStyle(
                                      color: Colors.black,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                              ),
                              const Divider(),
                              TextButton(
                                onPressed: () {
                                  setState(() {
                                    queroEntrar = !queroEntrar;
                                  });
                                },
                                child: const Text(
                                  "Não tem uma conta? Cadastre-se!",
                                  style: TextStyle(color: Colors.white),
                                ),
                              ),
                            ],
                          ),
                          Positioned(
                            top: 0,
                            child: Image.asset(
                              "assets/logopac.png",
                              height: 428,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  void botaoPrincipalClicado() {
    if (_formKey.currentState!.validate()) {
      print("Validado");
    } else {
      print("Não Validado");
    }
  }
}
