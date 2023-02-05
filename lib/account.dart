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
            title: const Text("Usuário", style: TextStyle(color: Colors.white)),
            subtitle:
                const Text("doador123", style: TextStyle(color: Colors.white)),
          ),
          const ListTile(
            leading: Icon(
              Icons.email,
              color: Colors.white,
            ),
            title: Text("Email", style: TextStyle(color: Colors.white)),
            subtitle: Text("doador123@brturbo.com",
                style: TextStyle(color: Colors.white)),
          ),
          ListTile(
            leading: const Icon(
              Icons.settings,
              color: Colors.white,
            ),
            title: const Text("Configurações",
                style: TextStyle(color: Colors.white)),
            onTap: () {},
          ),
        ],
      ),
    );
  }
}
