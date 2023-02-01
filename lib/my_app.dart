import 'package:donation_app/view_item_screen.dart';
import 'package:flutter/services.dart';
import 'item.dart';
import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';

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

class Body extends StatelessWidget {
  const Body({super.key});
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 100,
          child: Container(
            width: double.infinity,
            constraints: BoxConstraints(maxWidth: MediaQuery.of(context).size.width),
            child: CarouselSlider(
              items: [
                SizedBox(
                  width: double.infinity,
                  child: Image.network(
                    "https://via.placeholder.com/100x100",
                    fit: BoxFit.cover,
                  ),
                ),
                SizedBox(
                  width: double.infinity,
                  child: Image.network(
                    "https://via.placeholder.com/100x100",
                    fit: BoxFit.cover,
                  ),
                ),
                SizedBox(
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
