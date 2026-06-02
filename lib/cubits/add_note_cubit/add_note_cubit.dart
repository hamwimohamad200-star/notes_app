import 'package:bloc/bloc.dart';
import 'package:hive/hive.dart';
import 'package:meta/meta.dart';

import '../../Constant.dart';
import '../../models/node_model.dart';

part 'add_note_state.dart';

class AddNoteCubit extends Cubit<AddNoteState> {
  AddNoteCubit() : super(AddNoteInitial());

  addNote (NodeModel note)async{
    emit(AddNoteLoading());

    await Future.delayed(Duration(seconds: 2));
    try {
      var notesBox = Hive.box<NodeModel>(KNotesBox);
      emit(AddNoteSuccess());
      await notesBox.add(note);
    }catch(e) {
      emit(AddNoteFailure(e.toString()));
    }

  }
}
