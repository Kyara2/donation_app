import 'package:flutter/material.dart';
import 'my_app.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  SplashScreenState createState() => SplashScreenState();
}

class SplashScreenState extends State<SplashScreen> {
  Future<Widget> _loadApp() async {
    await Future.delayed(const Duration(seconds: 2));
    return const MyApp();
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
