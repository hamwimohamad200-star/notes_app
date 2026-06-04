import 'package:bloc/bloc.dart';
import 'package:hive/hive.dart';
import 'package:meta/meta.dart';
import 'package:flutter/material.dart';

import '../../Constant.dart';
import '../../models/node_model.dart';

part 'add_note_state.dart';

class AddNoteCubit extends Cubit<AddNoteState> {
  AddNoteCubit() : super(AddNoteInitial());

  Color color = Colors.blue;

  addNote (NodeModel note)async{

    note.color = color.value;
    emit(AddNoteLoading());

    await Future.delayed(Duration(seconds: 1));
    try {
      var notesBox = Hive.box<NodeModel>(KNotesBox);
      await notesBox.add(note);
      emit(AddNoteSuccess());
    }catch(e) {
      emit(AddNoteFailure(e.toString()));
    }

  }
}
