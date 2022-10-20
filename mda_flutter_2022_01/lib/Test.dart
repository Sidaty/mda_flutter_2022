
void main() {
  Person person1 = const Person(address: "ACI 2000", name: "Diallo");
  Person person11 = const Person(address: "ACI 2000", name: "Diallo");
  Person person12 = const Person(address: "ACI 2000", name: "Diallo");
  Person person13 = const Person(address: "ACI 2000", name: "Diallo");
  Person person2 = const Person(name: "Traore", address: "Bamakocoura");

  // person1.name = "Diarra";
  print(person1.name);
  print(person2.name);

  int i = 10;
  int j = 10;
}


class Person {
  final String name;
  final String address;

  const Person({required this.name, required this.address});

}