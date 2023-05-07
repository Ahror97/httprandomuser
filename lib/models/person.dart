class Person {
  final String name;
  final String username;
  final String city;
  Person({required this.name, required this.username, required this.city});

  factory Person.fromJson(Map<String, dynamic> data) {
    return Person(
        name: data['name']['first'],
        username: data['login']['username'],
        city: data['location']['city']);
  }
}
