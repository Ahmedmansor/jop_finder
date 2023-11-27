import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jobsque_job_finder/cubits/cubit/cubit/main_cubit.dart';
import 'package:jobsque_job_finder/repos/const.dart';
import 'package:jobsque_job_finder/screens/create_account/create_account.dart';
import 'package:jobsque_job_finder/screens/create_account/cubit/register_cubit.dart';
import 'package:jobsque_job_finder/screens/create_account/what_type_of_work.dart';
import 'package:jobsque_job_finder/screens/create_account/where_are_yoy_prefefed.dart';
import 'package:jobsque_job_finder/screens/forget_password/create_new_password.dart';
import 'package:jobsque_job_finder/screens/forget_password/cubit/forget_password_cubit.dart';
import 'package:jobsque_job_finder/screens/forget_password/password_changed_sucessfully.dart';
import 'package:jobsque_job_finder/screens/home/after_search.dart';
import 'package:jobsque_job_finder/screens/home/apply_job/apply_jop_upload_portofolio_sucess.dart';
import 'package:jobsque_job_finder/screens/home/apply_job/cubit/apply_jop_cubit.dart';
import 'package:jobsque_job_finder/screens/home/home.dart';
import 'package:jobsque_job_finder/screens/home/home_layout.dart';
import 'package:jobsque_job_finder/screens/home/profile/cubit/profile_cubit.dart';
import 'package:jobsque_job_finder/screens/home/profile/login&security/change_password.dart';
import 'package:jobsque_job_finder/screens/home/profile/login&security/cubit/login_and_security_cubit.dart';
import 'package:jobsque_job_finder/screens/home/profile/notification.dart';
import 'package:jobsque_job_finder/screens/Onboarding/presentation/boarding_view.dart';
import 'package:jobsque_job_finder/screens/Onboarding/splash_screen.dart';
import 'package:jobsque_job_finder/screens/home/profile/others/complete_profile/complete_profile.dart';
import 'package:jobsque_job_finder/screens/home/profile/others/complete_profile/cubit/complete_profile_cubit.dart';
import 'package:jobsque_job_finder/screens/home/profile/others/complete_profile/cubit/cubit/main_complete_profile_cubit.dart';
import 'package:jobsque_job_finder/screens/home/profile/others/complete_profile/education.dart';
import 'package:jobsque_job_finder/screens/home/profile/others/complete_profile/experience.dart';
import 'package:jobsque_job_finder/screens/signup/cubits/cubit/login_cubit_cubit.dart';
import 'package:jobsque_job_finder/screens/signup/login_screen.dart';
import '../cubits/cubit/buttom_navigation_bar_screens_cubit.dart';
import '../screens/create_account/your_account_has_been.dart';
import '../screens/forget_password/check_your_email.dart';
import '../screens/forget_password/reset_password.dart';
import '../screens/home/apply_job/apply_jop_biodate.dart';
import '../screens/home/apply_job/apply_jop_upload_protfolio.dart';
import '../screens/home/apply_job/jop_detail_getalljobs.dart';
import '../screens/home/profile/Login_and_security.dart';
import '../screens/home/profile/edit_profile.dart';
import '../screens/home/profile/languages.dart';
import '../screens/home/profile/login&security/email_address.dart';
import '../screens/home/profile/login&security/phone_number.dart';
import '../screens/home/profile/portfolio.dart';
import '../screens/home/profile/profile.dart';
import '../utils/app_setting.dart';

class AppRoot extends StatelessWidget {
  const AppRoot({super.key});

  @override
  Widget build(BuildContext context) {
    AppSettings.init(context);

    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => ButtomNavigationBarScreensCubit(),
        ),
        BlocProvider(
          create: (context) => MainCubit()
            ..getJobs()
            ..getAllSavedJobs()
            ..getApplyJop(),
        ),
        BlocProvider(
          create: (context) => LoginCubit(),
        ),
        BlocProvider(
          create: (context) => RegisterCubit(),
        ),
        BlocProvider(
          create: (context) => ForgetPasswordCubit(),
        ),
        BlocProvider(
          create: (context) => ApplyJopCubit(),
        ),
        BlocProvider(
          create: (context) => ProfileCubit()..getProfile(),
        ),
        BlocProvider(
          create: (context) => LoginAndSecurityCubit(),
        ),
        BlocProvider(
          create: (context) => CompleteProfileCubit(),
        ),
        BlocProvider(
          create: (context) => MainCompleteProfileCubit(),
        ),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData.light(useMaterial3: true),
        home:
            token != null && token != '' ? HomeLayout() : const SplashScreen(),
        // home: ApplyJopUploadPortfolio(),
        // home: UploadPorfolioSucess(),
        // home: WhereAreYouPrefered(),
        // home: EditProfile(),
        // home: ApplyJopUploadPortfolio(),
        // home: Languages(),
        // home: PhoneNumberScreen(),
        // home: CheckYourEmail(),
        // home: TwoStepVerification(),
        // home: TwoStepVerificationOne(),
        // home: TwoStepVerificationAddPhone(),
        // home: EnterTheSixDigit(),
        // home: CreateAccouont(),
        // home: ResetPassword(),
        // home: TestScreen(),
        // home: TestCreateAccount(),
        // home: AfterSearch(),
        // home: SetFilter(),
        // home: ChangePassword(),
        // home: WhatTypeOfWork(),
        // home: HomeScreen(),
        // home: HomeLayout(),
        // home: UploadPorfolioSucess(),
        // home: const OnBoarding(),
        // home: LoginScreen(),
        // home: PasswordChangedSucessfully(),
        // home: Education(),
        // home: Experience(),
        // home: CompleteProfile(),
      ),
    );
  }
}
