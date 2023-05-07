import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:myapp/models/person.dart';
import 'package:myapp/services/api.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool hasData = false;
  late List<Person> users;
  @override
  void initState() {
    getData().then((value) {
      users = value;
      hasData = true;
      setState(() {});
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: hasData
          ? ListView.builder(
              itemCount: users.length,
              itemBuilder: (context, index) {
                return ListTile(
                  leading: Text('${index + 1}'),
                  title: Text(users[index].name),
                  trailing: Text(users[index].city),
                );
              })
          : Center(
              child: CircularProgressIndicator(),
            ),
    );
  }
}
