import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:sanal_lira/core/constant.dart';
import 'package:sanal_lira/core/route_names.dart';
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
  String ad = '';
  String soyad = '';
  String email = '';
  String phone = '';
  String password = '';

  final TextEditingController adController = TextEditingController();
  final TextEditingController soyadController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  bool showSpinner = false;

  void _trySubmitForm() async {
    if (emailController.text.isEmpty) {
      Fluttertoast.showToast(msg: "E-Mail Gerekli.", backgroundColor: kGreen);
    } else if (passwordController.text.isEmpty) {
      Fluttertoast.showToast(msg: "Şifre Gerekli.", backgroundColor: kGreen);
    } else {
      loginNow();
    }
  }

  loginNow() async {
    showDialog(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext c) {
          return const SmeProgressDialog(
            message: "Lütfen Bekleyiniz...",
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
        Fluttertoast.showToast(msg: "Giriş Başarılı.");
        Navigator.push(context, MaterialPageRoute(builder: (c) => const PageNavigator()));
      } else {
        Navigator.pop(context);
        Fluttertoast.showToast(msg: "Giriş Yaparken Hata Oluştu.", backgroundColor: kPrimaryColor);
      }
    }).catchError((msg) {
      Navigator.pop(context);
      Fluttertoast.showToast(msg: "Lütfen Bilgilerinizi kontrol edin.", backgroundColor: kPrimaryColor);
    });
  }

  @override
  void dispose() {
    adController.dispose();
    soyadController.dispose();
    emailController.dispose();
    phoneController.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBackgroundColor,
      body: Stack(
        alignment: Alignment.topCenter,
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
            color: const Color(0x00626772).withOpacity(0.75),
            width: double.infinity,
            height: double.infinity,
          ),
          Positioned(
            bottom: 650.0,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                SizedBox(
                  width: 59.0,
                  height: 59.0,
                  child: Image(
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
              children: [
                Container(
                  width: MediaQuery.of(context).size.width,
                  height: 300.0,
                  decoration: BoxDecoration(
                    color: const Color(0x00252d3d).withOpacity(0.7),
                    borderRadius:
                        const BorderRadius.only(topLeft: Radius.circular(40.0), topRight: Radius.circular(40.0)),
                  ),
                ),
                Positioned(
                  top: 0.0,
                  left: 0.0,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 31.0, left: 15.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text('SanaLira\'ya', style: TextStyle(fontSize: 16.0, color: kGreen)),
                            const Text(' Yeni Üyelik', style: TextStyle(fontSize: 16.0, color: Colors.white)),
                          ],
                        ),
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: kPaddingTextField2,
                            child: Text('E-posta', style: loginTextStyle),
                          ),
                          Padding(
                            padding: kPaddingTextField,
                            child: SizedBox(
                              width: 350.0,
                              height: 44.0,
                              child: TextFormField(
                                style: const TextStyle(color: Colors.white),
                                controller: emailController,
                                validator: (value) {
                                  if (value == null || value.trim().isEmpty) {
                                    return 'Lütfen A-posta Adresinizi Giriniz!';
                                  }
                                  return null;
                                },
                                onChanged: (value) {
                                  email = emailController.text;
                                },
                                decoration: kTextFieldInputDecoration('E-posta:'),
                              ),
                            ),
                          ),
                        ],
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: kPaddingTextField2,
                            child: Text('Şifre', style: loginTextStyle),
                          ),
                          Padding(
                            padding: kPaddingTextField,
                            child: SizedBox(
                              width: 350.0,
                              height: 44.0,
                              child: TextFormField(
                                style: const TextStyle(color: Colors.white),
                                controller: passwordController,
                                validator: (value) {
                                  if (value == null || value.trim().isEmpty) {
                                    return 'Lütfen Şifrenizi Giriniz!';
                                  }
                                  return null;
                                },
                                onChanged: (value) {
                                  password = passwordController.text;
                                },
                                decoration: kTextFieldInputDecoration('Şifreniz:'),
                              ),
                            ),
                          ),
                        ],
                      ),
                      RoundedButton(
                        'Giriş Yap',
                        _trySubmitForm,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 200.0),
                        child: InkWell(
                          onTap: () {
                            Navigator.of(
                              context,
                            ).pushReplacementNamed(
                              RouteNames.registerScreenRoute,
                            );
                          },
                          child: Text(
                            "Hesabınız yok mu? Hesap Aç",
                            textAlign: TextAlign.start,
                            style: TextStyle(
                              fontSize: 12.0,
                              color: const Color(0x00cfd4de).withOpacity(1.0),
                            ),
                          ),
                        ),
                      ),
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

  bool rememberMe = false;

  void onRememberMeChanged(bool? newValue) => setState(() {
        rememberMe = newValue!;
      });
}
