import 'package:flutter/material.dart';
import 'package:translator/translator.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => HomeState();
}

class HomeState extends State<Home> {
  GoogleTranslator transtlator = GoogleTranslator();

  String text = ("Hellow how are you. ");

  void translate() {
    transtlator.translate(text);
    transtlator.translate(text, to: 'hi').then((output) {
      setState(() {
        text = output as String;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Language Trnslation"),
      ),
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Column(
          children: [
            Text(text),
            ElevatedButton(
              onPressed: () {
                translate();
              },
              child: Icon(Icons.published_with_changes_sharp),
            )
          ],
        ),
      ),
    );
  }
}
