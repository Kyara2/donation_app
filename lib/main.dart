import 'package:donation_app/view_item_screen.dart';
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
        if (snapshot.hasData) {
          print(snapshot.data![0].imageUrl[0]);
          return ListView.builder(
              itemCount: snapshot.data!.length,
              itemBuilder: (BuildContext context, int index) {
                return Card(
                  child: Column(
                    children: <Widget>[
                      Image.network(
                        snapshot.data![index].imageUrl[0],
                        fit: BoxFit.cover,
                        height: 150,
                      ),
                      ListTile(
                        title: Text(snapshot.data![index].title),
                        subtitle: Text(snapshot.data![index].description), 
                        onTap: (){
                          Navigator.of(context).push(MaterialPageRoute(builder: (context) => Viewitem(item: snapshot.data![index])));
                        },
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
