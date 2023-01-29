import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'item.dart';
import 'loading_screen.dart';
import 'my_app.dart';

void main() {
  runApp(const LoadingScreen());
}

class LoadingScreen extends StatelessWidget {
  const LoadingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'IDonate',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: const LoadingScreenPage(),
    );
  }
}

class LoadingScreenPage extends StatelessWidget {
  const LoadingScreenPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Flutter ListView'),
        ),
        body: const MyStatefulWidget());
  }
}

class MyStatefulWidget extends StatefulWidget {
  const MyStatefulWidget({super.key});

  @override
  State<MyStatefulWidget> createState() => _MyStatefulWidgetState();
}

class _MyStatefulWidgetState extends State<MyStatefulWidget> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Item>>(
      future: fetchItem(),
      builder: (context, snapshot) {
        print(snapshot.data![0].imageUrl[0]);
        if (snapshot.hasData) {
          return ListView.builder(
              itemCount: snapshot.data!.length,
              itemBuilder: (BuildContext context, int index) {
                return Card(
                  child: Column(
                    children: <Widget>[
                      Image.network(
                        snapshot.data![index].imageUrl[1],
                        fit: BoxFit.cover,
                        height: 150,
                      ),
                      ListTile(
                        title: Text(snapshot.data![index].title),
                        subtitle: Text(snapshot.data![index].description),
                      ),
                    ],
                  ),
                );
              });
        } else if (snapshot.hasError) {
          return Text(snapshot.error.toString());
        }
        // By default show a loading spinner.
        return const CircularProgressIndicator();
      },
    );
  }
}
