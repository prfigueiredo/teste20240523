import 'package:flutter/material.dart';
import 'package:teste_flutter/app/model/services/auth_serv.dart';
import 'package:teste_flutter/app/presenter/ui_controller.dart';

class SignupPage extends StatefulWidget {
  const SignupPage({Key? key}) : super(key: key);

  @override
  State<SignupPage> createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  //Textfields controllers
  TextEditingController _nameController = TextEditingController();
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passController = TextEditingController();

  final AuthServ _authServ = AuthServ();
  final UiController _uiController = UiController();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Cadastro de Usuários',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.black,
        centerTitle: true,
        iconTheme: IconThemeData(
          color: Colors.white,
        ),

      ),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            children: [
              const Text('Dados do usuário:'),
              const SizedBox(height: 20),
              SizedBox(
                width: 350,
                child: TextField(
                  controller: _nameController,
                  decoration: InputDecoration(
                    labelText: 'Nome completo',
                  ),
                ),
              ),
              SizedBox(
                width: 350,
                child: TextField(
                  controller: _emailController,
                  decoration: InputDecoration(
                    labelText: 'E-mail',
                  ),
                ),
              ),
              SizedBox(
                width: 350,
                child: TextField(
                  controller: _passController,
                  obscureText: true,
                  decoration: InputDecoration(
                    labelText: 'Senha',
                  ),
                ),
              ),
              const SizedBox(height: 30),
              SizedBox(
                width: 300,
                child: ElevatedButton(
                  onPressed: () {
                    String name = _nameController.text;
                    String email = _emailController.text;
                    String pass = _passController.text;
                    print(_authServ.signupUser(name: name, email: email, pass: pass));
                    _uiController.snackSignup(context);
                  },
                  style: ElevatedButton.styleFrom(backgroundColor: Colors.yellow),
                  child: Text(
                    'Cadastrar',
                    style: TextStyle(
                      color: Colors.black,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }
}
