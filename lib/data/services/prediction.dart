import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;

class PredictionResult {
  final String predictedClass;
  final double estimatedLengthMm;
  final String recommendation;
  final String interpretation;

  PredictionResult({
    required this.predictedClass,
    required this.estimatedLengthMm,
    required this.recommendation,
    required this.interpretation,
  });

  factory PredictionResult.fromJson(Map<String, dynamic> json) {
    return PredictionResult(
      predictedClass: json['predicted_class'],
      estimatedLengthMm: (json['estimated_length_mm'] as num).toDouble(),
      recommendation: json['ai_recommendation'],
      interpretation: json['interpretation'],
    );
  }
}

class PredictionService {
  static const String _apiUrl = "http://10.0.2.2:8004/predict/";

  Future<PredictionResult> sendImage(File imageFile) async {
    try {
      final request = http.MultipartRequest('POST', Uri.parse(_apiUrl));
      request.files.add(await http.MultipartFile.fromPath('file', imageFile.path));

      final streamedResponse = await request.send().timeout(const Duration(seconds: 15));
      final response = await http.Response.fromStream(streamedResponse);

      if (response.statusCode == 200) {
        final Map<String, dynamic> data = jsonDecode(response.body);
        return PredictionResult.fromJson(data);
      } else {
        throw HttpException('API Error: ${response.statusCode} ${response.reasonPhrase}');
      }
    } on SocketException {
      throw Exception("No Internet connection.");
    } on TimeoutException {
      throw Exception("The connection timed out.");
    } catch (e) {
      throw Exception("Unexpected error: $e");
    }
  }
}
