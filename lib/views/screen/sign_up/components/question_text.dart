import 'package:flutter/material.dart';

class QuestionText extends StatelessWidget {
  const QuestionText({
    super.key,
    required this.text,
    required this.onTap,
  });

  final String text;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        vertical: 20,
      ),
      child: InkWell(
        onTap: onTap,
        child: RichText(
          text: TextSpan(
            children: [
              const TextSpan(
                text: "Have an account? ",
                style: TextStyle(
                  fontSize: 18,
                ),
              ),
              TextSpan(
                text: text,
                style: const TextStyle(
                  fontSize: 18,
                  color: Colors.green,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
