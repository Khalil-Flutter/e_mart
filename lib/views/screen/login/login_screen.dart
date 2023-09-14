

import 'package:flutter/material.dart';
import '../../../widgets/background_image.dart';
import '../login/components/body.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return const Stack(
      children: [
        BackgroundImage(
          image: "assets/images/login_screen_bg.jpg",
        ),
        Scaffold(
          backgroundColor: Colors.transparent,
          body: Body(),
        )
      ],
    );
  }
}
