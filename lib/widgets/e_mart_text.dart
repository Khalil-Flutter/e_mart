import 'package:flutter/material.dart';
class EMartText extends StatelessWidget {
  const EMartText({super.key});

  @override
  Widget build(BuildContext context) {
    return const Flexible(
      child: Center(
        child: Text(
          "EssenceE-Mart",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.white,
            fontSize: 40,
          ),
        ),
      ),
    );
  }
}
