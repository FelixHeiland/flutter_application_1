// ignore: unused_import
//import 'dart:ffi';

import 'package:flutter/material.dart';

//import 'own_widget.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'TIC-TAC-TOE',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.green),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Tic Tac Toe'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  bool xturn = true;
  int boxfil = 0;
  int xWins = 0;
  int oWins = 0;
  List<String> displayElement = ['', '', '', '', '', '', '', '', ''];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.amber,
        title: Text('player X = $xWins player O = $oWins'),
      ),
      body: Center(
        child: SizedBox(
          width: 400,
          height: 400,
          child: GridView.builder(
            itemCount: 9,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 3),
            itemBuilder: (BuildContext context, int index) {
              return GestureDetector(
                onTap: () {
                  _tapped(index);
                },
                child: Container(
                  padding: const EdgeInsets.all(8),
                  decoration: const BoxDecoration(
                      border: Border(
                        top: BorderSide(color: Color(0xFFDFDFDF)),
                        left: BorderSide(color: Color(0xFFDFDFDF)),
                        right: BorderSide(color: Color(0xFF7F7F7F)),
                        bottom: BorderSide(color: Color(0xFF7F7F7F)),
                      ),
                      color: Colors.green),
                  child: Center(
                    child: Text(
                      displayElement[index],
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }

  void _tapped(int index) {
    setState(() {
      if (xturn && displayElement[index] == '') {
        displayElement[index] = 'X';
        boxfil++;
      } else if (!xturn && displayElement[index] == '') {
        displayElement[index] = 'O';
        boxfil++;
      }
      xturn = !xturn;
      _checkWin();
    });
  }

  void _checkWin() {
    if (displayElement[0] == displayElement[1] &&
        displayElement[0] == displayElement[2] &&
        displayElement[0] != '') {
      displayElement[4] = 'Win';
    } else if (displayElement[3] == displayElement[4] &&
        displayElement[3] == displayElement[5] &&
        displayElement[3] != '') {
      displayElement[4] = 'Win';
    } else if (displayElement[6] == displayElement[7] &&
        displayElement[6] == displayElement[8] &&
        displayElement[6] != '') {
      displayElement[4] = 'Win';
    } else if (displayElement[0] == displayElement[3] &&
        displayElement[0] == displayElement[6] &&
        displayElement[0] != '') {
      displayElement[4] = 'Win';
    } else if (displayElement[1] == displayElement[4] &&
        displayElement[1] == displayElement[7] &&
        displayElement[1] != '') {
      displayElement[4] = 'Win';
    } else if (displayElement[2] == displayElement[5] &&
        displayElement[2] == displayElement[8] &&
        displayElement[2] != '') {
      displayElement[4] = 'Win';
    } else if (displayElement[0] == displayElement[4] &&
        displayElement[0] == displayElement[8] &&
        displayElement[0] != '') {
      displayElement[4] = 'Win';
    } else if (displayElement[2] == displayElement[4] &&
        displayElement[2] == displayElement[6] &&
        displayElement[2] != '') {
      displayElement[4] = 'Win';
    } else if (boxfil == 9) {
      displayElement[4] = 'DRAW';
    }
  }
}
