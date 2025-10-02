// import 'package:flutter/material.dart';

// void main() => runApp(const MyApp());

// class MyApp extends StatelessWidget {
//   const MyApp({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Flutter layout: Ahmad Naufal Ilham - 2341720047',
//       home: Scaffold(
//         appBar: AppBar(
//           title: const Text('Ahmad Naufal Ilham - 2341720047'),
//         ),
//         body: const Center(
//           child: Text('Hello World'),
//         ),
//       ),
//     );
//   }
// }

// Langkah 3 - Praktikum 1
// import 'package:flutter/material.dart';

// void main() => runApp(const MyApp());

// class MyApp extends StatelessWidget {
//   const MyApp({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Flutter layout: Ahmad Naufal Ilham - 2341720047',
//       debugShowCheckedModeBanner: false,
//       theme: ThemeData(
//         colorSchemeSeed: Colors.lightBlueAccent,
//         useMaterial3: true,
//       ),
//       home: Scaffold(
//         appBar: AppBar(
//           title: const Text('Ahmad Naufal Ilham - 2341720047'),
//         ),
//         body: const LakeLayout(),
//       ),
//     );
//   }
// }

// class LakeLayout extends StatelessWidget {
//   const LakeLayout({super.key});

//   static const String _desc =
//       'Lake Oeschinen lies at the foot of the Blüemlisalp in the Bernese Alps. '
//       'Situated 1,578 meters above sea level, it is one of the larger Alpine Lakes. '
//       'A gondola ride from Kandersteg, followed by a half-hour walk through pastures '
//       'and pine forest, leads you to the lake, which warms to 20 degrees Celsius '
//       'in the summer. Activities enjoyed here include rowing, and riding the summer toboggan run.';

//    Column _buildButton(IconData icon, String label, Color color) {
//     return Column(
//       mainAxisSize: MainAxisSize.min,
//       children: [
//         Icon(icon, color: color),
//         const SizedBox(height: 8),
//         Text(label, style: TextStyle(color: color, fontWeight: FontWeight.w600)),
//       ],
//     );
//   }

//   @override
//   Widget build(BuildContext context) {
//     final primary = Theme.of(context).colorScheme.primary;

//     final topImage = Image.network(
//       'https://raw.githubusercontent.com/flutter/website/main/examples/layout/lakes/step5/images/lake.jpg',
//       height: 240, width: double.infinity, fit: BoxFit.cover,
//     );

//     final titleSection = Padding(
//       padding: const EdgeInsets.all(16),
//       child: Row(
//         children: [
//           const Expanded(
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 Text('Oeschinen Lake Campground', style: TextStyle(fontWeight: FontWeight.bold)),
//                 SizedBox(height: 8),
//                 Text('Kandersteg, Switzerland', style: TextStyle(color: Colors.black54)),
//               ],
//             ),
//           ),
//           const Icon(Icons.star, color: Colors.red),
//           const SizedBox(width: 4),
//           const Text('41'),
//         ],
//       ),
//     );

//     // >>> Ini yang tadi hilang/berubah nama <<<
//     final buttonSection = Padding(
//       padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 8),
//       child: Row(
//         mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//         children: [
//           _buildButton(Icons.call, 'CALL', Color( 0xFF2196F3)),
//           _buildButton(Icons.near_me, 'ROUTE', Color(0xFF2196F3)),
//           _buildButton(Icons.share, 'SHARE', Color(0xFF2196F3)),
//         ],
//       ),
//     );

//     final textSection = const Padding(
//       padding: EdgeInsets.all(24),
//       child: Text(_desc, softWrap: true),
//     );

//     return ListView(
//       children: [
//         topImage,
//         titleSection,
//         buttonSection, // sekarang terdefinisi
//         textSection,
//       ],
//     );
//   }
// }

// Langkah 4 - Praktikum 1
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
  
    Color color = Theme.of(context).primaryColor;

  Widget buttonSection = Row(
  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
  children: [
    _buildButtonColumn(color, Icons.call, 'CALL'),
    _buildButtonColumn(color, Icons.near_me, 'ROUTE'),
    _buildButtonColumn(color, Icons.share, 'SHARE'),
  ],
);

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
  }

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
}