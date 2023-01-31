import 'package:donation_app/view_item_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'item.dart';
//import 'category.dart';
import 'loading_screen.dart';
import 'my_app.dart';
import 'package:carousel_slider/carousel_slider.dart';

void main() {
  runApp(MaterialApp(
    theme: ThemeData(
        primarySwatch: Colors.indigo,
        textTheme: const TextTheme(
          bodyText1: TextStyle(color: Colors.white),
          headline6: TextStyle(color: Colors.white),
          subtitle2: TextStyle(color: Colors.white),
        )),
    home: const MyApp(),
  ));
}

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

class Body extends StatefulWidget {
  const Body({super.key});

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 100,
          child: CarouselSlider(
            items: [
              Container(
                width: double.infinity,
                child: Image.network(
                  "https://via.placeholder.com/100x100",
                  fit: BoxFit.cover,
                ),
              ),
              Container(
                width: double.infinity,
                child: Image.network(
                  "https://via.placeholder.com/100x100",
                  fit: BoxFit.cover,
                ),
              ),
              Container(
                width: double.infinity,
                child: Image.network(
                  "https://via.placeholder.com/100x100",
                  fit: BoxFit.cover,
                ),
              ),
            ],
            options: CarouselOptions(),
          ),
        ),
        Expanded(
          child: FutureBuilder<List<Item>>(
            future: fetchItem(),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
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
                              onTap: () {
                                Navigator.of(context).push(MaterialPageRoute(
                                    builder: (context) =>
                                        Viewitem(item: snapshot.data![index])));
                              },
                            ),
                          ],
                        ),
                      );
                    });
              } else if (snapshot.hasError) {
                return Text(snapshot.error.toString());
              }
              return const CircularProgressIndicator();
            },
          ),
        ),
      ],
    );
  }
}
