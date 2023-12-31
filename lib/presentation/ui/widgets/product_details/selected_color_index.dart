import 'package:flutter/material.dart';

class SelectedColorIndex extends StatefulWidget{
  const SelectedColorIndex({super.key});
  @override
  State<SelectedColorIndex> createState() => _SelectedColorIndex();
}
class _SelectedColorIndex extends State<SelectedColorIndex>{

  List<Color> colors = [
    Colors.deepOrange,
    Colors.amber,
    Colors.blue,
    Colors.yellow,
    Colors.pink,
    Colors.black,
  ];

  int _selectedColorIndex = 0;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 28,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemCount: colors.length,
        itemBuilder: (context, index) {
          return InkWell(
            borderRadius: BorderRadius.circular(20),
            onTap: () {
              _selectedColorIndex = index;
              if (mounted) {
                setState(() {});
              }
            },
            child: CircleAvatar(
              radius: 18,
              backgroundColor: colors[index],
              child: _selectedColorIndex == index
                  ? const Icon(
                Icons.done,
                color: Colors.white,
              )
                  : null,
            ),
          );
        },
        separatorBuilder: (BuildContext context, int index) {
          return const SizedBox(
            width: 8,
          );
        },
      ),
    );
  }
  }