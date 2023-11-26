import 'package:flutter/material.dart';
import 'package:countries_flag/countries_flag.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:jobsque_job_finder/screens/home/profile/cubit/profile_cubit.dart';
import 'package:jobsque_job_finder/utils/app_setting.dart';

// ignore: must_be_immutable
class Languages extends StatelessWidget {
  Languages({super.key});
  String? type;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        // leading: const Icon(Icons.arrow_back),
        centerTitle: true,
        foregroundColor: Colors.black,
        backgroundColor: Colors.white,
        elevation: 0,
        title: const Text(
          'Language',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
      body: const LanguagesBody(),
    );
  }
}

class LanguagesBody extends StatefulWidget {
  const LanguagesBody({super.key});

  @override
  State<LanguagesBody> createState() => _LanguagesBodyState();
}

class _LanguagesBodyState extends State<LanguagesBody> {
  String? type;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(20),
      child: Column(
        children: [
          FlagItem(
            radioValue: 'English',
            name: 'Englisg',
            flagName: Flags.unitedKingdom,
          ),
          _divider(),
          FlagItem(
            radioValue: 'Indonesia',
            name: 'Indonesia',
            flagName: Flags.indonesia,
          ),
          _divider(),
          FlagItem(
            radioValue: 'Arabic',
            name: 'Arabic',
            flagName: Flags.saudiArabia,
          ),
          _divider(),
          FlagItem(
            radioValue: 'Chinese',
            name: 'Chinese',
            flagName: Flags.china,
          ),
          _divider(),
          FlagItem(
            radioValue: 'Dutch',
            name: 'Dutch',
            flagName: Flags.netherlands,
          ),
          _divider(),
          FlagItem(
            radioValue: 'French',
            name: 'French',
            flagName: Flags.france,
          ),
          _divider(),
          FlagItem(
            radioValue: 'German',
            name: 'German',
            flagName: Flags.germany,
          ),
          _divider(),
          FlagItem(
            radioValue: 'Japanese',
            name: 'Japanese',
            flagName: Flags.japan,
          ),
          _divider(),
          FlagItem(
            radioValue: 'Korean',
            name: 'Korean',
            flagName: Flags.southKorea,
          ),
          _divider(),
          FlagItem(
            radioValue: 'Portuguese',
            name: 'Portuguese',
            flagName: Flags.portugal,
          ),
        ],
      ),
    );
  }

  // ignore: non_constant_identifier_names
  Widget FlagItem(
      {required String? radioValue, required String? name, String? flagName}) {
    return Container(
      // padding: const EdgeInsets.all(10),
      // margin: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        border: Border.all(width: 2, color: Colors.transparent),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              ClipRRect(
                borderRadius: BorderRadius.circular(15),
                child: CountriesFlag(
                  flagName,
                  width: 20,
                  height: 40,
                ),
              ),
              SizedBox(
                width: AppSettings.width * 0.02,
              ),
              Text(
                name!,
                style:
                    const TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
              ),
            ],
          ),
          BlocBuilder<ProfileCubit, ProfileState>(
            builder: (context, state) {
              return Radio(
                value: radioValue,
                groupValue: ProfileCubit.get(context).type,
                onChanged: (value) {
                  ProfileCubit.get(context).changeLanguage(value);
                },
              );
            },
          ),
        ],
      ),
    );
  }

  Divider _divider() {
    return const Divider(
      // indent: 10,
      // endIndent: 10,
      color: Colors.black26,
    );
  }
}
