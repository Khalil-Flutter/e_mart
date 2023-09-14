import 'package:e_mart/views/screen/sign_up/components/body.dart';
import 'package:flutter/material.dart';

import '../../../widgets/background_image.dart';
class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return  const Stack(
      children: [
        BackgroundImage(
          image: "assets/images/login_screen_bg.jpg",
        ),
        Scaffold(
          backgroundColor: Colors.transparent,
          body: Body(),
        ),
      ],
    );
  }
}
