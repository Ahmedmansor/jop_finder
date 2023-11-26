import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meta/meta.dart';

part 'apply_jop_state.dart';

class ApplyJopCubit extends Cubit<ApplyJopState> {
  ApplyJopCubit() : super(ApplyJopInitial());

  static ApplyJopCubit get(context) => BlocProvider.of(context);

  //Type Of Work
  String? type;
  selectRadioValue(value) {
    type = value;
    debugPrint(value);

    emit(SelectRadioValueSucess());
  }

  //pick File From Phone
  List<File> files = [];
  List<String> fileNames = [];
  List<int> fileSizeInBytes = [];

  pickFile() async {
    FilePickerResult? result = await FilePicker.platform
        .pickFiles(allowedExtensions: ['pdf'], type: FileType.custom);

    if (result != null) {
      File file = File(result.files.single.path!);
      debugPrint('The file name: ${file.path}');
      files.add(file);
      debugPrint('the files length is = ${files.length}');

      // File Name to convert the files to list of strings of Names of Files
      fileNames = files.map((file) => file.path.split('/').last).toList();
      debugPrint('The files names in fileNames list: $fileNames');

      //File Size
      int fileSize = file.lengthSync();
      fileSizeInBytes.add(fileSize);

      emit(AddItemFromList());
      emit(PickFileSucess());
    } else {
      emit(PickFileError());
      // User canceled the picker
    }
  }

  void removeCurrentItem(index) {
    fileNames.removeAt(index);
    files.removeAt(index);
    emit(RemoveItemFromList());
  }
}
