void main() {
  // var list = [1, 2, 3];
  // assert(list.length == 3);
  // assert(list[1] == 2);
  // print(list.length);
  // print(list[1]);

  // list[1] = 1;
  // assert(list[1] == 1);
  // print(list[1]);

  // Langkah 3: Membuat variabel final dengan index = 5 dan default value = null
  final List<String?> list = List<String?>.filled(5, null);

  list[1] = "Ahmad Naufal Ilham";
  list[2] = "2341720047";

  print(list);
}