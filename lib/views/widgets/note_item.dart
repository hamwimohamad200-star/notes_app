import 'package:flutter/material.dart';

class NoteItem extends StatelessWidget {
  const NoteItem({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(top: 24, bottom: 24),
      decoration: BoxDecoration(
        color: Colors.amberAccent,
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          ListTile(
            title: Text('Flutter tips',style: TextStyle(color: Colors.black,fontSize: 26),),
            subtitle: Padding(
              padding: const EdgeInsets.only(top: 16 , bottom: 10),
              child: Text('Build your career with Tharwat sami' , style: TextStyle(color:  Colors.black.withOpacity(.4) , fontSize: 20),),
            ),
            trailing: IconButton(onPressed: (){}, icon: Icon(Icons.delete) , color: Colors.black, iconSize: 30,),
          ),
          Padding(
            padding: EdgeInsets.only(right: 24),
            child: Text(
              'May 20, 2023',
              style: TextStyle(
                  fontSize: 16,
                  color: Colors.black.withOpacity(.4)
              ),
            ),
          ),
        ],
      ),
    );
  }
}