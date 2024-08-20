
import 'package:flutter/material.dart';

import 'own_widget.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.green),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Button Klicker'),
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

List list=[0,1,2,3,4,5,6,7,8];

  @override
  Widget build(BuildContext context) {
  
    return Scaffold(
      appBar: AppBar(
      
        backgroundColor: Colors.amber,
      
        title: Text(widget.title),
      ),
      body: Center(
      
  
        child: SizedBox(
          width: 400,height: 400,
          child: GridView.builder(
            
            itemCount: 9,
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3),
            itemBuilder: (BuildContext context, int index) {
            
                    return GestureDetector(
                      onTap: () {
                        (index);
                      },
              child: const OwnWidget(xAndOs:'18',),
          );
          
            },
                
                 
                ),
        ),
    ),
    );
  }
}


