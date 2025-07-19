import '../../../../data/services/prediction.dart';

abstract class ScanStates {}

class ScanInitialState extends ScanStates {}

class PickImageState extends ScanStates {}

class ScanLoading extends ScanStates {}

class ScanSuccess extends ScanStates {
  final PredictionResult result;
  ScanSuccess(this.result);
}

class ScanError extends ScanStates {
  final String message;
  ScanError(this.message);
}