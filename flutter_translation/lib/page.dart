// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';
import 'package:translator/translator.dart';

class FlutterTranslation extends StatefulWidget {
  const FlutterTranslation({Key? key}) : super(key: key);

  @override
  State<FlutterTranslation> createState() => _FlutterTranslationState();
}

class _FlutterTranslationState extends State<FlutterTranslation> {
  String translated = 'Translation';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Color(0xff323232),
        leading: Icon(
          Icons.navigate_before,
          size: 30,
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 25.0),
            child: Icon(Icons.translate),
          ),
        ],
        title: Text('E - Dictionary'),
      ),
      body: Card(
        color: Color(0xff323232),
        margin: EdgeInsets.all(12),
        child: ListView(
          padding: EdgeInsets.all(20),
          children: [
            Text(
              'English (US)',
              style: TextStyle(color: Colors.white),
            ),
            SizedBox(
              height: 8,
            ),
            TextField(
              style: TextStyle(
                fontSize: 36,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
              onChanged: (text) async {
                final translation = await text.translate(
                  from: 'en',
                  to: 'id',
                );

                setState(() {
                  translated = translation.text;
                });
              },
              decoration: InputDecoration(
                hintText: 'Enter Text',
                hintStyle: TextStyle(color: Colors.white),
                hoverColor: Colors.white,
                fillColor: Colors.white,
              ),
            ),
            Divider(
              height: 32,
            ),
            Text(
              'Indonesia (ID)',
              style: TextStyle(color: Colors.white),
            ),
            Text(
              translated,
              style: TextStyle(
                fontSize: 36,
                color: Color.fromARGB(255, 96, 243, 96),
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
