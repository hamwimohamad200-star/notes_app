import 'package:bloc/bloc.dart';
import 'package:flutter/services.dart';
import 'package:hive/hive.dart';
import 'package:meta/meta.dart';

import '../../Constant.dart';
import '../../models/node_model.dart';

part 'notes_state.dart';

class NotesCubit extends Cubit<NotesState> {
  NotesCubit() : super(NotesInitial());

  List<NodeModel>? notes ;
  List<NodeModel>? filteredNotes;
  String currentType = 'title';

  void changeType(String type){
    currentType = type ;
    emit(NotesSuccess());
  }
  void fetchAllNotes(){
      var notesBox = Hive.box<NodeModel>(KNotesBox);
      notes = notesBox.values.toList();
      emit(NotesSuccess());
  }
  void searchNote({required String query}){
    if (query.isEmpty)
      {
        filteredNotes = notes ;
      }
    else{
      filteredNotes = notes?.where((note) {
        String title = note.title.toLowerCase();
        String subtitle = note.subtitle.toLowerCase();
        if (currentType == 'content'){
          return subtitle.contains(query.toLowerCase());
        }
        else if(currentType == 'both'){
          return title.contains(query.toLowerCase()) || subtitle.contains(query.toLowerCase());
        }
        else{
          return title.contains(query.toLowerCase());
        }
      }).toList();
    }
    emit(NotesSuccess());
  }
}

