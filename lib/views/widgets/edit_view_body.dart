import 'package:flutter/material.dart';
import 'custom_app_bar.dart';
import 'custom_text_field.dart';

class EditViewBody extends StatelessWidget {
  const EditViewBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 24),
      child: Column(
        children: [
          SizedBox(height: 50,),
          CustomAppBar(title: 'Edit Notes', icon: Icons.check,),
          SizedBox(height: 50,),
          CustomTextField(
              hint: 'Title',
            maxLines: 1,
          ),
          SizedBox(height: 20,),
          CustomTextField(
              hint: 'Content',
            maxLines: 5,
          ),

        ],
      ),
    );
  }
}
