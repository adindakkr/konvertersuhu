//import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
        home: Converter());
  }
}

class Converter extends StatefulWidget {
  @override
  _ConverterState createState() => _ConverterState();
}

class _ConverterState extends State<Converter> {
  double celcius = 0;
  double reamur = 0;
  double kelvin = 0;
  final TextEditingController _input = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Konverter Suhu"),
      ),
      body: Container(
        margin: EdgeInsets.all(8),
        child: Column(
          children: <Widget>[
            input(),
            temperature(),
            button(),
          ],
        ),
      ),
    );
  }

  Widget input() {
    return TextFormField(
      keyboardType: TextInputType.number,
      controller: _input,
      decoration: const InputDecoration(
        border: UnderlineInputBorder(),
        labelText: 'Masukkan Suhu Dalam Celcius',
      ),
    );
  }

  Widget temperature() {
    return Container(
      margin: EdgeInsets.only(top: 150, right: 30, left: 25),
      child: Flex(
        direction: Axis.horizontal,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Widget>[
          Flexible(
            child: Container(
              height: 100,
              child: Column(
                children: [
                  Text(
                    "Suhu Dalam Kelvin",
                    style: TextStyle(fontSize: 13),
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                        top: 10.0), // Memberikan margin antara teks
                  ),
                  Text(
                    "${kelvin.toStringAsFixed(2)}",
                    style: TextStyle(fontSize: 40),
                  ),
                ],
              ),
            ),
          ),
          Flexible(
            child: Container(
              height: 100,
              child: Column(
                children: [
                  Text(
                    "Suhu Dalam Reamur",
                    style: TextStyle(fontSize: 13),
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                        top: 10.0), // Memberikan margin antara teks
                  ),
                  Text(
                    "${reamur.toStringAsFixed(2)}",
                    style: TextStyle(fontSize: 40),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget button() {
    return Expanded(
      child: Align(
        alignment: Alignment.bottomCenter,
        child: Container(
          height: 50,
          width: double.infinity,
          child: ElevatedButton(
            onPressed: () => _hitung(),
            child: Text(
              'Konversi Suhu',
              style: TextStyle(color: Colors.white),
            ),
          ),
        ),
      ),
    );
  }

  void _hitung() {
    setState(() {
      celcius = double.parse(_input.text);
      kelvin = celcius + 273.15;
      reamur = celcius * 0.8;
    });
  }
}
