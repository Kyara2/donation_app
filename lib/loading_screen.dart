import 'package:flutter/material.dart';

import 'my_app.dart';

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