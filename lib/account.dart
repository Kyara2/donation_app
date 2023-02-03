import 'package:flutter/material.dart';

class MyAccountPage extends StatefulWidget {
  const MyAccountPage({super.key});

  @override
  _MyAccountPageState createState() => _MyAccountPageState();
}

class _MyAccountPageState extends State<MyAccountPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Minha Conta"),
      ),
      body: Column(
        children: [
          ListTile(
            leading: Image.network(
                "https://cdn.folhape.com.br/img/pc/450/450/dn_arquivo/2022/12/32ma2eh-preview-1.jpg"),
            title: const Text("Usuário"),
            subtitle: const Text("doador123"),
          ),
          const ListTile(
            leading: Icon(Icons.email),
            title: Text("Email"),
            subtitle: Text("doador123@brturbo.com"),
          ),
          ListTile(
            leading: const Icon(Icons.settings),
            title: const Text("Configurações"),
            onTap: () {},
          ),
        ],
      ),
    );
  }
}
