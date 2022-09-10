import 'package:flutter/material.dart';
import 'package:rafe9ni/app/app_pref.dart';
import 'package:rafe9ni/app/di.dart';
import 'package:rafe9ni/home/MainScreen.dart';
import 'package:rafe9ni/login/loginServices.dart';

import 'package:shared_preferences/shared_preferences.dart';

import '../helpers/routes_manager.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final AppPreferences _appPreferences = instance<AppPreferences>();
  String? phone;
  String? password;
  String? error;

  var phoneNumberController = TextEditingController();
  var passwordController = TextEditingController();
  final _formKey = GlobalKey<FormState>();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          backgroundColor: Colors.white,
          body: Container(
            padding: const EdgeInsets.only(top: 20),
            child: SingleChildScrollView(
              child: Form(
                key: _formKey,
                child: Column(
                  children: [
                    Image.asset(
                      "assets/images/tt10.png",
                      width: MediaQuery.of(context).size.width * 0.4,
                      height: MediaQuery.of(context).size.height * 0.3,
                    ),
                    const SizedBox(height: 18),
                    const Text(
                      "الرجاء إدخال رقم هاتفك و كلمة العبور للدخول إلى فضاء رافقني",
                    ),
                    const SizedBox(height: 28),
                    Padding(
                      padding: const EdgeInsets.only(left: 28, right: 28),
                      child: Container(
                        margin: const EdgeInsets.symmetric(vertical: 10),
                        padding: const EdgeInsets.symmetric(
                            horizontal: 20, vertical: 5),
                        width: MediaQuery.of(context).size.width * 0.9,
                        height: MediaQuery.of(context).size.height * 0.08,
                        decoration: BoxDecoration(
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.8),
                              spreadRadius: 3,
                              blurRadius: 3,
                              offset: const Offset(
                                  0, 3), // changes position of shadow
                            ),
                          ],
                          color: Colors.grey[200],
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: TextFormField(
                          autofillHints: const [AutofillHints.telephoneNumber],
                          textInputAction: TextInputAction.next,
                          keyboardType: TextInputType.phone,
                          validator: (phoneNumberController) {
                            if (phoneNumberController == null ||
                                phoneNumberController.isEmpty) {
                              return 'Please enter some text';
                            }
                            return null;
                          },
                          onChanged: (val) {
                            phone = val;
                          },
                          controller: phoneNumberController,
                          decoration: const InputDecoration(
                              border: InputBorder.none,
                              icon: Icon(
                                Icons.phone,
                                color: Colors.grey,
                              ),
                              labelText: 'هاتف'),
                        ),
                      ),
                    ),
                    const SizedBox(height: 10),
                    Padding(
                      padding: const EdgeInsets.only(left: 28, right: 28),
                      child: Container(
                        margin: const EdgeInsets.symmetric(vertical: 10),
                        padding: const EdgeInsets.symmetric(
                            horizontal: 20, vertical: 5),
                        width: MediaQuery.of(context).size.width * 0.9,
                        height: MediaQuery.of(context).size.height * 0.08,
                        decoration: BoxDecoration(
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.8),
                              spreadRadius: 3,
                              blurRadius: 3,
                              offset: const Offset(
                                  0, 3), // changes position of shadow
                            ),
                          ],
                          color: Colors.grey[200],
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: TextFormField(
                          autofillHints: const [AutofillHints.telephoneNumber],
                          validator: (PasswordInputElement) {
                            if (passwordController == null) {
                              return 'الرجاء إدخال نص';
                            }
                            return null;
                          },
                          onChanged: (val) {
                            password = val;
                          },
                          controller: passwordController,
                          decoration: const InputDecoration(
                              border: InputBorder.none,
                              icon: Icon(
                                Icons.lock,
                                color: Colors.grey,
                              ),
                              labelText: 'كلمه السر'),
                        ),
                      ),
                    ),
                    TextButton(
                      onPressed: () {},
                      child: const Text(
                        "نسيت كلمة العبور ؟",
                      ),
                    ),
                    const SizedBox(height: 20),
                    Padding(
                        padding: const EdgeInsets.only(left: 28, right: 28),
                        child: SizedBox(
                          width: MediaQuery.of(context).size.width * 0.8,
                          height: MediaQuery.of(context).size.height * 0.1,
                          child: ElevatedButton(
                              style: ButtonStyle(
                                  shape: MaterialStateProperty.all<
                                          RoundedRectangleBorder>(
                                      RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(28.0),
                                  )),
                                  backgroundColor: MaterialStateProperty.all(
                                      Color(0xFF536DFE))),
                              onPressed: () async {
                                //
                                LoginServices()
                                    .login(phone, password)
                                    .then((value) {
                                  if (value.data!["lockout"] == false) {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                MainScreen()));
                                    _appPreferences.setIsUserLoggedIn();
                                    print('jawk behiiiiiiiiiiiiiiiiiiiioi');
                                  } else {
                                    setState(() {
                                      error = value.data!["erreur"];
                                    });
                                    ScaffoldMessenger.of(context)
                                        .showSnackBar(SnackBar(
                                      content: Text(error ?? ''),
                                    ));
                                  }
                                });
                              },
                              child: Center(
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: const [
                                    Icon(Icons.login),
                                    Text('دخول'),
                                  ],
                                ),
                              )),
                        )),
                    Image.asset(
                      'assets/images/pngegg.png',
                      width: MediaQuery.of(context).size.width * 0.8,
                      height: MediaQuery.of(context).size.height * 0.3,
                    ),
                    TextButton(
                      onPressed: () {},
                      child: const Text(
                        "لست مسجل بعد؟ تسجيل ",
                      ),
                    ),
                  ],
                ),
              ),
            ),
          )),
    );
  }
}
