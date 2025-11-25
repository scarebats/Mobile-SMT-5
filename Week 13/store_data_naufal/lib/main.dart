import 'dart:io';

import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:store_data_naufal/model/pizza.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:path_provider/path_provider.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter JSON Demo - Naufal',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final pwdController = TextEditingController();
  String myPass = '';
  final storage = const FlutterSecureStorage();
  final String myKey = "myPass";

  late File myFile;
  String fileText = '';

  String documentPath = '';
  String tempPath = '';

  int appCounter = 0;
  String pizzaString = '';
  List<Pizza> myPizzas = [];

  Future<void> writeToSecureStorage() async {
    await storage.write(key: myKey, value: pwdController.text);
  }

  Future<String> readFromSecureStorage() async {
    return await storage.read(key: myKey) ?? "";
  }

  Future<bool> readFile() async {
    try {
      String fileContent = await myFile.readAsString();
      setState(() {
        fileText = fileContent;
      });
      return true;
    } catch (e) {
      return false;
    }
  }

  Future<bool> writeFile() async {
  try {
    await myFile.writeAsString('Ahmad Naufal Ilham - 2341720047');
    return true;
  } catch (e) {
    return false;
  }
}

  Future getPaths() async {
    final docDir = await getApplicationDocumentsDirectory();
    final tempDir = await getTemporaryDirectory();
    setState(() {
      documentPath = docDir.path;
      tempPath = tempDir.path;
    });
  }

  Future<void> readAndWritePreference() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    appCounter = prefs.getInt('appCounter') ?? 0;
    appCounter++;

    await prefs.setInt('appCounter', appCounter);

    setState(() {
      appCounter = appCounter;
    });
  }

  Future<void> deletePreference() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.remove('appCounter');
    setState(() {
      appCounter = 0;
    });
  }

  String convertToJSON(List<Pizza> pizzas) {
    return jsonEncode(pizzas.map((pizza) => pizza.toJson()).toList());
  }

  // Future readJsonFile() async {
  //   String myString = await DefaultAssetBundle.of(context)
  //       .loadString('assets/pizzalist.json');
  Future<List<Pizza>> readJsonFile() async {
    String myString = await DefaultAssetBundle.of(context)
        .loadString('assets/pizzalist.json');
    List pizzaMapList = jsonDecode(myString);
    
    List<Pizza> myPizzas = [];
    for (var pizza in pizzaMapList) {
      Pizza myPizza = Pizza.fromJson(pizza);
      myPizzas.add(myPizza);
    }

    // Praktikum 1 - Langkah 7
    // pizzaString = myString;
    String json = convertToJSON(myPizzas);
    print(json);
    return myPizzas;
  }

  @override
  void initState() {
    super.initState();
    readAndWritePreference();
    getPaths().then((_) {
      myFile = File('$documentPath/pizzas.txt');
      writeFile();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('JSON - Naufal'),
        backgroundColor: Colors.tealAccent.shade700,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
            Text(
              'Doc Path:\n$documentPath',
              textAlign: TextAlign.center, 
            ),
            const Divider(),
            Text(
              'Temp Path:\n$tempPath',
              textAlign: TextAlign.center,
            ),
            const Divider(),
            ElevatedButton(
              onPressed: () => readFile(),
              child: const Text('Read File'),
            ),
            Text(
              fileText,
              style: const TextStyle(
                fontSize: 16,
                color: Colors.lightBlue,
              ),
            ),
          ],
        ),
      ),
    );
  }
}