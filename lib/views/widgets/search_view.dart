import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes_app/cubits/notes_cubit/notes_cubit.dart';

import 'custom_text_field.dart';
import 'note_item.dart';

class SearchView extends StatelessWidget {
  const SearchView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Search Page'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(bottom: 10 ),
              child: CustomTextField(
                hint: 'Search',
                maxLines: 1,
                onChanged: (value) {
                  BlocProvider.of<NotesCubit>(context).searchNote(query: value);
                },
                suffixIcon: PopupMenuButton<String>(
                  onSelected: (value) {
                    BlocProvider.of<NotesCubit>(context).changeType(value);
                  },
                  itemBuilder : (context) =>[
                    PopupMenuItem(
                      value: 'title',
                      child: Text('Title'),
                    ),
                    PopupMenuItem(
                      value: 'content',
                      child: Text('Content'),
                    ),
                    PopupMenuItem(
                      value: 'both',
                      child: Text('Both'),
                    ),
                  ]
                ),

              ),
            ),
            BlocBuilder<NotesCubit, NotesState>(
              builder: (context, state) {
                List notes = BlocProvider.of<NotesCubit>(context).filteredNotes ?? BlocProvider.of<NotesCubit>(context).notes ?? [];
                return Expanded(
                  child: ListView.builder(
                    itemCount: notes.length,
                    itemBuilder: (context , index){
                      return Padding(
                        padding: const EdgeInsets.only(bottom: 10 ),
                        child: NoteItem(
                          note: notes[index],
                          isReadOnly: true,
                        ),
                      );
                    },
                  ),
                );
              },
            )

          ],
        ),
      ),
    );
  }
}

