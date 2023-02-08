import 'package:flutter/material.dart';

import 'create_account.dart';

class CreateAccountPage extends StatefulWidget {
  @override
  _CreateAccountPageState createState() => _CreateAccountPageState();
}

class _CreateAccountPageState extends State<CreateAccountPage> {
  final _formKey = GlobalKey<FormState>();
  bool _isLoading = false;
  late String _name;
  late String _email;
  late String _password;
  late String _profileImage;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Nova conta"),
      ),
      body: Form(
        key: _formKey,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              TextFormField(
                decoration: const InputDecoration(labelText: "Nome"),
                validator: (value) {
                  if (value!.isEmpty) {
                    return "Insira seu nome";
                  }
                  return null;
                },
                onSaved: (value) => _name = value!,
              ),
              TextFormField(
                decoration: const InputDecoration(labelText: "Email"),
                validator: (value) {
                  if (value!.isEmpty) {
                    return "Insira seu email";
                  }
                  return null;
                },
                onSaved: (value) => _email = value!,
              ),
              TextFormField(
                decoration: const InputDecoration(labelText: "Senha"),
                obscureText: true,
                validator: (value) {
                  if (value!.isEmpty) {
                    return "Insira sua senha";
                  }
                  return null;
                },
                onSaved: (value) => _password = value!,
              ),
              TextFormField(
                decoration: const InputDecoration(labelText: "Foto"),
                validator: (value) {
                  if (value!.isEmpty) {
                    return "Insira sua foto de perfil";
                  }
                  return null;
                },
                onSaved: (value) => _profileImage = value!,
              ),
              const SizedBox(height: 16.0),
              _isLoading
                  ? const CircularProgressIndicator()
                  : ElevatedButton(
                      onPressed: _submit,
                      child: const Text("Criar conta"),
                    ),
            ],
          ),
        ),
      ),
    );
  }

  void _submit() async {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState?.save();
      setState(() => _isLoading = true);
      try {
        final account =
            await createAccount(_name, _email, _password, _profileImage);
        // Do something with the created account
        print(account);
      } catch (e) {
        // Handle the error
        print(e);
      } finally {
        setState(() => _isLoading = false);
      }
    }
  }
}
