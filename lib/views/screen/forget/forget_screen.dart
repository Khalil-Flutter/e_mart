import 'package:e_mart/views/screen/forget/components/body.dart';
import 'package:flutter/material.dart';

import '../../../widgets/background_image.dart';

class ForgetScreen extends StatelessWidget {
  const ForgetScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        const BackgroundImage(
          image: "assets/images/login_screen_bg.jpg",
        ),
        Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.transparent,
            elevation: 0,
            leading: IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: const Icon(
                Icons.arrow_back_ios,
              ),
            ),
            title: const Text(
              "Forget Password",
              style: TextStyle(
                fontSize: 22,
                color: Colors.white,
                height: 1.5,
              ),
            ),
            centerTitle: true,
          ),
          backgroundColor: Colors.transparent,
          body: const Body(),
        )
      ],
    );
  }
}
