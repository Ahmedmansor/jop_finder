import 'dart:io';

import 'package:flutter/material.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';
import 'package:jobsque_job_finder/components/phone_number_widget.dart';
import 'package:jobsque_job_finder/repos/const.dart';
import 'package:jobsque_job_finder/screens/home/profile/cubit/profile_cubit.dart';
import 'package:jobsque_job_finder/utils/app_setting.dart';
import 'package:image_picker/image_picker.dart';
import 'package:jobsque_job_finder/utils/navigation_util.dart';
import 'package:jobsque_job_finder/widgets/custom_buttoms.dart';

import '../../../components/defult_material_button_goto.dart';

class EditProfile extends StatefulWidget {
  const EditProfile({super.key});

  @override
  State<EditProfile> createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {
  TextEditingController nameController = TextEditingController();
  TextEditingController bioController = TextEditingController();
  TextEditingController addressController = TextEditingController();
  TextEditingController phoneController = TextEditingController();

  final ImagePicker picker = ImagePicker();
  XFile? image;
  PhoneNumber number = PhoneNumber(isoCode: 'EG');

  @override
  Widget build(BuildContext context) {
    nameController.text = ProfileCubit.get(context).profile!.data!.name!;
    bioController.text = 'Senior UI/UX Designer';
    addressController.text = 'Ranjingan, Wangon, Wasington City';
    phoneController.text = '0100-666-7234';
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: const Text(
          'Edit Profile',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: Container(
        margin: const EdgeInsets.all(20),
        child: SingleChildScrollView(
          child: Column(
            children: [
              image == null
                  ? Stack(
                      children: [
                        const CircleAvatar(
                          radius: 55,
                          backgroundImage: NetworkImage(
                            "https://developers.elementor.com/docs/assets/img/elementor-placeholder-image.png",
                          ),
                        ),
                        Positioned(
                          bottom: 0,
                          right: 0,
                          child: IconButton(
                              onPressed: () {
                                showModalBottomSheet(
                                  context: context,
                                  builder: (context) {
                                    return Container(
                                      margin: const EdgeInsets.all(10),
                                      child: Row(
                                        children: [
                                          Expanded(
                                            child: MaterialButton(
                                                color: Colors.grey,
                                                onPressed: () async {
                                                  image =
                                                      await picker.pickImage(
                                                          source: ImageSource
                                                              .gallery);
                                                  setState(() {});
                                                },
                                                child: const Text("gallery")),
                                          ),
                                          Expanded(
                                            child: MaterialButton(
                                                color: Colors.grey,
                                                onPressed: () async {
                                                  image =
                                                      await picker.pickImage(
                                                          source: ImageSource
                                                              .camera);
                                                  setState(() {});
                                                },
                                                child: const Text("camera")),
                                          ),
                                        ],
                                      ),
                                    );
                                  },
                                );
                              },
                              icon: const Icon(Icons.camera_outlined)),
                        )
                      ],
                    )
                  : CircleAvatar(
                      radius: 55,
                      backgroundImage: FileImage(File(image!.path)),
                    ),
              // CircleAvatar(
              //   radius: 45,
              // ),
              const Text('Change Photo',
                  style: TextStyle(
                      color: Colors.blueAccent,
                      fontSize: 15,
                      fontWeight: FontWeight.w400)),
              SizedBox(
                height: AppSettings.height * 0.04,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Name',
                    style: ThemeText.boardingScreenBodysmall,
                  ),
                  SizedBox(
                    height: AppSettings.height * 0.01,
                  ),
                  _TextField(
                    controller: nameController,
                  ),
                  SizedBox(
                    height: AppSettings.height * 0.02,
                  ),
                  const Text(
                    'Bio',
                    style: ThemeText.boardingScreenBodysmall,
                  ),
                  SizedBox(
                    height: AppSettings.height * 0.01,
                  ),
                  _TextField(controller: bioController),
                  SizedBox(
                    height: AppSettings.height * 0.02,
                  ),
                  const Text(
                    'Address',
                    style: ThemeText.boardingScreenBodysmall,
                  ),
                  SizedBox(
                    height: AppSettings.height * 0.01,
                  ),
                  _TextField(controller: addressController),
                  SizedBox(
                    height: AppSettings.height * 0.02,
                  ),
                  const Text(
                    'No.Handphone',
                    style: ThemeText.boardingScreenBodysmall,
                  ),
                  SizedBox(
                    height: AppSettings.height * 0.01,
                  ),
                  PhoneNumberWidget(
                      phoneNumberController: phoneController, number: number),
                  SizedBox(
                    height: AppSettings.height * 0.17,
                  ),
                  Center(
                    child: CustomGeneralButton(
                      text: 'Save',
                      onTap: () {
                        NavigationUtils.offScreen(context);
                      },
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

  TextFormField _TextField({TextEditingController? controller}) {
    return TextFormField(
      controller: controller,
      decoration: InputDecoration(
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
          ),
          labelStyle: ThemeText.boardingScreenBodysmall),
    );
  }
}
