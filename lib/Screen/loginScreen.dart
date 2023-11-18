import 'package:expencetracker/Functions/authfunction.dart';
import 'package:expencetracker/main.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:lottie/lottie.dart';

class AuthScreen extends ConsumerStatefulWidget {
  const AuthScreen({super.key});

  @override
  ConsumerState<AuthScreen> createState() => _AuthScreenState();
}

class _AuthScreenState extends ConsumerState<AuthScreen> {
  final _formkey = GlobalKey<FormState>();
  // final _emailcontroller = TextEditingController();
  // final _passwordcontroller = TextEditingController();
  //final _usernamecontroller = TextEditingController();
  bool islogin = false;
  String email = '';
  String password = '';
  String username = '';
  var _isSending = false;

  usernameGet(String value, WidgetRef ref) {
    ref.read(nameProvider.notifier).update((state) => value);
  }

  emailGet(String value, WidgetRef ref) {
    ref.read(emailProvider.notifier).update((state) => value);
  }

  @override
  Widget build(BuildContext context) {
    var maincontent = Container(
      child: Form(
        key: _formkey,
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const SizedBox(
                height: 100,
              ),
              const Text(
                'Expense Tracker',
                style: TextStyle(
                  fontFamily: 'outfit',
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 28,
                ),
              ),
              //Image.asset("assets/images/logo.png" ),
              const SizedBox(
                height: 100,
              ),
              !islogin
                  ? SizedBox(
                      height: 45,
                      width: 315,
                      child: TextFormField(
                        // controller:  _usernamecontroller,
                        key: const ValueKey('username'),
                        validator: (value) {
                          if (value.toString().length < 3) {
                            return 'username to small';
                          } else {
                            return null;
                          }
                        },
                        //onFieldSubmitted: (value) => onSubmit(value, ref),
                        onSaved: (value) {
                          setState(() {
                            username = value!;
                          });
                          return usernameGet(username, ref);
                        },

                        textAlign: TextAlign.justify,
                        keyboardType: TextInputType.emailAddress,
                        textInputAction: TextInputAction.next,
                        cursorColor: Colors.cyan,

                        decoration: const InputDecoration(
                            filled: true,
                            isDense: true,
                            icon: Icon(FontAwesomeIcons.user),
                            border: OutlineInputBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(14)),
                                borderSide: BorderSide(color: Colors.cyan)),
                            hintText: "UserName",
                            hoverColor: Colors.white,
                            hintStyle: TextStyle(
                                fontFamily: 'outfit', color: Colors.white)),
                      ),
                    )
                  : const SizedBox(
                      height: 10,
                    ),
              const SizedBox(
                height: 10,
              ),
              SizedBox(
                height: 45,
                width: 315,
                child: TextFormField(
                  key: const ValueKey('email'),
                  validator: (value) {
                    if (!(value.toString().contains('@'))) {
                      return 'Enter valid Email';
                    } else {
                      return null;
                    }
                  },
                  onSaved: (value) {
                    setState(() {
                      email = value!;
                      emailGet(email, ref);
                    });
                  },
                  textAlign: TextAlign.justify,
                  //controller: _emailcontroller,
                  keyboardType: TextInputType.emailAddress,
                  textInputAction: TextInputAction.next,
                  cursorColor: Colors.cyan,
                  decoration: const InputDecoration(
                      filled: true,
                      icon: Icon(Icons.email_outlined),
                      isCollapsed: false,
                      isDense: true,
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(14)),
                          borderSide: BorderSide(color: Colors.cyan)),
                      hintText: "Email",
                      hintStyle:
                          TextStyle(fontFamily: 'outfit', color: Colors.white)),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              SizedBox(
                height: 45,
                width: 315,
                child: TextFormField(
                  key: const ValueKey('password'),
                  validator: (value) {
                    if (value.toString().length < 5) {
                      return 'password to small';
                    } else {
                      return null;
                    }
                  },
                  onSaved: (value) {
                    setState(() {
                      password = value!;
                    });
                  },
                  textAlign: TextAlign.justify,
                  // controller: _passwordcontroller,
                  obscureText: true,
                  decoration: const InputDecoration(
                      filled: true,
                      isDense: true,
                      icon: Icon(Icons.password),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(14)),
                          borderSide: BorderSide(color: Colors.cyan)),
                      hintText: "Password",
                      hintStyle:
                          TextStyle(fontFamily: 'outfit', color: Colors.white)),
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              SizedBox(
                height: 65,
                width: double.infinity,
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: OutlinedButton(
                    onPressed: () {
                      if (_formkey.currentState!.validate()) {
                        _formkey.currentState!.save();
                        islogin
                            ? SignIn(email, password)
                            : Signup(email, password);
                      }
                      setState(() {
                        _isSending = true;
                      });
                    },
                    style: OutlinedButton.styleFrom(
                        backgroundColor: Colors.black,
                        shape: const RoundedRectangleBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(14)))),
                    child: !islogin
                        ? const Text(
                            "SignUp",
                            style: TextStyle(
                              fontFamily: 'outfit',
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              //fontSize: 15
                            ),
                          )
                        : const Text("LOGIN",
                            style: TextStyle(
                              fontFamily: 'outfit',
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                            )),
                  ),
                ),
              ),
              TextButton(
                  onPressed: () {
                    setState(() {
                      islogin = !islogin;
                    });
                  },
                  child: islogin
                      ? const Text(
                          "Don't have an account?",
                          style: TextStyle(color: Colors.blue),
                        )
                      : const Text(
                          "Have an account?",
                          style: TextStyle(color: Colors.blue),
                        )),
              const Divider(
                color: Colors.white60,
                height: 10,
                indent: 22,
                endIndent: 22,
              ),
              const SizedBox(
                height: 12,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  InkWell(
                    onTap: () {},
                    child: Container(
                      height: 50,
                      alignment: Alignment.center,
                      width: 60,
                      decoration: BoxDecoration(
                          borderRadius:
                              const BorderRadius.all(Radius.elliptical(40, 40)),
                          border: Border.all(color: Colors.white)),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: FaIcon(
                          FontAwesomeIcons.googlePlusG,
                          size: 32,
                          color: Theme.of(context).colorScheme.onBackground,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    width: 80,
                  ),
                  InkWell(
                    onTap: () {},
                    child: Container(
                      height: 50,
                      alignment: Alignment.center,
                      width: 60,
                      decoration: BoxDecoration(
                          borderRadius:
                              const BorderRadius.all(Radius.elliptical(40, 40)),
                          border: Border.all(color: Colors.white)),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: FaIcon(
                          FontAwesomeIcons.facebookF,
                          size: 32,
                          color: Theme.of(context).colorScheme.onBackground,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              Lottie.asset(
                "assets/images/f.json",
                reverse: true,
                repeat: true,
                height: 190,
              )
            ],
          ),
        ),
      ),
    );
    if (_isSending) {
      maincontent = Container(
          alignment: Alignment.center,
          child: const CircularProgressIndicator(
            color: Colors.amber,
            backgroundColor: Colors.white,
          ));
    }
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.black,
        body: maincontent,
      ),
    );
  }
}
