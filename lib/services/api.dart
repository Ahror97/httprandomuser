import 'dart:convert';

import 'package:http/http.dart' as http;
import '../models/person.dart';

Future<List<Person>> getData() async {
  String gateway = 'www.randomuser.me';
  Uri url = Uri.https(gateway, '/api', {'results': '50'});
  http.Response response = await http.get(url);

  Map<String, dynamic> data = jsonDecode(response.body);
  List list = data['results'];

  List<Person> users = list.map((e) {
    return Person.fromJson(e);
  }).toList();

  return users;
}
