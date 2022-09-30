import 'dart:js';

import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Calculator Temperature',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Calculator Temperature'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  var items = ['Kelvin', 'Reamor', 'Farenheit', 'Semua'];

  String dropdownvalue = 'Kelvin';
  String? selectedValue;
  double celcius = 0;
  double kelvin = 0;
  double reamor = 0;
  double farenheit = 0;
  double output = 0;
  double output1 = 0;
  double output2 = 0;
  double output3 = 0;
  List<String> listViewItem1 = <String>[];
  List<String> listViewItem2 = <String>[];
  List<String> listViewItem3 = <String>[];
  List<String> listViewItem4 = <String>[];
  TextEditingController inputTemperature = TextEditingController();

  konversi() {
    setState(() {
      celcius = double.parse(inputTemperature.text);
      if (dropdownvalue == 'Kelvin') {
        output = 273.15 + celcius;
        reamor = 0;
        farenheit = 0;
        kelvin = output;
      } else if (dropdownvalue == 'Reamor') {
        output = 4 / 5 * celcius;
        reamor = output;
        farenheit = 0;
        kelvin = 0;
      } else if (dropdownvalue == 'Farenheit') {
        output = (9 / 5 * celcius) + 32;
        reamor = 0;
        farenheit = output;
        kelvin = 0;
      } else {
        output1 = 273.15 + celcius;
        output2 = 4 / 5 * celcius;
        output3 = (9 / 5 * celcius) + 32;
        reamor = output2;
        farenheit = output3;
        kelvin = output1;
      }
      listViewItem1.add('$kelvin');
      listViewItem2.add('$reamor');
      listViewItem3.add('$farenheit');
      listViewItem4.add('$celcius');
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
        ),
        body: Column(
          children: <Widget>[
            Expanded(
              flex: 2,
              child: Container(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Container(
                      child: InputanSuhu(),
                    ),
                    Container(
                      child: dropDown(),
                    ),
                    Container(
                      child: hasilKonversi(),
                    ),
                    Container(
                      child: buttonKonversi(),
                    ),
                  ],
                ),
              ),
            ),
            const Expanded(
              flex: 1,
              child: Text('Riwayat Konversi'),
            ),
            //const SizedBox(),
            Expanded(flex: 2, child: riwayatKonversi()),
          ],
        ));
  }

  dropDown() {
    return DropdownButton(
      value: dropdownvalue,
      icon: const Icon(Icons.keyboard_arrow_down),
      items: items.map((String items) {
        return DropdownMenuItem(
          value: items,
          child: Text(items),
        );
      }).toList(),
      onChanged: (String? newValue) {
        setState(() {
          dropdownvalue = newValue!;
        });
      },
    );
  }

  buttonKonversi() {
    return SizedBox(
        width: double.infinity,
        child: ElevatedButton(
          child: const Text('Konversi Suhu'),
          onPressed: () => konversi(),
        ));
  }

  hasilKonversi() {
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
            'Suhu dalam Farenheit',
            style: TextStyle(fontSize: 15),
          ),
          const SizedBox(height: 20),
          Text(
            "$farenheit",
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

  InputanSuhu() {
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

  riwayatKonversi() {
    return SizedBox(
      //height: 100,
      child: ListView.builder(
          shrinkWrap: true,
          itemCount: listViewItem1.length,
          itemBuilder: (context, index) => Container(
                margin: const EdgeInsets.fromLTRB(0, 0, 0, 10),
                decoration: BoxDecoration(
                    border: Border.all(width: 1, color: Colors.black)),
                child: Row(
                  children: [
                    Expanded(
                        child: Row(
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: const [
                            Text('Kelvin\t'),
                            Text('Reamur\t'),
                            Text('Farenheit\t'),
                            Text('Celcius\t'),
                          ],
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(listViewItem1.elementAt(index)),
                            Text(listViewItem2.elementAt(index)),
                            Text(listViewItem3.elementAt(index)),
                            Text(listViewItem4.elementAt(index)),
                          ],
                        )
                      ],
                    ))
                  ],
                ),
              )),
    );
  }
}
