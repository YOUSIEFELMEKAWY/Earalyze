import 'dart:io';

import 'package:earalyze/presentation/home/cubits/scan/scan_states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_picker/image_picker.dart';

import '../../../../data/services/prediction.dart';

class ScanCubit extends Cubit<ScanStates> {
  ScanCubit() : super(ScanInitialState());

  final PredictionService _service = PredictionService();
  PredictionResult? predictionResult;
  XFile? image;
  final ImagePicker imagePicker = ImagePicker();

  void pickImageFromCamera() async {
    final XFile? pickedImage =
        await imagePicker.pickImage(source: ImageSource.camera);

    if (pickedImage != null) {
      image = pickedImage;
      emit(PickImageState());
    }
  }

  void pickImageFromGallery() async {
    final XFile? pickedImage =
        await imagePicker.pickImage(source: ImageSource.gallery);

    if (pickedImage != null) {
      image = pickedImage;
      emit(PickImageState());
    }
  }
  void analyzeImage() async {
    if (image == null) return;
    emit(ScanLoading());
    try {
      final result = await _service.sendImage(File(image!.path));
      predictionResult = result;
      emit(ScanSuccess(result));
    } catch (e) {
      emit(ScanError(e.toString()));
    }
  }
}
