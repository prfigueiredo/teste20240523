import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:teste_flutter/app/model/services/auth_serv.dart';
import 'package:teste_flutter/app/presenter/ui_controller.dart';

class AuthPage extends StatefulWidget {
  const AuthPage({Key? key}) : super(key: key);

  @override
  State<AuthPage> createState() => _AuthPageState();
}

class _AuthPageState extends State<AuthPage> {

  TextEditingController _emailController = TextEditingController();
  TextEditingController _passController = TextEditingController();

  final AuthServ _authServ = AuthServ();
  final UiController _uiController = UiController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            const SizedBox(height: 75),
            //Ajustar a imagem SVG para inserir aqui
            SvgPicture.asset(
              'assets/crashtest.svg',
              height: 102.5,
              width: 283.5,
            ),
            const SizedBox(height: 50),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16),
              child: SizedBox(
                width: 180,
                child: TextField(
                  controller: _emailController,
                  decoration: InputDecoration(
                    labelText: 'E-mail',
                    border: OutlineInputBorder(),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 10),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16),
              child: SizedBox(
                width: 180,
                child: TextField(
                  controller: _passController,
                  obscureText: true,
                  decoration: InputDecoration(
                    labelText: 'Senha',
                    border: OutlineInputBorder(),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 20),
            SizedBox(
              width: 200,
              child: ElevatedButton(
                onPressed: (){
                  _authServ.signinUser(email: _emailController.text, pass: _passController.text);
                  _uiController.goToHome(context);
                  _uiController.snackLogin(context);

                },
                style: ElevatedButton.styleFrom(backgroundColor: Colors.black),
                child: Text(
                  'Login',
                  style: TextStyle(color: Colors.white),
                ),
              ),
            ),
            const SizedBox(height: 20),
            SizedBox(
              width: 200,
              child: TextButton(
                onPressed: () {
                  _uiController.goToResetpass(context);
                },
                child: Text('Esqueci a senha'),
              ),
            ),
            const SizedBox(height: 7),
            SizedBox(
              width: 200,
              child: TextButton(
                onPressed: () {
                  _uiController.goToSignup(context);
                },
                child: Text('Faça o seu cadastro'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
