import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:notes_app/cubits/notes_cubit/notes_cubit.dart';
import '../../models/node_model.dart';
import 'custom_app_bar.dart';
import 'custom_text_field.dart';

class EditViewBody extends StatefulWidget {
  const EditViewBody({super.key, required this.note});

  final NodeModel note;

  @override
  State<EditViewBody> createState() => _EditViewBodyState();
}

class _EditViewBodyState extends State<EditViewBody> {

  String? title , subTitle ;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: Column(
        children: [
          SizedBox(height: 50,),
          CustomAppBar(onPressed: () {
            widget.note.title = title ?? widget.note.title;
            widget.note.subtitle = subTitle ?? widget.note.subtitle;
            BlocProvider.of<NotesCubit>(context).fetchAllNotes();
            widget.note.save();

            Navigator.pop(context);

          }, title: 'Edit Notes', icon: Icons.check,),
          SizedBox(height: 50,),
          CustomTextField(
            onChanged: (value){
              title = value ;
            },
            hint: widget.note.title,
            maxLines: 1,
          ),
          SizedBox(height: 20,),
          CustomTextField(
            onChanged:(value) {
              subTitle = value;
            },
            hint: widget.note.subtitle,
            maxLines: 4,
          ),

        ],
      ),
    );
  }
}
