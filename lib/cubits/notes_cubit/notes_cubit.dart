import 'package:bloc/bloc.dart';
import 'package:hive/hive.dart';
import 'package:meta/meta.dart';

import '../../Constant.dart';
import '../../models/node_model.dart';

part 'notes_state.dart';

class NotesCubit extends Cubit<NotesState> {
  NotesCubit() : super(NotesInitial());

  fetchAllNotes(NodeModel note)async{
    try {
      var notesBox = Hive.box<NodeModel>(KNotesBox);
      List<NodeModel> notes = notesBox.values.toList();
      emit(NotesSuccess(notes));
    }catch(e) {
      emit(NotesFailure(e.toString()));
    }

  }
}
