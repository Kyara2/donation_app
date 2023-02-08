import 'package:donation_app/get_account.dart';
import 'package:flutter/material.dart';

class MyAccountPage extends StatefulWidget {
  const MyAccountPage({super.key});

  @override
  _MyAccountPageState createState() => _MyAccountPageState();
}

Future<AccountDetails> loadAccountDetails() async {
  var response = await fetchAccountDetails();
  //print(response);
  return response;
}

class _MyAccountPageState extends State<MyAccountPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Minha conta"),
        ),
        body: FutureBuilder<AccountDetails>(
            future: loadAccountDetails(),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return Container(
                  child: Column(
                    children: [
                      ListTile(
                        leading: Image.network(snapshot.data!.profileImage),
                        title: const Text("Usuário",
                            style: TextStyle(color: Colors.black)),
                        subtitle: Text(snapshot.data!.name,
                            style: const TextStyle(color: Colors.white)),
                      ),
                      ListTile(
                        leading: const Icon(
                          Icons.email,
                          color: Colors.white,
                        ),
                        title: const Text("Email",
                            style: TextStyle(color: Colors.white)),
                        subtitle: Text(snapshot.data!.email,
                            style: const TextStyle(color: Colors.white)),
                      ),
                      ListTile(
                        leading: const Icon(
                          Icons.settings,
                          color: Colors.white,
                        ),
                        title: const Text("Configurações",
                            style: TextStyle(color: Colors.white)),
                        onTap: () {},
                      ),
                    ],
                  ),
                );
              } else if (snapshot.hasError) {
                return Text(snapshot.error.toString());
              }
              return const Center(child: CircularProgressIndicator());
            }));
  }
}
