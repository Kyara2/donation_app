import 'package:flutter/material.dart';
import 'item.dart';
import 'loading_screen.dart';
import 'my_app.dart';

void main() {
  runApp(MaterialApp(
    theme: ThemeData(
        primarySwatch: Colors.indigo,
        textTheme: const TextTheme(
          bodyText1: TextStyle(color: Colors.white),
          headline6: TextStyle(color: Colors.white),
          subtitle2: TextStyle(color: Colors.white),
        )),
    home: const LoadingScreen(),
  ));
}

class LoadingScreen extends StatefulWidget {
  const LoadingScreen({super.key});

  @override
  LoadingScreenState createState() => LoadingScreenState();

}

class LoadingScreenState extends State<LoadingScreen> {
  Future<Widget> _loadApp() async {
    // Perform actual app loading here
    // For example, fetching data from a server
    //var data = await fetchDataFromServer();
    await Future.delayed(const Duration(seconds: 2));
    return const MyApp(); //Here
  }


  @override
  Widget build(BuildContext context) {
    return FutureBuilder<Widget>(
      future: _loadApp(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return snapshot.data!;
        } else if (snapshot.hasError) {
          return Text("Error: ${snapshot.error}");
        } else {
          return Scaffold(
            body: Container(
              color: Colors.indigo,
              child: const Center(
                child: Text(
                  'iDonate',
                  style: TextStyle(color: Colors.white, fontSize: 60),
                ),
              ),
            ),
          );
        }
      },
    );
  }
}

class MyApp extends StatelessWidget {

  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
      appBar: AppBar(
          title: const Text('iDonate'),
          backgroundColor: Theme.of(context).colorScheme.primary),
      body: ListView.builder(
        itemCount: items.length,
        itemBuilder: (context, index) {
          return Card(
            child: Column(
              children: <Widget>[
                Image.network(
                  items[index].imageUrl,
                  fit: BoxFit.cover,
                  height: 150,
                ),
                ListTile(
                  title: Text(items[index].title),
                  subtitle: Text(items[index].description),
                ),
              ],
            ),
          );
        },
      ),
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
                  Navigator.pop(context);
                },
              ),
            ],
          ),
        ),
      ),
    ));
  }
}
