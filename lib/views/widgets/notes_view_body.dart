import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes_app/views/widgets/search_view.dart';

import '../../cubits/notes_cubit/notes_cubit.dart';
import 'custom_app_bar.dart';
import 'note_item.dart';
import 'notes_list_view.dart';

class NotesViewBody extends StatefulWidget {
  const NotesViewBody({super.key});

  @override
  State<NotesViewBody> createState() => _NotesViewBodyState();
}

class _NotesViewBodyState extends State<NotesViewBody> {

  @override
  void initState() {
    super.initState();
    BlocProvider.of<NotesCubit>(context).fetchAllNotes();
  }
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 22),
      child: Column(
        children: [
          SizedBox(height:50),
          CustomAppBar(title: 'Notes', icon: Icons.search , onPressed: (){
            Navigator.push(
              context,
            MaterialPageRoute(builder: (context) => SearchView()),
            );
          }
          ),
          Expanded(child: NotesListView()),
        ],
      ),
    );
  }
}





