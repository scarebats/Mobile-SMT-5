void main() {
  String nama = "Ahmad Naufal Ilham"; 
  String nim = "2341720047";         

  for (int i = 0; i <= 201; i++) {
    if (prima(i)) {
      print("$i adalah bilangan prima -> $nama - $nim");
    } else {
      print(i);
    }
  }
}

bool prima(int n) {
  if (n < 2) return false;
  for (int i = 2; i <= n ~/ 2; i++) {
    if (n % i == 0) return false;
  }
  return true;
}
