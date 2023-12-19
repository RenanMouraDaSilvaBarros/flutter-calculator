import 'package:flutter/material.dart';

class DigitButton extends StatelessWidget {
  final String number;
  final Color color;

  final ValueChanged<String> onChanged;

  const DigitButton(
      {Key? key,
      required this.number,
      required this.color,
      required this.onChanged})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        onChanged(number);
      },
      child: CircleAvatar(
        backgroundColor: color,
        radius: MediaQuery.of(context).size.height * 0.054,
        child:
            Text(number, style: const TextStyle(fontSize: 40, color: Colors.white)),
      ),
    );
  }
}
