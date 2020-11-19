import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:learn_mobx/stores/login.store.dart';

class LoginScreen extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final LoginStore loginStore = LoginStore();

  @override
  void initState() {
    super.initState();
    loginStore.setupValidations();
  }

  @override
  void dispose() {
    loginStore.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          title: const Text('Login form'),
        ),
        body: Form(
          child: Padding(
            padding: const EdgeInsets.all(8),
            child: Column(
              children: [
                Observer(
                  builder: (_) => TextField(
                    onChanged: (value) => loginStore.setUsername(value),
                    autofocus: true,
                    decoration: InputDecoration(
                        labelText: 'Username',
                        hintText: 'Pick a username',
                        errorText: loginStore.error.username),
                  ),
                ),
                Observer(
                  builder: (_) => AnimatedOpacity(
                      child: const LinearProgressIndicator(),
                      duration: const Duration(milliseconds: 300),
                      opacity: loginStore.isUserCheckPending ? 1 : 0),
                ),
                Observer(
                  builder: (_) => TextField(
                    onChanged: (value) => loginStore.setEmail(value),
                    decoration: InputDecoration(
                        labelText: 'Email',
                        hintText: 'Enter your email address',
                        errorText: loginStore.error.email),
                  ),
                ),
                Observer(
                  builder: (_) => TextField(
                    onChanged: (value) => loginStore.setPassword(value),
                    decoration: InputDecoration(
                        labelText: 'Password',
                        hintText: 'Set a password',
                        errorText: loginStore.error.password),
                  ),
                ),
                RaisedButton(
                  child: const Text('Sign up'),
                  onPressed: loginStore.validateAll,
                )
              ],
            ),
          ),
        ),
      );
}
