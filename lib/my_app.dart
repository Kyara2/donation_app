import 'package:flutter/services.dart';
import 'package:flutter/material.dart';
import 'body.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('IDonate'),
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
                child: Text('iDonate'),
              ),
              ListTile(
                title: const Text('Configurações'),
                onTap: () {
                  // Handle tap
                },
              ),
              ListTile(
                title: const Text('Sair'),
                onTap: () {
                  Future.delayed(const Duration(milliseconds: 1000), () {
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
