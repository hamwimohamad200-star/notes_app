import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';

import '../../cubits/add_note_cubit/add_note_cubit.dart';
import '../../models/node_model.dart';
import 'colors_list_view.dart';
import 'custom_button.dart';
import 'custom_text_field.dart';

class AddNoteForm extends StatefulWidget {
  const AddNoteForm({super.key});

  @override
  State<AddNoteForm> createState() => _AddNoteFormState();
}

class _AddNoteFormState extends State<AddNoteForm> {

  final GlobalKey<FormState> _formKey = GlobalKey();

  AutovalidateMode autoValidateMode = AutovalidateMode.disabled;

  String? title, subtitle;

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      autovalidateMode: autoValidateMode,
      child: Column(
        children: [
          SizedBox(height: 30,),
          CustomTextField(onSaved: (value) {title = value ;},hint: 'Title',),
          SizedBox(height: 16,),
          CustomTextField(onSaved: (value) {subtitle = value ;},hint: 'Content', maxLines: 5,),
          SizedBox(height: 16,),
          ColorsList(),
          BlocBuilder<AddNoteCubit, AddNoteState>(
            builder: (context, state) {
            return CustomButton(
            isLoading: state is AddNoteLoading ? true : false,
            onTap: (){
            if(_formKey.currentState!.validate())
            {
              _formKey.currentState!.save();
              var currentDate = DateTime.now();
              var formattedCurrentDate = DateFormat.yMEd().format(currentDate);
              var noteModel = NodeModel(
                  title: title!,
                  subtitle: subtitle!  ,
                  date: formattedCurrentDate,
                  color: Colors.blue.value
              );
              BlocProvider.of<AddNoteCubit>(context).addNote(noteModel);
            }
            else{
              autoValidateMode = AutovalidateMode.always;
              setState(() {

              });
            }},);
  },
),
          SizedBox(height: 16,),
        ],
      ),
    );
  }
}


