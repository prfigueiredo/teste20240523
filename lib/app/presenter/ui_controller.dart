import 'package:flutter/material.dart';
import 'package:teste_flutter/app/view/ad_page.dart';
import 'package:teste_flutter/app/view/resetpass_page.dart';
import 'package:teste_flutter/app/view/signup_page.dart';

class UiController {


  void goToHome(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const AdPage()),
    );
    }

  void goToSignup(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const SignupPage()),
    );
  }

  void goToResetpass(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const ResetPass()),
    );
  }

  snackLogin(BuildContext context){
    try{
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Login efetuado!'),
        ),
      );
      return null;
    }catch(e){
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Houve algum erro...'),
        ),
      );
      return e;
    }


  }

  snackRessetpassFail(BuildContext context){
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('Falha ao enviar e-mail. Verifique a conta informada e tente novamente'),
      ),
    );
  }

  snackRessetpassSuccess(BuildContext context){
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('Foi enviado um link de alteração de senha para o seu e-mail.'),
      ),
    );
  }

  }