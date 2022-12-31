import 'package:flutter/material.dart';
import 'package:sanal_lira/core/constant.dart';

class RoundedButton extends StatelessWidget {
  const RoundedButton(
    this.text,
    this.onPress, {
    super.key,
  });

  final String text;
  final VoidCallback onPress;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 15.0, right: 15.0, top: 15.0, bottom: 5.0),
      child: Container(
        decoration: BoxDecoration(borderRadius: BorderRadius.circular(10.0), color: kGreen),
        child: MaterialButton(
          onPressed: onPress,
          minWidth: 350.0,
          height: 47.0,
          child: Text(
            text,
            style: const TextStyle(
              fontFamily: 'Poppins',
              fontWeight: FontWeight.bold,
              color: Colors.white,
              fontSize: 14.0,
            ),
          ),
        ),
      ),
    );
  }
}
