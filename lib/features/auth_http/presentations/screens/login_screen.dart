import 'package:dio_logic_api/features/auth_http/data/models/login_model.dart';
import 'package:dio_logic_api/features/auth_http/data/repositories/api_repository.dart';
import 'package:flutter/material.dart';

import '../widgets/progress_indicator.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final scalffoldKey = GlobalKey<ScaffoldState>();
  GlobalKey<FormState> globalKey = GlobalKey<FormState>();
  bool hidePassword = true;
  late String email;
  late String password;
  bool isApiProgressCall = false;
  ApiRepository apiRepository = ApiRepository();

  @override
  build(BuildContext content) {
    return ProgressHUD(
      inAsyncCall: isApiProgressCall,
      opacity: 0.3,
      child: _uiSteup(context),
    );
  }

  Widget _uiSteup(BuildContext context) {
    return Scaffold(
      key: scalffoldKey,
      backgroundColor: const Color.fromARGB(255, 212, 94, 86),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              children: [
                Container(
                  width: double.infinity,
                  padding: const EdgeInsets.symmetric(
                    vertical: 30,
                    horizontal: 20,
                  ),
                  margin: const EdgeInsets.symmetric(
                    vertical: 85,
                    horizontal: 20,
                  ),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Theme.of(context).primaryColor,
                      boxShadow: [
                        BoxShadow(
                          color: Theme.of(context).hintColor.withOpacity(0.2),
                          offset: const Offset(0, 10),
                          blurRadius: 20,
                        ),
                      ]),
                  child: Form(
                    key: globalKey,
                    child: Column(
                      children: [
                        const SizedBox(
                          height: 25,
                        ),
                        Text(
                          'login',
                          style: Theme.of(context).textTheme.headlineLarge,
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        TextFormField(
                          keyboardType: TextInputType.emailAddress,
                          validator: (value) => !value!.contains('@')
                              ? 'Email should be valid'
                              : null,
                          style: TextStyle(color: Theme.of(context).hintColor),
                          // onSaved: (value) {
                          //   email = value!;
                          // },
                          onChanged: (value) {
                            setState(() {
                              email = value;
                            });
                          },
                          decoration: InputDecoration(
                            hintText: "email Address",
                            enabledBorder: UnderlineInputBorder(
                              borderSide: BorderSide(
                                color: Colors.red.withOpacity(0.2),
                              ),
                            ),
                            focusedBorder: const UnderlineInputBorder(
                              borderSide: BorderSide(
                                color: Colors.red,
                              ),
                            ),
                            prefixIcon: const Icon(
                              Icons.email,
                              color: Colors.red,
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        TextFormField(
                          keyboardType: TextInputType.text,
                          validator: (value) => value!.length < 3
                              ? 'Email should be valid'
                              : null,
                          obscureText: hidePassword,
                          style: TextStyle(color: Theme.of(context).hintColor),
                          // onSaved: (value) {
                          //   password = value!;
                          // },
                          onChanged: (value) {
                            setState(() {
                              password = value;
                            });
                          },
                          decoration: InputDecoration(
                            hintText: "Password",
                            enabledBorder: UnderlineInputBorder(
                              borderSide: BorderSide(
                                color: Colors.red.withOpacity(0.2),
                              ),
                            ),
                            focusedBorder: const UnderlineInputBorder(
                              borderSide: BorderSide(
                                color: Colors.red,
                              ),
                            ),
                            prefixIcon: const Icon(
                              Icons.lock,
                              color: Colors.red,
                            ),
                            suffixIcon: IconButton(
                              onPressed: () {
                                setState(() {
                                  hidePassword = !hidePassword;
                                });
                              },
                              color: Colors.red,
                              icon: Icon(hidePassword
                                  ? Icons.visibility_off
                                  : Icons.visibility),
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 25,
                        ),
                        ElevatedButton(
                          onPressed: () {
                            // print('VOICI ${email}  ${password}');
                            if (formvalidateAndSave()) {
                              setState(() {
                                isApiProgressCall = true;
                              });

                              var loginRequestModel = LoginRequestModel(
                                email: email,
                                password: password,
                              );
                              apiRepository.login(loginRequestModel).then(
                                (value) {
                                  setState(() {
                                    isApiProgressCall = false;
                                  });

                                  if (value.token.isNotEmpty) {
                                    const snackBar = SnackBar(
                                        content: Text("Login Successful"));
                                    ScaffoldMessenger.of(context).showSnackBar(
                                      snackBar,
                                    );
                                  } else {
                                    final snackBar =
                                        SnackBar(content: Text(value.error));
                                    ScaffoldMessenger.of(context).showSnackBar(
                                      snackBar,
                                    );
                                  }
                                },
                              ).catchError((e) {
                                setState(() {
                                  isApiProgressCall = false;
                                });

                                // Gérer l'erreur ici, par exemple afficher un SnackBar
                                const snackBar = SnackBar(
                                    content:
                                        Text("Erreur lors de la connexion"));
                                ScaffoldMessenger.of(context)
                                    .showSnackBar(snackBar);

                                // Vous pouvez également imprimer l'erreur dans la console
                                print("Erreur lors de la connexion : $e");
                              });

                              // print(loginRequestModel.toJson());
                              // print('ONCHANGED:${email}');
                            }
                          },
                          style: ElevatedButton.styleFrom(
                            backgroundColor: const Color.fromARGB(
                                255, 212, 94, 86), // Couleur de fond rouge
                            foregroundColor:
                                Colors.white, // Couleur du texte blanc
                            padding: const EdgeInsets.symmetric(
                              vertical: 12,
                              horizontal: 80,
                            ), // Padding vertical et horizontal
                          ),
                          child: const Text(
                            "login",
                            style: TextStyle(color: Colors.white, fontSize: 16),
                          ),
                        )
                      ],
                    ),
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }

  bool formvalidateAndSave() {
    final form = globalKey.currentState;
    if (form!.validate()) {
      form.save();
      return true;
    }
    return false;
  }
}
