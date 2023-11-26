import 'package:flutter/material.dart';
import 'package:intl_phone_number_input/intl_phone_number_input.dart';

class PhoneNumberWidget extends StatelessWidget {
  const PhoneNumberWidget({
    super.key,
    required this.phoneNumberController,
    required this.number,
  });

  final TextEditingController phoneNumberController;
  final PhoneNumber number;

  @override
  Widget build(BuildContext context) {
    return InternationalPhoneNumberInput(
        validator: (value) {
          if (value!.isEmpty) {
            return "Email can't be empty";
          }
          return null;
        },
        onInputChanged: (value) {
          print(value.phoneNumber);
        },
        onInputValidated: (bool value) {
          print(value);
        },
        selectorConfig: const SelectorConfig(
          selectorType: PhoneInputSelectorType.BOTTOM_SHEET,
        ),
        ignoreBlank: false,
        autoValidateMode: AutovalidateMode.disabled,
        selectorTextStyle: const TextStyle(color: Colors.black),
        textFieldController: phoneNumberController,
        formatInput: true,
        // errorMessage: 'error',
        initialValue: number,
        keyboardType:
            const TextInputType.numberWithOptions(signed: true, decimal: true),
        inputBorder: const OutlineInputBorder(),
        onSaved: (PhoneNumber number) {
          print('On Saved: $number');
        });
  }
}
