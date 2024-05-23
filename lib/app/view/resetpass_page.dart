import 'package:flutter/material.dart';
import 'package:teste_flutter/app/model/services/auth_serv.dart';

class ResetPass extends StatefulWidget {
  const ResetPass({Key? key}) : super(key: key);

  @override
  State<ResetPass> createState() => _ResetPassState();
}

class _ResetPassState extends State<ResetPass> {

  final TextEditingController _emailController = TextEditingController();

  final AuthServ _authServ = AuthServ();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Insira o e-mail cadastrado:',
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
              const Text('Recuperação de senha:'),
              const SizedBox(height: 20),
              SizedBox(
                width: 350,
                child: TextField(
                  controller: _emailController,
                  decoration: InputDecoration(
                    labelText: 'E-mail',
                  ),
                ),
              ),
              const SizedBox(height: 30),
              SizedBox(
                width: 300,
                child: ElevatedButton(
                  onPressed: () {
                    String email = _emailController.text;
                    print(_authServ.forgotPass(context, email: email));
                  },
                  style: ElevatedButton.styleFrom(backgroundColor: Colors.yellow),
                  child: Text(
                    'Enviar',
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
