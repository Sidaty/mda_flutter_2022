
void main() {
  final numberList = [
    1, 2, 3, 4, 5
  ];

  final numberList2 = [];
  for(int i = 0; i < numberList.length; i++) {
    int number = numberList[i];
    int number2 = number * 2;
    numberList2.add(number2);
  }

  final numberList3 = numberList.map((number) => number * 2).toList();

  print(numberList);
  print(numberList2);
  print(numberList3);
}

test1() {
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