import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:localizare1/src/actions/index.dart';
import 'package:localizare1/src/models/index.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('login page'),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              TextFormField(
                controller: _emailController,
                decoration: InputDecoration(labelText: 'insert email'),
                validator: (String? valoare) {
                  if (valoare == null || !valoare.contains('@')) {
                    return 'please enter a valid email';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 16),
              TextFormField(
                controller: _passwordController,
                obscureText: true,
                decoration: InputDecoration(labelText: 'insert password'),
                validator: (String? valoare) {
                  if (valoare == null || valoare.length < 6) {
                    return 'please enter a longer than 6 chars password';
                  }
                  return null;
                },
              ),
              const Spacer(),
              Builder(
                builder: (BuildContext context) {
                  return ElevatedButton(
                      child: const Text('Login'),
                      onPressed: () {
                        if (!Form.of(context)!.validate()) {
                          return;
                        }
                        final Login action = Login(email: _emailController.text, password: _passwordController.text);
                        StoreProvider.of<AppState>(context).dispatch(action);
                      },
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
