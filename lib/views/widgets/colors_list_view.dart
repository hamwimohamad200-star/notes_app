import 'package:flutter/material.dart';

class ColorItem extends StatelessWidget {
  const ColorItem({super.key, required this.isSelected, required this.color});
  final bool isSelected ;
  final Color color ;
  @override
  Widget build(BuildContext context) {
    return isSelected ? CircleAvatar(
        radius: 38,
        backgroundColor: Colors.white,
      child: CircleAvatar(
        radius:28,
        backgroundColor: color,
      ),
    ) :
    CircleAvatar(
      radius: 38,
      backgroundColor: color,
    );
  }
}

class ColorsList extends StatefulWidget {
  const ColorsList({super.key});

  @override
  State<ColorsList> createState() => _ColorsListState();
}

class _ColorsListState extends State<ColorsList> {

  int selectedColor = 0 ;
  List<Color> colors = [
    Color(0xff262626),
    Color(0xfff7e9cc),
    Color(0xfffd7924),
    Color(0xfffbf6e3),
    Color(0xffAc3931),
    Color(0xffE5D352),
    Color(0xffD9E76c),
    Color(0xff537D8D),
    Color(0xff482C3D),
  ];
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 38*2,
      child: ListView.builder(
        itemCount: colors.length,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context,index) {
          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 6 , vertical: 8),
            child: GestureDetector(
              onTap: (){
                selectedColor = index ;
                setState(() {
                });
              },
              child: ColorItem(
                color : colors[index],
                isSelected: selectedColor == index ? true : false,
              ),
            ),
          );
        },
      ),
    );
  }
}