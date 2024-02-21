// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors, unnecessary_new, unused_import

import 'package:flutter/material.dart';
import 'musique.dart';
import 'package:audioplayers/audioplayers.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Coda Music',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.white),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Coda Musique'),
      debugShowCheckedModeBanner: false,
      
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

  List<Musique> maListMusique = [
    new Musique('Theme Swift', 'Codabee', 'assets/un.jpg', 'https://codabee.com/wp-content/uploads/2018/06/un.mp3'),
    new Musique('Theme Flutter', 'Codabee', 'assets/deux.jpg', 'https://codabee.com/wp-content/uploads/2018/06/deux.mp3'),
  ];

  Musique maMusiqueActuelle = new Musique('','','','');
  double position = 0.0;

  @override
  void initState(){
    super.initState();
    maMusiqueActuelle = maListMusique[0];
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.grey[900],
        title: Text(widget.title),
        
      ),
      backgroundColor: Colors.grey[800],
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            new Card(
              elevation: 90.0,
              child: new Container(
                width: MediaQuery.of(context).size.height / 2.5,
                child: new Image.asset(maMusiqueActuelle.imagePath),
              ),
            ),
            texteAvecStyle(maMusiqueActuelle.titre, 1.5),
            texteAvecStyle(maMusiqueActuelle.artiste, 1.0),
            new Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                button(Icons.fast_rewind, 30.0, ActionMusic.rewind),
                button(Icons.play_arrow, 45.0, ActionMusic.play),
                button(Icons.fast_forward, 30.0, ActionMusic.forward),
              ],
            ),
            new Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
                texteAvecStyle('0.0', 0.8),
                texteAvecStyle('0.22', 0.8)
              ],
            ),
            new Slider(
              value: position, 
              min: 0.0,
              max: 30.0,
              inactiveColor: Colors.white,
              activeColor: Colors.red,
              onChanged: (double d){
                setState(() {
                  position = d;
                });
              }
            )
          ],
        ),
      ),
    );
  }

  IconButton button(IconData icone, double taille, ActionMusic action){
    return new IconButton(
      iconSize: taille,
      color: Colors.white,
      icon: new Icon(icone),
      onPressed: () {
        switch(action){
          case ActionMusic.play:
            print('Play');
            break;
          case ActionMusic.pause:
            print('Pause');
            break;
          case ActionMusic.forward:
            print('Forward');
            break;
          case ActionMusic.rewind:
            print('Rewind');
            break;
          
        }
      });
  }

  Text texteAvecStyle(String data, double scale){
    return new Text(
      data,textScaleFactor: scale,
      textAlign: TextAlign.center,
      style: new TextStyle(
        color: Colors.white,
        fontSize: 20.0,
        fontStyle: FontStyle.italic
      ),
    );
  }
}

enum ActionMusic {
  play,
  pause,
  rewind,
  forward
}
