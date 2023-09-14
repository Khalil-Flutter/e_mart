import 'package:e_mart/views/screen/forget/verify_code.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

import '../../../../widgets/round_button.dart';
import '../../../../widgets/toast_message.dart';

class Body extends StatefulWidget {
  const Body({super.key});

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  TextEditingController emailController = TextEditingController();
  final auth = FirebaseAuth.instance;

  forget() {
    auth
        .sendPasswordResetEmail(
      email: emailController.text.toString(),
    )
        .then((value) {
      Utils().toastMessage(
          'We have sent you email to recover password, please check email');
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => const VerifyCodeScreen(),
        ),
      );
    }).onError((error, stackTrace) {
      Utils().toastMessage(error.toString());
    });
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: <Widget>[
          const Center(
            child: Text(
              "EssenceE-Mart",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.white,
                fontSize: 40,
              ),
            ),
          ),
          const SizedBox(
            height: 200,
          ),
          const SizedBox(
            width: 300,
            child: Text(
              "Enter your email we will send instruction to reset your password",
              style: TextStyle(
                fontSize: 22,
                color: Colors.white,
                height: 1.5,
              ),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          Column(
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 10.0),
                child: Container(
                  width: 360,
                  height: 65,
                  decoration: BoxDecoration(
                    color: Colors.grey[500]!.withOpacity(0.5),
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: Center(
                    child: TextFormField(
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                      ),
                      controller: emailController,
                      onTapOutside: (event) => FocusScope.of(context).unfocus(),
                      decoration: const InputDecoration(
                        hintText: "Email",
                        alignLabelWithHint: true,
                        hintStyle: TextStyle(
                          fontSize: 22,
                          color: Colors.grey,
                          fontWeight: FontWeight.bold,
                        ),
                        border: InputBorder.none,
                        prefixIcon: Padding(
                          padding: EdgeInsets.symmetric(horizontal: 20.0),
                          child: Icon(
                            Icons.email_outlined,
                            size: 28,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: RoundedButton(
                  text: "Send",
                  onTap: () {
                    forget();
                  },
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
