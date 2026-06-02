part of 'notes_cubit.dart';

@immutable
sealed class NotesState {}

final class NotesInitial extends NotesState {}

final class AddNoteLoading extends NotesState {}
final class AddNoteSuccess extends NotesState {

  final List<NodeModel> notes;

  AddNoteSuccess(this.notes);
}
final class AddNoteFailure extends NotesState {
  final String errMessage;

  AddNoteFailure(this.errMessage);
}