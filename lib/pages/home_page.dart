import 'package:flutter/material.dart';
import '../models/user_model.dart';
import '../provider/user_provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<User> users = [];

  @override
  void initState() {
    fetchUsers();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text('Rest Api Call')),
        body: ListView.builder(
            itemCount: users.length,
            itemBuilder: (context, index) {
              final user = users[index];
              final color = user.gender == 'male'?Colors.amber : Colors.pink;
              return ListTile(
                title: Text(user.fullName),
                subtitle: Text(user.location.country),
                tileColor: color,
              );
            }
        )
    );
  }

  Future<void> fetchUsers() async {
    final response = await UserProvider.fetchUsers();
    setState(() {
      users = response;
    });
  }
}
