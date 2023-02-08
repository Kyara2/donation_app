import 'package:donation_app/account.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'body.dart';
import 'create_item_page.dart';

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('IDonate')
      ),
      body: const Body(),
      drawer: Theme(
        data: Theme.of(context).copyWith(
          canvasColor: Theme.of(context).colorScheme.secondary,
        ),
        child: Drawer(
          child: ListView(
            children: <Widget>[
              const DrawerHeader(
                decoration: BoxDecoration(
                    //color: Color(0xFF0E1647),
                    ),
                child: Text('IDonate'),
              ),
              ListTile(
                title: const Text('Minha conta'),
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => const MyAccountPage()));
                },
              ),
              ListTile(
                title: const Text('Novo anúncio'),
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => CreateItemPage()));
                },
              ),
              ListTile(
                title: const Text('Sair'),
                onTap: () {
                  Future.delayed(const Duration(milliseconds: 100), () {
                    SystemChannels.platform.invokeMethod('SystemNavigator.pop');
                  });
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
