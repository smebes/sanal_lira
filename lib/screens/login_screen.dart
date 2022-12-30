import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:sanal_lira/core/constant.dart';
import 'package:sanal_lira/core/route_names.dart';
import 'package:sanal_lira/core/utils.dart';
import 'package:sanal_lira/global/global.dart';
import 'package:sanal_lira/screens/page_navigator.dart';
import 'package:sanal_lira/widgets/progress_dialog.dart';
import 'package:sanal_lira/widgets/rounded_button.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  String email = '';
  String password = '';

  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  bool showSpinner = false;

  void _trySubmitForm() async {
    if (passwordController.text.isEmpty) {
      Fluttertoast.showToast(msg: "Password is required.", backgroundColor: kPrimaryColor);
    } else {
      loginDriverNow();
    }
  }

  loginDriverNow() async {
    showDialog(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext c) {
          return const SmeProgressDialog(
            message: "Processing, Please wait...",
          );
        });

    User? firebaseUser;
    fAuth
        .signInWithEmailAndPassword(
      email: emailController.text.trim(),
      password: passwordController.text.trim(),
    )
        .then((value) {
      firebaseUser = value.user;

      if (firebaseUser != null) {
        Fluttertoast.showToast(msg: "Login Successful.");
        Navigator.push(context, MaterialPageRoute(builder: (c) => const PageNavigator()));
      } else {
        Navigator.pop(context);
        Fluttertoast.showToast(msg: "Error Occurred during Login.", backgroundColor: kPrimaryColor);
      }
    }).catchError((msg) {
      Navigator.pop(context);
      Fluttertoast.showToast(msg: "Please verify your credentials", backgroundColor: kPrimaryColor);
    });
  }

  @override
  void dispose() {
    emailController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBackgroundColor,
      body: Stack(
        children: [
          const SizedBox(
            width: double.infinity,
            height: double.infinity,
            child: Image(
              fit: BoxFit.fill,
              image: AssetImage('assets/images/arkaplan.png'),
            ),
          ),
          Container(
            color: const Color.fromARGB(170, 98, 103, 114),
            width: double.infinity,
            height: double.infinity,
          ),
          Padding(
            padding: const EdgeInsets.only(top: 100.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                SizedBox(
                  width: 59.0,
                  height: 59.0,
                  child: Image(
                    // fit: BoxFit.fitWidth,
                    image: AssetImage('assets/images/logo.png'),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(11.0),
                  child: Text(
                    'SanaLira',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 21.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Positioned(
            bottom: 0.0,
            left: 0.0,
            child: Stack(
              alignment: Alignment.topCenter,
              children: [
                // Positioned(
                //   bottom: 0.0,
                //   left: 0.0,
                // child:
                Container(
                  width: MediaQuery.of(context).size.width,
                  height: 502.0,
                  decoration: const BoxDecoration(
                    color: Color.fromARGB(225, 98, 103, 114),
                    borderRadius: BorderRadius.only(topLeft: Radius.circular(40.0), topRight: Radius.circular(40.0)),
                  ),
                ),
                // ),
                Positioned(
                  top: 0.0,
                  left: 0.0,
                  child:
                      // Container(
                      //   color: Colors.red,
                      //   width: 100,
                      //   height: 100,
                      // )
                      Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Center(
                        child: Text('Login', style: kTitleStyle),
                      ),
                      const SizedBox(
                        height: 20.0,
                      ),
                      const SizedBox(
                        height: 10.0,
                      ),
                      // TextField(
                      //   // controller: emailController,
                      //   // validator: (value) {
                      //   //   if (value == null || value.trim().isEmpty) {
                      //   //     return 'Please enter an email!';
                      //   //   }

                      //   //   return null;
                      //   // },
                      //   onChanged: (value) {
                      //     email = emailController.text;
                      //   },
                      //   keyboardType: TextInputType.emailAddress,
                      //   textAlign: TextAlign.center,
                      //   decoration: kTextFieldInputDecoration.copyWith(hintText: 'E-mail'),
                      // ),
                      // const SizedBox(
                      //   height: 20.0,
                      // ),
                      // TextField(
                      //     controller: passwordController,
                      //     // validator: (value) {
                      //     //   if (value == null || value.trim().isEmpty) {
                      //     //     return 'Please enter your password!';
                      //     //   }
                      //     //   return null;
                      //     // },
                      //     // onChanged: (value) {
                      //     //   password = passwordController.text;
                      //     // },
                      //     // obscureText: true,
                      //     textAlign: TextAlign.center,
                      //     decoration: kTextFieldInputDecoration.copyWith(
                      //         hintText: 'Password', prefixIcon: const Icon(Icons.lock_outlined, color: kPrimaryColor))),
                      // const SizedBox(
                      //   height: 10.0,
                      // ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          InkWell(
                              onTap: () {
                                // Navigator.of(
                                //   context,
                                // ).pushReplacementNamed(
                                //   RouteNames.forgotPasswordScreenRoute,
                                // );
                              },
                              child: const Text('Forgot Password? ',
                                  textAlign: TextAlign.start,
                                  style: TextStyle(
                                      color: kTypicalTextColor,
                                      fontSize: 15,
                                      fontFamily: 'Poppins-Regular',
                                      decoration: TextDecoration.none))),
                        ],
                      ),
                      RoundedButton(
                        'Login',
                        _trySubmitForm,
                      ),
                      InkWell(
                          onTap: () {
                            Navigator.of(
                              context,
                            ).pushReplacementNamed(
                              RouteNames.registerScreenRoute,
                            );
                          },
                          child: const Text(
                            "Don't have an Account? Register",
                            textAlign: TextAlign.start,
                            style: TextStyle(fontSize: 18, color: kTypicalTextColor, fontFamily: 'Poppins'),
                          )),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
