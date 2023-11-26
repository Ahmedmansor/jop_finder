// import 'dart:js_interop';
// import 'package:shared_preferences/shared_preferences.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:jobsque_job_finder/components/appbar_logo.dart';
// import 'package:jobsque_job_finder/components/defult_material_button_gotoandoff.dart';
// import 'package:jobsque_job_finder/cubits/cubit/cubit/authentication_cubit.dart';
// import 'package:jobsque_job_finder/screens/create_account/create_account.dart';
// import 'package:jobsque_job_finder/screens/home/home.dart';
// import 'package:jobsque_job_finder/utils/app_setting.dart';

// import '../../components/social_media.dart';
// import '../../repos/const.dart';
// import '../../utils/navigation_util.dart';

// // ignore: must_be_immutable
// class LoginScreen extends StatefulWidget {
//   LoginScreen({super.key});

//   //Check Box Value
//   bool value = true;
//   @override
//   State<LoginScreen> createState() => _LoginScreenState();
// }

// class _LoginScreenState extends State<LoginScreen> {
//   bool isPassword = true;
// // chat gpt
//   bool isPasswordEmpty = true; // Track password emptiness
//   bool canSubmit = false; // Track if form is ready for submission

//   var _key = GlobalKey<FormState>();

//   var emailController = TextEditingController();

//   var passwordController = TextEditingController();
// /* chat gpt: this init state to meke the login button unpressable if the field is empty */
//   void initState() {
//     super.initState();
//     passwordController.addListener(() {
//       setState(() {
//         isPasswordEmpty = passwordController.text.isEmpty;
//         canSubmit = _key.currentState!.validate() && !isPasswordEmpty;
//       });
//     });

//     //Inside your _LoginScreenState class, modify the initState
//     //to load the saved credentials and update the email and password fields:
//     loadSavedCredentials();
//   }

//   void loadSavedCredentials() async {
//     Map<String, String> credentials = await getCredentials();
//     emailController.text = credentials['email']!;
//     passwordController.text = credentials['password']!;
//     setState(() {
//       widget.value = credentials['email']!.isNotEmpty;
//     });
//   }

// // Shared pref to save the email and password
// // using SharedPreferences:
//   Future<void> saveCredentials(String email, String password) async {
//     SharedPreferences prefs = await SharedPreferences.getInstance();
//     prefs.setString('email', email);
//     prefs.setString('password', password);
//   }

// // Shared pref to get the email and password
// // using SharedPreferences:
//   Future<Map<String, String>> getCredentials() async {
//     SharedPreferences prefs = await SharedPreferences.getInstance();
//     String? email = prefs.getString('email');
//     String? password = prefs.getString('password');
//     return {'email': email ?? '', 'password': password ?? ''};
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         actions: [
//           AppBarLogo(
//             screen: null,
//           ),
//         ],
//         leading: IconButton(
//           onPressed: () {},
//           icon: const Icon(Icons.arrow_back, size: 30),
//         ),
//       ),
//       body: ListView(children: [
//         Container(
//           margin: const EdgeInsets.all(20),
//           child: Form(
//             key: _key,
//             child: Column(
//               crossAxisAlignment: CrossAxisAlignment.start,
//               children: [
//                 SizedBox(
//                   height: AppSettings.height * 0.1,
//                 ),
//                 const Text(
//                   'Login',
//                   style: ThemeText.boardingScreenBody,
//                 ),
//                 const Text(
//                   'Please login to find your dream job',
//                   style: ThemeText.boardingScreenBodysmall,
//                 ),
//                 SizedBox(
//                   height: AppSettings.height * 0.05,
//                 ),
//                 TextFormField(
//                   controller: emailController,
//                   onChanged: (value) {
//                     // chat gpt: the set state
//                     setState(() {
//                       canSubmit =
//                           _key.currentState!.validate() && !isPasswordEmpty;
//                     });
//                     // _key.currentState!.validate();
//                   },
//                   validator: (value) {
//                     if (value!.isEmpty) {
//                       return "Email can\'t be empty";
//                     } else if (!RegExp(
//                             r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
//                         .hasMatch(value)) {
//                       return "email formate is not correct";
//                     }
//                   },
//                   decoration: InputDecoration(
//                     border: OutlineInputBorder(
//                       borderRadius: BorderRadius.circular(10),
//                     ),
//                     labelText: "email",
//                     prefixIcon: const Icon(Icons.person_2_outlined),
//                   ),
//                 ),
//                 SizedBox(
//                   height: AppSettings.height * 0.03,
//                 ),

//                 TextFormField(
//                   controller: passwordController,
//                   onChanged: (value) {
//                     // chat gpt: the set state

//                     setState(() {
//                       isPasswordEmpty = value.isEmpty;
//                       canSubmit =
//                           _key.currentState!.validate() && !isPasswordEmpty;
//                     });
//                     // _key.currentState!.validate();
//                   },
//                   validator: (value) {
//                     if (value!.length < 8) {
//                       return "password must be at least 8 characters";
//                     } else if (!RegExp(
//                             r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$')
//                         .hasMatch(value)) {
//                       return "password formate is not correct";
//                     }
//                   },
//                   obscureText: isPassword,
//                   decoration: InputDecoration(
//                     border: OutlineInputBorder(
//                       borderRadius: BorderRadius.circular(10),
//                     ),
//                     labelText: "Password",
//                     prefixIcon: const Icon(Icons.lock),
//                     suffixIcon: IconButton(
//                       onPressed: () {
//                         setState(() {
//                           isPassword = !isPassword;
//                         });
//                       },
//                       icon: Icon(
//                           isPassword ? Icons.visibility : Icons.visibility_off),
//                     ),
//                   ),
//                 ),
//                 SizedBox(
//                   height: AppSettings.height * 0.01,
//                 ),
//                 Row(
//                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                   children: [
//                     Row(
//                       children: [
//                         Checkbox(
//                           value: widget.value,
//                           onChanged: (value) {
//                             setState(() {
//                               widget.value = value!;
//                             });
//                           },
//                         ),
//                         const Text(
//                           'Remember Me',
//                           style: ThemeText.boardingScreenBodysmall,
//                         )
//                       ],
//                     ),
//                     TextButton(
//                       onPressed: () {},
//                       child: Text(
//                         'Forget Password?',
//                         style: ThemeText.boardingScreenBodysmall
//                             .copyWith(color: Colors.blue[800]),
//                       ),
//                     )
//                   ],
//                 ),
//                 SizedBox(
//                   height: AppSettings.height * 0.08,
//                 ),
//                 // MaterialButton(
//                 //   onPressed: () {
//                 //     if (_key.currentState!.validate()) {
//                 //       print("success");
//                 //     }
//                 //   },
//                 //   color: Colors.redAccent,
//                 //   textColor: Colors.white,
//                 //   child: const Text(
//                 //     "Login",
//                 //     style: TextStyle(fontWeight: FontWeight.bold),
//                 //   ),
//                 //   minWidth: 200,
//                 // ),
//                 SizedBox(
//                   height: AppSettings.height * 0.07,
//                 ),
//                 Row(
//                   mainAxisAlignment: MainAxisAlignment.center,
//                   children: [
//                     Text(
//                       'Dont’t have an account?',
//                       style: ThemeText.boardingScreenBodysmall,
//                     ),
//                     TextButton(
//                       onPressed: () {
//                         NavigationUtils.goTo(context, CreateAccouont());
//                       },
//                       child: Text(
//                         'Register',
//                         style: ThemeText.boardingScreenBodysmall
//                             .copyWith(color: Colors.blue[800]),
//                       ),
//                     ),
//                   ],
//                 ),
//                 SizedBox(height: AppSettings.height * 0.01),
//                 SizedBox(
//                   width: AppSettings.width,
//                   child: BlocConsumer<AuthenticationCubit, AuthenticationState>(
//                     listener: (context, state) {
//                       // TODO: implement listener
//                       if (state is SucessLoadingState) {
//                         NavigationUtils.goToAndOff(context, HomeScreen());
//                       }
//                     },
//                     builder: (context, state) {
//                       return state is LoadingLoginState
//                           ? Center(
//                               child: CircularProgressIndicator(),
//                             )
//                           : MaterialButton(
//                               height: AppSettings.height * 0.08,
//                               onPressed: canSubmit
//                                   ? () async {
//                                       // save credentials if the checkbox is checked
//                                       if (widget.value) {
//                                         await saveCredentials(
//                                             emailController.text,
//                                             passwordController.text);
//                                       } else {
//                                         // Clear saved credentials if the checkbox is unchecked
//                                         await saveCredentials('', '');
//                                       }
//                                       AuthenticationCubit.get(context).login(
//                                         emailController.text,
//                                         passwordController.text,
//                                       );
//                                     }
//                                   : null, // Set onPressed to null when invalid
//                               shape: RoundedRectangleBorder(
//                                   borderRadius: BorderRadius.circular(50)),
//                               color: Colors.blue[400]!,
//                               child: Text(
//                                 'Login',
//                                 style: TextStyle(
//                                     fontSize: 16, color: Colors.white),
//                               ),
//                             );
//                       // MaterialButton(
//                       //     height: AppSettings.height * 0.08,
//                       //     onPressed: () {
//                       //       // NavigationUtils.goToAndOff(context, Screen!);
//                       //       AuthenticationCubit.get(context).login(
//                       //           emailController.text,
//                       //           passwordController.text);
//                       //     },
//                       //     shape: RoundedRectangleBorder(
//                       //         borderRadius: BorderRadius.circular(50)),
//                       //     color: Colors.blue[400]!,
//                       //     child: Text(
//                       //       'Login',
//                       //       style: TextStyle(
//                       //           fontSize: 16, color: Colors.white),
//                       //     ),
//                       //   );
//                     },
//                   ),
//                 ),
//                 SizedBox(
//                   height: AppSettings.height * 0.02,
//                 ),
//                 SizedBox(
//                   width: AppSettings.width,
//                   child: const Row(
//                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                     children: [
//                       Divider(
//                         color: Colors.black,
//                         thickness: 1,
//                         height: 10,
//                       ),
//                       Text(
//                         'Or Login With Account',
//                         style: ThemeText.boardingScreenBodysmall,
//                       ),
//                       Divider(
//                         color: Colors.black,
//                         thickness: 1,
//                         height: 10,
//                       ),
//                     ],
//                   ),
//                 ),
//                 SizedBox(
//                   height: AppSettings.height * 0.03,
//                 ),
//                 Row(
//                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                   children: [
//                     SocialMedia(
//                         text: 'Google', icon: 'assets/social/Google.png'),
//                     SocialMedia(
//                         text: 'Facebook', icon: 'assets/social/Facebook.png')
//                   ],
//                 ),
//               ],
//             ),
//           ),
//         ),
//       ]),
//     );
//   }
// }
