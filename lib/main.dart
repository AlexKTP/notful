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
      title: 'Notful',
      theme: ThemeData.dark(),
      debugShowCheckedModeBanner: false,
      home: const MyHomePage(title: 'Notful'),
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

  showSnackBar(){
    var snackBar = SnackBar(content: const Text('Hello, I am here',
      style: TextStyle(color: Colors.black)),
      duration: const Duration(milliseconds: 500),
      backgroundColor: const Color(0xffFFE6A7),
      action: SnackBarAction(
      textColor: Colors.black, label: '', onPressed: () {  }),);
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
        title: Center(child:Text(widget.title, textAlign: TextAlign.center, style: GoogleFonts.specialElite(fontSize: 17, color: const Color(0xffFFE6A7)),)),
          actions: <Widget>[IconButton(icon: const Icon(Icons.search, color:Color(0xffFFE6A7) ,),onPressed: ()=>{},),
      ]),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'You have pushed the button this many times:',
              style: GoogleFonts.specialElite(),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: const Color(0xffFFE6A7),
        onPressed: ()=> showSnackBar(),
        tooltip: 'Save',
        child: const Icon(Icons.add),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
