import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Calculator Temperature',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Calculator Temperature'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  double celcius = 0;
  double kelvin = 0;
  double reamor = 0;
  TextEditingController inputTemperature = TextEditingController();

  konversi() {
    setState(() {
      celcius = double.parse(inputTemperature.text);
      reamor = 4 / 5 * celcius;
      kelvin = 273.15 + celcius;
    });
  }

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
        appBar: AppBar(
          // Here we take the value from the MyHomePage object that was created by
          // the App.build method, and use it to set our appbar title.
          title: Text(widget.title),
        ),
        body: Container(
            child: Column(
          children: [InputanSuhu(), HasilKonversi(), ButtonKonversi()],
        )));
  }

  SizedBox ButtonKonversi() {
    return SizedBox(
        width: double.infinity,
        child: ElevatedButton(
          child: const Text('Konversi Suhu'),
          onPressed: () => konversi(),
        ));
  }

  Row HasilKonversi() {
    return Row(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
      Column(
        children: [
          const Text(
            'Suhu dalam Reamor',
            style: TextStyle(fontSize: 15),
          ),
          const SizedBox(height: 20),
          Text(
            "$reamor",
            style: const TextStyle(fontSize: 25),
          )
        ],
      ),
      Column(
        children: [
          const Text(
            'Suhu dalam Kelvin',
            style: TextStyle(fontSize: 15),
          ),
          const SizedBox(height: 20),
          Text(
            "$kelvin",
            style: const TextStyle(fontSize: 25),
          )
        ],
      ),
    ]);
  }

  Container InputanSuhu() {
    return Container(
        padding: EdgeInsets.all(10),
        child: TextFormField(
            controller: inputTemperature,
            keyboardType: TextInputType.number,
            decoration: const InputDecoration(
              border: UnderlineInputBorder(),
              labelText: 'Masukan Suhu Dalam Celcius',
            )));
  }
}
