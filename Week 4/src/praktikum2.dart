void main() {
  var halogens = ['fluorine', 'chlorine', 'bromine', 'iodine', 'astatine'];
  print(halogens);

  var names1 = <String>[];
  Set<String> names2 = {};
  var names3 = <String>{};


  names2.add("Ahmad Naufal Ilham");
  names2.add("2341720047");
  names3.addAll(["Ahmad Naufal Ilham", "2341720047"]);

  print("names1 : $names1");
  print("names2 : $names2");
  print("names3 : $names3");
}