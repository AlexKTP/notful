import 'package:audio_notes_manager/business/data/audio_note_repository.dart';
import 'package:audio_notes_manager/business/data/database_helper.dart';
import 'package:audio_notes_manager/business/model/audio_note.dart';
import 'package:audio_notes_manager/constants/constants.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: Constants.APP_NAME,
      theme: ThemeData.dark(),
      debugShowCheckedModeBanner: false,
      home: const MyHomePage(title: Constants.APP_NAME),
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
  showSnackBar() {
    var snackBar = SnackBar(
      content:
          const Text('Hello, I am here', style: TextStyle(color: Colors.black)),
      duration: const Duration(milliseconds: 500),
      backgroundColor: const Color(0xffa71e34),
      action:
          SnackBarAction(textColor: Colors.black, label: '', onPressed: () {}),
    );
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.transparent,
          toolbarTextStyle: GoogleFonts.specialElite(),
          titleTextStyle: GoogleFonts.specialElite(),
          title: Center(
            child: Text(
              widget.title,
              textAlign: TextAlign.center,
              style: GoogleFonts.specialElite(
                fontSize: 17,
                color: Colors.black45,
              ),
            ),
          ),
          actions: <Widget>[
            IconButton(
              icon: const Icon(
                Icons.search,
                color: Colors.black,
              ),
              onPressed: () => {},
            ),
          ]),
      body: SafeArea(
          child: Material(
        elevation: 10,
        child: Container(
          margin: const EdgeInsets.fromLTRB(20, 20, 20, 20),
          alignment: Alignment.center,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(40),
              border: Border.all(color: Colors.black26, width: 3)),
          child: const Text(
            "test",
            style: TextStyle(fontSize: 32, color: Colors.white),
            textAlign: TextAlign.center,
          ),
        ),
      )),
      floatingActionButton: FloatingActionButton(
        backgroundColor: ThemeData.dark().canvasColor,
        elevation: 8,
        onPressed: () => showSnackBar(),
        tooltip: 'Save',
        child: const Icon(Icons.radio_button_checked, color: Colors.red),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
