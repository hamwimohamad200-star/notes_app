import 'package:flutter/material.dart';

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
          CustomTextField(onSaved: (value) {title = value ;},hint: 'Content', maxLines: 5,),
          SizedBox(height: 16,),
          CustomButton(onTap: (){
            if(_formKey.currentState!.validate())
            {
              _formKey.currentState!.save();
            }
            else{
              autoValidateMode = AutovalidateMode.always;
              setState(() {

              });
            }},),
          SizedBox(height: 16,),
        ],
      ),
    );
  }
}
