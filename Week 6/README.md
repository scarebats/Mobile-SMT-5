# PEMROGRAMAN DART - WEEK 6 - PRAKTIKUM*

**Nama  :** Ahmad Naufal Ilham  
**NIM   :** 2341720047  
**Absen :** 04  


# TUGAS PRAKTIKUM 1
# Soal 1
## Selesaikan Praktikum 1 sampai 4, lalu dokumentasikan dan push ke repository Anda berupa screenshot setiap hasil pekerjaan beserta penjelasannya di file README.md!

## Praktikum 1
**Langkah 1**
Buatlah sebuah project flutter baru dengan nama layout_flutter. Atau sesuaikan style laporan praktikum yang Anda buat.

![](img/image1.png)

**Langkah 2**
Buka file main.dart lalu ganti dengan kode berikut. Isi nama dan NIM Anda di text title.
``` dart
import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter layout: Ahmad Naufal Ilham - 2341720047',
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Ahmad Naufal Ilham - 2341720047'),
        ),
        body: const Center(
          child: Text('Hello World'),
        ),
      ),
    );
  }
}
```

![](img/image2.png)

**Langkah 3**
1. Identifikasi Baris dan Kolom
- Bagian judul (Title section) → dibangun dengan Row berisi 3 elemen:
    - Expanded(Column) → memuat 2 teks:
        - Judul utama: Text('Oeschinen Lake Campground', style: bold)
        - Subjudul: Text('Kandersteg, Switzerland', color: Colors.black54)
    - Icon: Icons.star, berwarna merah.
    - Text: angka '41'.
- Expanded di sini bertugas agar kolom teks mengambil ruang tersisa, sehingga ikon bintang dan angka secara otomatis terdorong ke sisi kanan baris.
- Bagian tombol (Button section) → dibuat dengan Row yang memiliki 3 anak, masing-masing berupa Column (dengan mainAxisSize: MainAxisSize.min), isinya:
    - Ikon dengan warna tema utama (biru).
    - SizedBox(height: 8) sebagai jarak.
    - Label teks (warna biru, tebal sedang).
- Row menggunakan mainAxisAlignment: spaceEvenly sehingga ketiga tombol tersebar merata.

2. Apakah menggunakan Grid?
- Tidak, karena layout hanya memanfaatkan kombinasi Row dan Column, tanpa GridView.

3. Apakah ada elemen bertumpuk?
- Tidak ada. Karena tidak digunakan Stack atau Positioned, maka elemen ditampilkan berurutan tanpa overlap.

4. Apakah memerlukan tab navigasi?
- Tidak perlu, karena di sini tidak dipakai TabBar atau TabBarView.

5. Alignment, Padding, dan Border
- Alignment
    - Title → kolom teks diatur dengan crossAxisAlignment.start, sedangkan Expanded memastikan ikon dan angka menempel di kanan.
    - Tombol → baris memakai MainAxisAlignment.spaceEvenly agar setiap tombol berada pada posisi rata.
- Padding
    - Title diberi EdgeInsets.all(16).
    - Tombol diberi EdgeInsets.symmetric(horizontal: 24, vertical: 8).
    - Teks tambahan menggunakan EdgeInsets.all(24).
- Borders
    - Tidak ada bingkai khusus. Jika ingin styling, bisa dibungkus Card atau Container dengan BoxDecoration.

![](img/image3.png)

**Langkah 4**
``` dart
import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    // ===== titleSection =====
    final Widget titleSection = Container(
      padding: const EdgeInsets.all(32),
      child: Row(
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  padding: const EdgeInsets.only(bottom: 8),
                  child: const Text(
                    'Kebun Apel',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
                const Text(
                  'Batu, Malang, Indonesia',
                  style: TextStyle(color: Colors.grey),
                ),
              ],
            ),
          ),
          const Icon(Icons.star, color: Colors.red),
          const SizedBox(width: 8),
          const Text('4.1'),
        ],
      ),
    );

    return MaterialApp(
      title: 'Flutter layout: Ahmad Naufal Ilham - 2341720047',
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Ahmad Naufal Ilham - 2341720047'),
        ),
        body: ListView(
          children: [
            titleSection,
          ],
        ),
      ),
    );
  }
}
```

![](img/image4.png)

## Praktikum 2
**Langkah 1**
``` dart
Column _buildButtonColumn(Color color, IconData icon, String label) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(icon, color: color),
        Container(
          margin: const EdgeInsets.only(top: 8),
          child: Text(
            label,
            style: TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w400,
              color: color,
            ),
          ),
        ),
      ],
    );
  }
```

![](img/image5.png)

**Langkah 2**
``` dart
Widget buttonSection = Row(
  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
  children: [
    _buildButtonColumn(color, Icons.call, 'CALL'),
    _buildButtonColumn(color, Icons.near_me, 'ROUTE'),
    _buildButtonColumn(color, Icons.share, 'SHARE'),
  ],
);
```

**Langkah 3**
Tambahkan variabel buttonSection ke dalam body seperti berikut:
``` dart
return MaterialApp(
      title: 'Flutter layout: Ahmad Naufal Ilham - 2341720047',
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Ahmad Naufal Ilham - 2341720047'),
        ),
        body: ListView(
          children: [
            titleSection,
            buttonSection,
          ],
        ),
      ),
    );
```

![](img/image6.png)

## Praktikum 3
**Langkah 1**
``` dart
Widget textSection = Container(
  padding: const EdgeInsets.all(32),
  child: const Text(
    'Apel Malang merupakan simbol dari pariwisata kota Malang itu sendiri.'
    'Kebun apel mudah ditemukan di kawasan ini, tersebar di beberapa kecamatan, terutama di provinsi Pujon dan Batu.'
    'Rasa buah apel yang manis dan segar dengan ukuran yang kecil-kecil menjadi oleh-oleh yang pas saat berkunjung ke Malang.'
    'Tambahkan nama dan NIM Anda sebagai '
    '\n\nNama : Ahmad Naufal Ilham'
    '\nNIM : 2341720047',
    softWrap: true,
  ),
);
```

**Langkah 2**
Tambahkan widget variabel textSection ke dalam body seperti berikut:
``` dart
return MaterialApp(
      title: 'Flutter layout: Ahmad Naufal Ilham - 2341720047',
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Ahmad Naufal Ilham - 2341720047'),
        ),
        body: ListView(
          children: [
            titleSection,
            buttonSection,
            textSection,
          ],
        ),
      ),
    );
```

![](img/image7.png)

## Praktikum 4
**Langkah 1**
Anda dapat mencari gambar di internet yang ingin ditampilkan. Buatlah folder images di root project layout_flutter. Masukkan file gambar tersebut ke folder images, lalu set nama file tersebut ke file pubspec.yaml seperti berikut:
``` dart
flutter:

  # The following line ensures that the Material Icons font is
  # included with your application, so that you can use the icons in
  # the material Icons class.
  uses-material-design: true

  # To add assets to your application, add an assets section, like this:
  assets:
    - images/kebunapel.jpg
```

**Langkah 2**
Tambahkan aset gambar ke dalam body seperti berikut:
``` dart
return MaterialApp(
      title: 'Flutter layout: Ahmad Naufal Ilham - 2341720047',
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Ahmad Naufal Ilham - 2341720047'),
        ),
        body: Column(
          children: [
            Image.asset(
              'images/kebunapel.jpg',
              width: 600,
              height: 240,
              fit: BoxFit.cover,
            ),
            titleSection,
            buttonSection,
            textSection,
          ],
        ),
      ),
    );
```

**Langkah 3**
Pada langkah terakhir ini, atur semua elemen dalam ListView, bukan Column, karena ListView mendukung scroll yang dinamis saat aplikasi dijalankan pada perangkat yang resolusinya lebih kecil.
``` dart
return MaterialApp(
      title: 'Flutter layout: Ahmad Naufal Ilham - 2341720047',
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Ahmad Naufal Ilham - 2341720047'),
        ),
        body: ListView(
          children: [
            Image.asset(
              'images/kebunapel.jpg',
              width: 600,
              height: 240,
              fit: BoxFit.cover,
            ),
            titleSection,
            buttonSection,
            textSection,
          ],
        ),
      ),
    );
```

![](img/image8.png)


# Soal 2
## Silakan implementasikan di project baru "basic_layout_flutter" dengan mengakses sumber ini: https://docs.flutter.dev/codelabs/layout-basics

``` dart
import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    Widget titleSection = ListTile(
      title: const Text(
        'Air Terjun Coban Rondo',
        style: TextStyle(fontWeight: FontWeight.bold),
      ),
      subtitle: Text(
        'Kecamatan Pujon, Kabupaten Malang, Jawa Timur.',
        style: TextStyle(color: Colors.grey[500]),
      ),
      trailing: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(Icons.star, color: Colors.red[500]),
          const Text('5.0'),
        ],
      ),
      contentPadding: const EdgeInsets.all(32),
    );

    Color color = Theme.of(context).primaryColor;

    Widget buttonSection = Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        _buildButtonColumn(color, Icons.call, 'REVIEW'),
        _buildButtonColumn(color, Icons.near_me, 'ROUTE'),
        _buildButtonColumn(color, Icons.share, 'SHARE'),
      ],
    );

    Widget textSection = const Padding(
      padding: EdgeInsets.all(32),
      child: Text(
          'Air Terjun Coban Rondo merupakan air terjun yang terletak di Kecamatan Pujon, Kabupaten Malang, Jawa Timur.'
          'Air terjun ini mudah dijangkau oleh kendaraan umum. '
          'Akses yang paling mudah adalah dengan melalui jalan raya dari Malang ke Batu di sebelah timur atau dari Kediri ke Pare menuju Malang dari arah barat.',
        softWrap: true,
      ),
    );

    return MaterialApp(
      title: 'Flutter layout demo',
      home: Scaffold(
        appBar: AppBar(title: const Text('Wisata Jawa Timur')),
        body: ListView(
          children: [
            Stack(
              alignment: Alignment.bottomLeft,
              children: [
                Image.asset(
                  'images/cobanrondo.jpg',
                  width: 600,
                  height: 240,
                  fit: BoxFit.cover,
                ),
                Positioned(
                  bottom: 16,
                  left: 16,
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                      vertical: 8,
                      horizontal: 12,
                    ),
                    color: Colors.black54,
                    child: const Text(
                      'Coban Rondo',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            titleSection,
            Card(
              margin: const EdgeInsets.all(16.0),
              elevation: 4.0,
              child: Column(children: [buttonSection, textSection]),
            ),
          ],
        ),
      ),
    );
  }

  Column _buildButtonColumn(Color color, IconData icon, String label) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Icon(icon, color: color),
        Container(
          margin: const EdgeInsets.only(top: 8, bottom: 8),
          child: Text(
            label,
            style: TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w400,
              color: color,
            ),
          ),
        ),
      ],
    );
  }
}  
```

![](img/image9.png)

# Soal 3
## Kumpulkan link commit repository GitHub Anda kepada dosen yang telah disepakati!

## Praktikum 5
**Langkah1**

**Langkah2**
**Langkah3**
**Langkah4**
**Langkah5**
**Langkah6**
**Langkah7**