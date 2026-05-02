import 'package:flutter/material.dart';

import '../../Constant.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: 50,
      decoration: BoxDecoration(
        color: KPrimaryColor,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Center(
        child: Text("Add" , style: TextStyle(color: Colors.black , fontSize: 20 , fontWeight: FontWeight.bold ), ),
      ),
    );
  }
}
