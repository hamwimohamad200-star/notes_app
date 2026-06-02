import 'package:bloc/bloc.dart';
import 'package:hive/hive.dart';
import 'package:meta/meta.dart';

import '../../Constant.dart';
import '../../models/node_model.dart';

part 'notes_state.dart';

class NotesCubit extends Cubit<NotesState> {
  NotesCubit() : super(NotesInitial());

  List<NodeModel>? notes ;
  fetchAllNotes()async{
      var notesBox = Hive.box<NodeModel>(KNotesBox);
      notes = notesBox.values.toList();

  }
}
