import 'package:e_mart/views/screen/login/components/forget_text.dart';
import 'package:e_mart/views/screen/login/components/login_with_google_text.dart';
import 'package:e_mart/views/screen/login/components/login_with_phone_text.dart';
import 'package:e_mart/views/screen/login/components/question_text.dart';
import 'package:e_mart/views/screen/phone/login_with_phone_screen.dart';
import 'package:e_mart/views/screen/sign_up/signup_screen.dart';
import 'package:e_mart/widgets/e_mart_text.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';

import '../../../../widgets/round_button.dart';
import '../../../../widgets/toast_message.dart';
import '../../../main_screens/home/home_screen.dart';
import '../../forget/forget_screen.dart';

class Body extends StatefulWidget {
  const Body({super.key});

  @override
  State<Body> createState() => _BodyState();
}

class _BodyState extends State<Body> {
  bool loading = false;
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final _auth = FirebaseAuth.instance;

  void login() {
    _auth
        .signInWithEmailAndPassword(
      email: emailController.text,
      password: passwordController.text.toString(),
    )
        .then((value) {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => const ProductScreen(),
        ),
      );
      setState(() {
        loading = true;
      });
    }).onError((error, stackTrace) {
      Utils().toastMessage(
        error.toString(),
      );
      setState(() {
        loading = true;
      });
    });
  }

  bool isValidEmail() {
    return RegExp(
            r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$')
        .hasMatch(emailController.text);
  }

  @override
  void dispose() {
    super.dispose();
    emailController.dispose();
    passwordController.dispose();
  }

  googleLogin() async {
    print("googleLogin method Called");
    GoogleSignIn _googleSignIn = GoogleSignIn();
    try {
      var reslut = await _googleSignIn.signIn();
      if (reslut == null) {
        return;
      }

      final userData = await reslut.authentication;
      final credential = GoogleAuthProvider.credential(
          accessToken: userData.accessToken, idToken: userData.idToken);
      var finalResult =
      await FirebaseAuth.instance.signInWithCredential(credential);
      print("Result $reslut");
      print(reslut.displayName);
      print(reslut.email);
      print(reslut.photoUrl);
    } catch (error) {
      print(error);
    }
  }
  Future<void> logout() async {
    await GoogleSignIn().disconnect();
    FirebaseAuth.instance.signOut();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        children: <Widget>[
          const Expanded(
            flex: 1,
            child: EMartText(),
          ),
          Expanded(
            flex: 2,
            child: SingleChildScrollView(
              child: Column(
                children: <Widget>[
                  Form(
                    key: formKey,
                    child: Column(
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.symmetric(
                            vertical: 10.0,
                            horizontal: 10,
                          ),
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
                                validator: (input) {
                                  if (input!.isEmpty) {
                                    return 'Please enter an email';
                                  }
                                  if (isValidEmail() == false) {
                                    return 'Please enter a valid email';
                                  }
                                  return null;
                                },
                                onTapOutside: (event) =>
                                    FocusScope.of(context).unfocus(),
                                decoration: const InputDecoration(
                                  hintText: "Email",
                                  alignLabelWithHint: true,
                                  hintStyle: TextStyle(
                                    fontSize: 22,
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                  ),
                                  border: InputBorder.none,
                                  prefixIcon: Padding(
                                    padding:
                                        EdgeInsets.symmetric(horizontal: 20.0),
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
                          padding: const EdgeInsets.symmetric(
                            vertical: 10.0,
                            horizontal: 10,
                          ),
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
                                obscureText: true,
                                controller: passwordController,
                                onTapOutside: (event) =>
                                    FocusScope.of(context).unfocus(),
                                keyboardType: TextInputType.visiblePassword,
                                validator: (value) {
                                  if (value!.isEmpty) {
                                    return 'Please enter a password';
                                  }
                                  if (value.length < 8) {
                                    return 'Password must be at least 8 characters';
                                  }
                                  return null;
                                },
                                decoration: const InputDecoration(
                                  hintText: "Password",
                                  alignLabelWithHint: true,
                                  hintStyle: TextStyle(
                                    fontSize: 22,
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                  ),
                                  border: InputBorder.none,
                                  prefixIcon: Padding(
                                    padding:
                                        EdgeInsets.symmetric(horizontal: 20.0),
                                    child: Icon(
                                      Icons.lock,
                                      size: 28,
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                        ForgetText(
                          text: "Forget Password",
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const ForgetScreen(),
                              ),
                            );
                          },
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: RoundedButton(
                            text: "Login",
                            loading: loading,
                            onTap: () {
                              if (formKey.currentState!.validate()) {
                                login();
                              }
                            },
                          ),
                        ),
                        QuestionText(
                          text: "SignUp",
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const SignUpScreen(),
                              ),
                            );
                          },
                        ),
                        LoginWithPhone(
                          text: "login with phone",
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) =>
                                    const LoginWithPhoneScreen(),
                              ),
                            );
                          },
                        ),
                        LoginWithGoogle(
                          text: "Login with Google",
                          onTap: () {
                            googleLogin();
                          },
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
