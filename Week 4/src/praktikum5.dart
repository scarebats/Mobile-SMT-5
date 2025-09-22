(int, int) tukar((int, int) record) {
  var (a, b) = record;
  return (b, a);
}

void main() {

  print("\nLangkah 1");
  var record = ('first', a: 2, b: true, 'last');
  print(record);

  print("\nLangkah 3");
  var originalRecord = (99, 1);
  print("Original record: $originalRecord");
  var swappedRecord = tukar(originalRecord);
  print("Swapped record: $swappedRecord");

  print("\nLangkah 4");
  (String, int) mahasiswa = ('Ahmad Naufal Ilham', 2341720047);
  print("Mahasiswa: $mahasiswa");

  print("\nLangkah 5");
  var mahasiswa2 = ('Ahmad Naufal Ilham', a: 2341720047, b: true, 'Politeknik Negeri Malang');

  print("mahasiswa2.\$1: ${mahasiswa2.$1}"); 
  print("mahasiswa2.a: ${mahasiswa2.a}"); 
  print("mahasiswa2.b: ${mahasiswa2.b}"); 
  print("mahasiswa2.\$2: ${mahasiswa2.$2}");

}