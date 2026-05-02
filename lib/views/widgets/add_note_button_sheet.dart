import 'package:flutter/material.dart';
import 'package:notes_app/Constant.dart';

import 'custom_button.dart';
import 'custom_text_field.dart';

class AddNoteButtonSheet extends StatelessWidget {
  const AddNoteButtonSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16),
      child: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 30,),
            CustomTextField(hint: 'Title',),
            SizedBox(height: 16,),
            CustomTextField(hint: 'Content', maxLines: 5,),
            SizedBox(height: 16,),
            CustomButton(),
            SizedBox(height: 16,),
          ],
        ),
      ),
    );
  }
}
