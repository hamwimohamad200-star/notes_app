import 'package:flutter/material.dart' ;
import 'package:hive/hive.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:notes_app/Constant.dart';
import 'package:notes_app/views/notes_view.dart';

import 'models/node_model.dart';

void main() async{
  await Hive.initFlutter();
  await Hive.openBox(KNotesBox);
  Hive.registerAdapter(NodeModelAdapter());
  runApp(const NotesApp());
}

class NotesApp extends StatelessWidget {
  const NotesApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
          brightness: Brightness.dark,
          fontFamily: 'Poppins',
      ),

      home: const NotesView(),
    );
  }
}
