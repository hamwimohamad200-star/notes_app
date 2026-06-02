import 'package:flutter/material.dart';

import '../../models/node_model.dart';
import 'edit_note_view.dart';

class NoteItem extends StatelessWidget {
  const NoteItem({super.key, required this.note});

  final NodeModel note ;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: (){
        Navigator.push(context , MaterialPageRoute(builder: (context) => EditNoteView(),));
      },
      child: Container(
        padding: const EdgeInsets.only(top: 24, bottom: 24),
        decoration: BoxDecoration(
          color: Color(note.color),
          borderRadius: BorderRadius.circular(16),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.end,
          children: [
            ListTile(
              title: Text(note.title,style: TextStyle(color: Colors.black,fontSize: 26),),
              subtitle: Padding(
                padding: const EdgeInsets.only(top: 16 , bottom: 10),
                child: Text(note.subtitle , style: TextStyle(color:  Colors.black.withOpacity(.4) , fontSize: 20),),
              ),
              trailing: IconButton(onPressed: (){}, icon: Icon(Icons.delete) , color: Colors.black, iconSize: 30,),
            ),
            Padding(
              padding: EdgeInsets.only(right: 24),
              child: Text(
                note.date,
                style: TextStyle(
                    fontSize: 16,
                    color: Colors.black.withOpacity(.4)
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}