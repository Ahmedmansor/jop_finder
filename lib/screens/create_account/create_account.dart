import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jobsque_job_finder/screens/create_account/cubit/register_cubit.dart';
import 'package:jobsque_job_finder/screens/create_account/widgets/register_button.dart';
import 'package:jobsque_job_finder/screens/signup/login_screen.dart';
import 'package:jobsque_job_finder/utils/app_setting.dart';
import 'package:jobsque_job_finder/widgets/social_media_raw.dart';

import '../../repos/const.dart';
import '../../utils/navigation_util.dart';

class CreateAccouont extends StatefulWidget {
  const CreateAccouont({super.key});

  @override
  State<CreateAccouont> createState() => _CreateAccouontState();
}

class _CreateAccouontState extends State<CreateAccouont> {
  var emailController = TextEditingController();
  var passwordController = TextEditingController();
  var userNameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(children: [
        Container(
          margin: const EdgeInsets.all(20),
          child: Form(
            key: RegisterCubit.get(context).keyRegister,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    IconButton(
                      onPressed: () {},
                      icon: const Icon(Icons.arrow_back, size: 30),
                    ),
                    SizedBox(
                      child: Image.asset('assets/job sque.png'),
                    ),
                  ],
                ),
                SizedBox(
                  height: AppSettings.height * 0.1,
                ),
                const Text(
                  'Create Account',
                  style: ThemeText.boardingScreenBody,
                ),
                const Text(
                  'Please Create an account to find your dream job',
                  style: ThemeText.boardingScreenBodysmall,
                ),
                SizedBox(
                  height: AppSettings.height * 0.05,
                ),
                //UserName ------------------------------------

                TextFormField(
                  controller: userNameController,
                  onChanged: (value) {
                    RegisterCubit.get(context).validateFormRegister(
                        username: value,
                        email: emailController.text,
                        password: passwordController.text);
                  },
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "username can't be empty";
                    }
                    return null;
                  },
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    labelText: "Username",
                    prefixIcon: const Icon(Icons.person_2_outlined),
                  ),
                ),
                SizedBox(
                  height: AppSettings.height * 0.03,
                ),
                //Email ------------------------------------

                TextFormField(
                  controller: emailController,
                  onChanged: (value) {
                    RegisterCubit.get(context).validateFormRegister(
                        username: userNameController.text,
                        email: value,
                        password: passwordController.text);
                  },
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "email can't be empty";
                    } else if (!RegExp(
                            r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                        .hasMatch(value)) {
                      return "email formate is not correct";
                    }
                    return null;
                  },
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                    labelText: "Email",
                    prefixIcon: const Icon(Icons.email_outlined),
                  ),
                ),
                SizedBox(
                  height: AppSettings.height * 0.03,
                ),
                //paassword ------------------------------------
                BlocBuilder<RegisterCubit, RegisterState>(
                  builder: (context, state) {
                    return TextFormField(
                      controller: passwordController,
                      onChanged: (value) {
                        RegisterCubit.get(context).validateFormRegister(
                            username: userNameController.text,
                            email: emailController.text,
                            password: value);
                      },
                      validator: (value) {
                        if (value!.length < 8) {
                          return "password must be at least 8 characters";
                        } else if (!RegExp(
                                r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$')
                            .hasMatch(value)) {
                          return "password formate is not correct";
                        }
                        return null;
                      },
                      obscureText: RegisterCubit.get(context).isPassword,
                      decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        labelText: "Password",
                        prefixIcon: const Icon(Icons.lock),
                        suffixIcon: IconButton(
                          onPressed: () {
                            RegisterCubit.get(context).changeVisablity();
                          },
                          icon: Icon(RegisterCubit.get(context).isPassword
                              ? Icons.visibility
                              : Icons.visibility_off),
                        ),
                      ),
                    );
                  },
                ),

                SizedBox(
                  height: AppSettings.height * 0.07,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      'Already have an account?',
                      style: ThemeText.boardingScreenBodysmall,
                    ),
                    TextButton(
                      onPressed: () {
                        NavigationUtils.goToAndOff(context, LoginScreen());
                      },
                      child: Text(
                        'Login',
                        style: ThemeText.boardingScreenBodysmall
                            .copyWith(color: Colors.blue[800]),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: AppSettings.height * 0.01),
                RegisterButton(
                  onTap: () {
                    RegisterCubit.get(context).register(userNameController.text,
                        emailController.text, passwordController.text);
                  },
                ),
                /********************/

                SizedBox(
                  height: AppSettings.height * 0.02,
                ),
                SizedBox(
                  width: AppSettings.width,
                  child: const Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Divider(
                        color: Colors.black,
                        thickness: 1,
                        height: 10,
                      ),
                      Text(
                        'Or Sign up With Account',
                        style: ThemeText.boardingScreenBodysmall,
                      ),
                      Divider(
                        color: Colors.black,
                        thickness: 1,
                        height: 10,
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: AppSettings.height * 0.03,
                ),
                const SocialMediaRaw()
              ],
            ),
          ),
        ),
      ]),
    );
  }
}
