import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:sanal_lira/core/constant.dart';
import 'package:sanal_lira/core/route_names.dart';
import 'package:sanal_lira/global/global.dart';
import 'package:sanal_lira/screens/page_navigator.dart';
import 'package:sanal_lira/widgets/progress_dialog.dart';
import 'package:sanal_lira/widgets/rounded_button.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});

  @override
  State<RegisterScreen> createState() => RegisterScreenState();
}

class RegisterScreenState extends State<RegisterScreen> {
  String ad = '';
  String soyad = '';
  String email = '';
  String phone = '';
  String password = '';
  final FirebaseFirestore db = FirebaseFirestore.instance;

  final TextEditingController adController = TextEditingController();
  final TextEditingController soyadController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController phoneController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  bool showSpinner = false;

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
                  height: 550.0,
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
                      Padding(
                        padding: const EdgeInsets.only(top: 5.0, left: 15.0),
                        child: Text('Bilgilerinizi girip sözleşmeyi onaylayın.',
                            style: TextStyle(fontSize: 12.0, color: const Color(0x00cfd4de).withOpacity(1.0))),
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: kPaddingTextField2,
                            child: Text('Ad', style: loginTextStyle),
                          ),
                          Padding(
                            padding: kPaddingTextField,
                            child: SizedBox(
                              width: 350.0,
                              height: 44.0,
                              child: TextFormField(
                                style: const TextStyle(color: Colors.white),
                                controller: adController,
                                validator: (value) {
                                  if (value == null || value.trim().isEmpty) {
                                    return 'Lütfen Adınızı Giriniz!';
                                  }
                                  return null;
                                },
                                onChanged: (value) {
                                  ad = adController.text;
                                },
                                decoration: kTextFieldInputDecoration('Adınız:'),
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
                            child: Text('Soyad', style: loginTextStyle),
                          ),
                          Padding(
                            padding: kPaddingTextField,
                            child: SizedBox(
                              width: 350.0,
                              height: 44.0,
                              child: TextFormField(
                                style: const TextStyle(color: Colors.white),
                                controller: soyadController,
                                validator: (value) {
                                  if (value == null || value.trim().isEmpty) {
                                    return 'Lütfen Soyadınızı Giriniz!';
                                  }
                                  return null;
                                },
                                onChanged: (value) {
                                  soyad = soyadController.text;
                                },
                                decoration: kTextFieldInputDecoration('Soyadınız:'),
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
                            child: Text('Cep Telefon Numaranız', style: loginTextStyle),
                          ),
                          Padding(
                            padding: kPaddingTextField,
                            child: Row(
                              children: [
                                SizedBox(
                                  width: 85.0,
                                  height: 44.0,
                                  child: Container(
                                    alignment: Alignment.center,
                                    decoration: BoxDecoration(
                                      border: Border.all(color: Colors.white),
                                      borderRadius: const BorderRadius.all(Radius.circular(10.0)),
                                    ),
                                    child: Row(
                                      children: const [
                                        SizedBox(width: 8.0),
                                        SizedBox(
                                            width: 22,
                                            height: 22,
                                            child: Image(
                                              image: AssetImage('assets/images/turkey.png'),
                                            )),
                                        Text('+90', style: TextStyle(color: Colors.white)),
                                      ],
                                    ),
                                  ),
                                ),
                                const SizedBox(width: 5.0),
                                SizedBox(
                                  width: 260.0,
                                  height: 44.0,
                                  child: TextFormField(
                                    style: const TextStyle(color: Colors.white),
                                    controller: phoneController,
                                    validator: (value) {
                                      if (value == null || value.trim().isEmpty) {
                                        return 'Lütfen Cep Telefonu Numaranızı Giriniz!';
                                      }
                                      return null;
                                    },
                                    onChanged: (value) {
                                      phone = phoneController.text;
                                    },
                                    decoration: kTextFieldInputDecoration('Cep Telefonu:'),
                                  ),
                                ),
                              ],
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
                      Padding(
                        padding: const EdgeInsets.only(top: 15.0, left: 15.0),
                        child: Row(
                          children: [
                            SizedBox(
                              width: 20.0,
                              height: 10.0,
                              child: Checkbox(value: rememberMe, onChanged: onRememberMeChanged),
                            ),
                            const SizedBox(width: 8.0),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    const Text('Hesabınızı oluştururken ', style: kWhiteStyle),
                                    Text(
                                      'sözleşme ve koşulları',
                                      style: TextStyle(fontSize: 12.0, color: kGreen),
                                    ),
                                  ],
                                ),
                                const Text('kabul etmeniz gerekir.', style: kWhiteStyle),
                              ],
                            ),
                          ],
                        ),
                      ),
                      RoundedButton(
                        'Hesap Aç',
                        _trySubmitForm,
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 200.0),
                        child: InkWell(
                          onTap: () {
                            Navigator.of(
                              context,
                            ).pushReplacementNamed(
                              RouteNames.loginScreenRoute,
                            );
                          },
                          child: Text(
                            "Zaten Hesabım Var. Giriş Yap",
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

  bool validatePassword(String value) {
    RegExp regex = RegExp(r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$');
    if (value.isEmpty) {
      return false;
    } else if (regex.hasMatch(value)) {
      return false;
    } else {
      return true;
    }
  }

  saveUserInfoNow() async {
    showDialog(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext c) {
          return const SmeProgressDialog(
            message: "Lütfen Bekleyin...",
          );
        });

    User? firebaseUser;

    fAuth
        .createUserWithEmailAndPassword(
      email: emailController.text.trim(),
      password: passwordController.text.trim(),
    )
        .then((value) {
      firebaseUser = value.user;
      if (firebaseUser != null) {
        Fluttertoast.showToast(msg: "Account has been Created.", backgroundColor: kPrimaryColor);
        Navigator.push(context, MaterialPageRoute(builder: (c) => const PageNavigator()));
      } else {
        Navigator.pop(context);
        Fluttertoast.showToast(msg: "Account has not been Created.", backgroundColor: kPrimaryColor);
      }
    }).catchError((msg) {
      Navigator.pop(context);
      Fluttertoast.showToast(msg: "Error: $msg", backgroundColor: kPrimaryColor);
    });
  }

  void onRememberMeChanged(bool? newValue) => setState(() {
        rememberMe = newValue!;
      });
  void _trySubmitForm() async {
    if (adController.text.length < 3 || adController.text.length > 50) {
      Fluttertoast.showToast(
          msg: "Ad ve soyad bilgileri en az 3 en çok 50 harf olabilir.", backgroundColor: kPrimaryColor);
    } else if (soyadController.text.length < 3 || adController.text.length > 50) {
      Fluttertoast.showToast(
          msg: "Ad ve soyad bilgileri en az 3 en çok 50 harf olabilir.", backgroundColor: kPrimaryColor);
    } else if (!emailController.text.contains("@")) {
      Fluttertoast.showToast(msg: "Email addresi geçersiz.", backgroundColor: kPrimaryColor);
    } else if (phoneController.text.isEmpty) {
      Fluttertoast.showToast(msg: "Telefon nummarası gereklidir", backgroundColor: kPrimaryColor);
    } else if (passwordController.text.length < 6 ||
        passwordController.text.length > 20 ||
        validatePassword(passwordController.text.toString())) {
      Fluttertoast.showToast(msg: "Geçersiz Şifre.", backgroundColor: kPrimaryColor);
    } else {
      saveUserInfoNow();
    }
  }
}
