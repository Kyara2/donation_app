import 'package:donation_app/item_detail.dart';
import 'package:donation_app/main.dart';
import 'package:flutter/material.dart';

import 'category.dart';
import 'item.dart';

class Body extends StatelessWidget {
  const Body({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(
          alignment: Alignment.topCenter,
          height: 100,
          child: Container(
            alignment: Alignment.topCenter,
            width: double.infinity,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: categories.length,
              itemBuilder: (BuildContext context, int index) {
                return Padding(
                    padding: const EdgeInsets.all(2.0),
                    child: Container(
                      height: double.infinity,
                      width: 120,
                      decoration: BoxDecoration(
                        color: const Color(0xFF1D2766), //1D2766
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            categories[index].icon,
                            color: Colors.white,
                          ),
                          const SizedBox(height: 8),
                          Text(
                            categories[index].name,
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 14,
                            ),
                          ),
                        ],
                      ),
                    ));
              },
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
                      return GestureDetector(
                        onTap: () {
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) =>
                                  ItemDetail(item: snapshot.data![index])));
                        },
                        child: Card(
                          color: colorCustom,
                          shadowColor: colorCustom.shade600,
                          child: Column(
                            children: <Widget>[
                              ListTile(
                                leading: Image.network(
                                  snapshot.data![index].imageUrl[0],
                                  fit: BoxFit.cover,
                                  //height: 150,
                                ),
                                title: Text(snapshot.data![index].title,
                                    style:
                                        const TextStyle(color: Colors.white)),
                                subtitle: Text(
                                    snapshot.data![index].description,
                                    style:
                                        const TextStyle(color: Colors.white)),
                                shape: RoundedRectangleBorder(
                                  side: const BorderSide(
                                      color: Color(0xFF1D2766), width: 1),
                                  borderRadius: BorderRadius.circular(5),
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    });
              } else if (snapshot.hasError) {
                return Text(snapshot.error.toString());
              }
              return const Center(child: CircularProgressIndicator());
            },
          ),
        ),
      ],
    );
  }
}
