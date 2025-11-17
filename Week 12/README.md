# PEMROGRAMAN DART - WEEK 12 - PRAKTIKUM

**Nama  :** Ahmad Naufal Ilham  
**NIM   :** 2341720047  
**Absen :** 04 

# Praktikum 1 - Dart Streams
**Langkah 1 - Buat Project Baru**

Buatlah sebuah project flutter baru dengan nama stream_nama (beri nama panggilan Anda) di folder week-12/src/ repository GitHub Anda.

**Langkah 2 - Buka file main.dart**

Ketiklah kode seperti berikut ini.
``` dart
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Stream - Naufal',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const StreamHomePage(),
    );
  }
}

class StreamHomePage extends StatefulWidget {
  const StreamHomePage({super.key});

  @override
  State<StreamHomePage> createState() => _StreamHomePageState();
}

class _StreamHomePageState extends State<StreamHomePage> {
  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
```

Soal 1

1. Tambahkan nama panggilan Anda pada title app sebagai identitas hasil pekerjaan Anda.

2. Gantilah warna tema aplikasi sesuai kesukaan Anda.

**Langkah 3 - Buat file baru stream.dart**

Buat file baru di folder lib project Anda. Lalu isi dengan kode berikut.
``` dart
import 'package:flutter/material.dart';

class ColorStream {

}
```

**Langkah 4 - Tambah variabel colors**

Tambahkan variabel di dalam class ColorStream seperti berikut.
``` dart
final List<Color> colors = [
  Colors.blueGrey,
  Colors.amber,
  Colors.deepPurple,
  Colors.lightBlue,
  Colors.teal,
  Colors.green,
  Colors.red,
  Colors.orange,
  Colors.purple,
  Colors.yellow,
];
```

Soal 2

1. Tambahkan 5 warna lainnya sesuai keinginan Anda pada variabel colors tersebut.

**Langkah 5 - Tambah method getColors()**

Di dalam class ColorStream ketik method seperti kode berikut. Perhatikan tanda bintang di akhir keyword async* (ini digunakan untuk melakukan Stream data)
``` dart
Stream<Color> getColors() async* {

}
```

**Langkah 6 - Tambah perintah yield*.**

Tambahkan kode berikut ini.
``` dart
yield* Stream.periodic(
  const Duration(seconds: 1), (int t) {
    int index = t % colors.length;
    return colors[index];
});
```

Soal 3

1. Jelaskan fungsi keyword yield* pada kode tersebut!

Fungsi yield*

yield* pada async* digunakan untuk:

- Mengalirkan seluruh nilai yang berasal dari Stream lain tanpa harus memanggil yield satu per satu.
- Menggabungkan atau meneruskan Stream eksternal ke Stream yang sedang dibuat.
- Dengan kata lain, Stream yang kamu buat akan mengeluarkan semua data yang dipancarkan oleh Stream lain secara otomatis.

2. Apa maksud isi perintah kode tersebut?

- Stream.periodic() membuat sebuah aliran data yang memancarkan nilai baru setiap interval waktu tertentu, dalam hal ini setiap 1 detik.
- Argumen (int t) berfungsi sebagai penghitung otomatis yang bertambah mulai dari 0, kemudian 1, 2, 3, dan seterusnya.
- Ekspresi t % colors.length dipakai untuk memilih indeks warna secara bergantian. Jika indeks mencapai batas akhir list, maka ia kembali ke posisi awal.
- Setiap detik, stream menghasilkan satu warna berdasarkan indeks tersebut.
- Akibatnya, warna latar belakang aplikasi berubah setiap detik secara berulang-ulang mengikuti urutan warna yang ada.

**Langkah 7 - Buka main.dart**

Ketik kode impor file ini pada file main.dart
``` dart
import 'stream.dart';
```

**Langkah 8 - Tambah variabel**

Ketik dua properti ini di dalam class _StreamHomePageState
``` dart
Color bgColor = Colors.blueGrey;
late ColorStream colorStream;
```

**Langkah 9 - Tambah method changeColor()**

Tetap di file main, Ketik kode seperti berikut
``` dart
void changeColor() async {
  await for (var eventColor in colorStream.getColors()) {
    setState(() {
      bgColor = eventColor;
    });
  }
}
```

**Langkah 10 - Lakukan override initState()**

Ketika kode seperti berikut
``` dart
@override
void initState() {
  super.initState();
  colorStream = ColorStream();
  changeColor();
}
```

**Langkah 11 - Ubah isi Scaffold()**

Sesuaikan kode seperti berikut.
``` dart
return Scaffold(
  appBar: AppBar(
    title: const Text('Stream - Naufal'),
  ),
  body: Container(
    decoration: BoxDecoration(color: bgColor),
  ),
);
```

**Langkah 12 - Run**

Lakukan running pada aplikasi Flutter Anda, maka akan terlihat berubah warna background setiap detik.

<p align="center">
  <img src="img/image1.png" width="45%">
  <img src="img/image2.png" width="45%">
</p>

Soal 4

1. Capture hasil praktikum Anda berupa GIF dan lampirkan di README.

**Langkah 13 - Ganti isi method changeColor()**

Anda boleh comment atau hapus kode sebelumnya, lalu ketika kode seperti berikut.
``` dart
colorStream.getColors().listen((eventColor) {
  setState(() {
    bgColor = eventColor;
  });
});
```

Soal 5

1. Jelaskan perbedaan menggunakan listen dan await for (langkah 9) !

- await for
    - Digunakan untuk mengambil nilai dari stream secara berurutan, satu event pada satu waktu. Cara kerjanya seperti melakukan perulangan yang menunggu setiap data muncul sebelum lanjut ke data berikutnya. Biasanya dipakai kalau kita ingin mengeksekusi semua data dalam stream sampai stream berakhir.
- listen()
    - Metode ini mendaftarkan sebuah fungsi yang akan dijalankan setiap kali stream mengirimkan event baru. Proses ini tidak menghentikan eksekusi kode lain, karena callback akan dipanggil secara otomatis di background. Cocok digunakan jika ingin menerima update dari stream tanpa harus menunggu seluruh proses selesai.

# Praktikum 2
**Langkah 1**
**Langkah 2**
**Langkah 3**
**Langkah 4**
**Langkah 5**
**Langkah 6**
**Langkah 7**
**Langkah 8**
**Langkah 9**
**Langkah 10**
**Langkah 11**
**Langkah 12**
**Langkah 13**
**Langkah 14**
**Langkah 15**

# Praktikum 3
**Langkah 1**
**Langkah 2**
**Langkah 3**
**Langkah 4**

# Praktikum 4
**Langkah 1**
**Langkah 2**
**Langkah 3**
**Langkah 4**
**Langkah 5**
**Langkah 6**
**Langkah 7**
**Langkah 8**
**Langkah 9**
**Langkah 10**

# Praktikum 5
**Langkah 1**
**Langkah 2**
**Langkah 3**
**Langkah 4**
**Langkah 5**
**Langkah 6**

# Praktikum 6
**Langkah 1**
**Langkah 2**
**Langkah 3**
**Langkah 4**
**Langkah 5**
**Langkah 6**
**Langkah 7**
**Langkah 8**

# Praktikum 7
**Langkah 1**
**Langkah 2**
**Langkah 3**
**Langkah 4**
**Langkah 5**
**Langkah 6**
**Langkah 7**
**Langkah 8**
**Langkah 9**
**Langkah 10**
**Langkah 11**
**Langkah 12**
**Langkah 13**
