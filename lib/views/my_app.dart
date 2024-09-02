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
        backgroundColor: Colors.green[800],
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
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 45),
                    ),
                  ),
                ),
              );
            },
          ),
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        color: Colors.green[800],
        child: ElevatedButton(
            onPressed: _clearScoreBoard, child: Text('Clear Board')),
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
      _showWinDialog(displayElement[0]);
    } else if (displayElement[3] == displayElement[4] &&
        displayElement[3] == displayElement[5] &&
        displayElement[3] != '') {
      _showWinDialog(displayElement[3]);
    } else if (displayElement[6] == displayElement[7] &&
        displayElement[6] == displayElement[8] &&
        displayElement[6] != '') {
      _showWinDialog(displayElement[6]);
    } else if (displayElement[0] == displayElement[3] &&
        displayElement[0] == displayElement[6] &&
        displayElement[0] != '') {
      _showWinDialog(displayElement[0]);
    } else if (displayElement[1] == displayElement[4] &&
        displayElement[1] == displayElement[7] &&
        displayElement[1] != '') {
      _showWinDialog(displayElement[1]);
    } else if (displayElement[2] == displayElement[5] &&
        displayElement[2] == displayElement[8] &&
        displayElement[2] != '') {
      _showWinDialog(displayElement[2]);
    } else if (displayElement[0] == displayElement[4] &&
        displayElement[0] == displayElement[8] &&
        displayElement[0] != '') {
      _showWinDialog(displayElement[0]);
    } else if (displayElement[2] == displayElement[4] &&
        displayElement[2] == displayElement[6] &&
        displayElement[2] != '') {
      _showWinDialog(displayElement[2]);
    } else if (boxfil == 9) {
      _showWDrawDialog('Draw');
    }
  }

  void _showWinDialog(String winner) {
    showDialog(
        barrierDismissible: false,
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text("\" $winner\" is winner!!!"),
            actions: [
              OutlinedButton(
                  child: const Text('Go Again'),
                  onPressed: () {
                    Navigator.of(context).pop();
                    for (int i = 0; i < 9; i++) {
                      displayElement[i] = '';
                      boxfil = 0;
                    }
                  })
            ],
          );
        });
    if (winner == 'X') {
      xWins++;
    } else if (winner == 'O') {
      oWins++;
    }
  }

  void _clearScoreBoard() {
    setState(() {
      xWins = 0;
      oWins = 0;
      for (int i = 0; i < 9; i++) {
        displayElement[i] = '';
      }
    });
    boxfil = 0;
  }

  void _showWDrawDialog(String draw) {
    showDialog(
        barrierDismissible: false,
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text(" Its a draw!!!"),
            actions: [
              OutlinedButton(
                  child: const Text('Go Again'),
                  onPressed: () {
                    Navigator.of(context).pop();
                    for (int i = 0; i < 9; i++) {
                      displayElement[i] = '';
                      boxfil = 0;
                    }
                  })
            ],
          );
        });
  }
}
