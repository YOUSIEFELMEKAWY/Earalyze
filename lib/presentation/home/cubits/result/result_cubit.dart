import 'dart:math';
import 'package:earalyze/data/services/pdf_service.dart';
import 'package:earalyze/presentation/home/cubits/result/result_states.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ResultCubit extends Cubit<ResultStates> {
  ResultCubit() : super(ResultInitialState());

  void savePrintedPdf(User user) async {
    final pdfService = PdfService();
    final pdfData = await pdfService.generatePdf(
      email: user.email!,
      assessment:
          'Ms. Anderson appears in good health with no immediate concerns during the examination. '
          'Based on the assessment, there are no significant issues detected, and vital signs are within normal ranges.',
      birthDate: '01.09.2003',
      doctorName: 'Dr. Yousief Elmekawy',
      specialization: 'Cardiology',
      ihi: user.uid,
      phone: user.phoneNumber ?? "-------------",
      diagnosis:
          'After thorough examination, no specific medical conditions or acute illnesses were identified. '
          'The diagnosis indicates a healthy status with no evidence of underlying health issues.',
      prescription:
          'No prescription is necessary at this time, as the patient is in good health with no identified medical concerns. '
          'Given the absence of any medical issues, no medication is prescribed at present.',
      visitDate: DateTime.now()
          .toLocal()
          .toString()
          .substring(0, 10)
          .replaceAll('-', '.'),
      patientName: user.displayName!,
      medicalNumber: 'MA${Random().nextInt(999999) + 100000}',
    );
    await pdfService.savePdfFile('newPdf', pdfData);
    await pdfService.printPdf(pdfData);
    emit(SavePdfState());
  }

  Future<void> sharePdf(User user) async {
    final pdfService = PdfService();
    final pdfData = await pdfService.generatePdf(
      email: user.email!,
      assessment:
          'Ms. Anderson appears in good health with no immediate concerns during the examination. '
          'Based on the assessment, there are no significant issues detected, and vital signs are within normal ranges.',
      birthDate: '01.09.2003',
      doctorName: 'Dr. Yousief Elmekawy',
      specialization: 'Cardiology',
      ihi: '050 2535297',
      phone: user.phoneNumber ?? "-------------------",
      diagnosis:
          'After thorough examination, no specific medical conditions or acute illnesses were identified. '
          'The diagnosis indicates a healthy status with no evidence of underlying health issues.',
      prescription:
          'No prescription is necessary at this time, as the patient is in good health with no identified medical concerns. '
          'Given the absence of any medical issues, no medication is prescribed at present.',
      visitDate: DateTime.now()
          .toLocal()
          .toString()
          .substring(0, 10)
          .replaceAll('-', '.'),
      patientName: user.displayName!,
      medicalNumber: 'MA${Random().nextInt(999999) + 100000}',
    );
    try {
      // Share the PDF
      await pdfService.sharePdf(pdfData);
      emit(SharePdfState()); // Emit a success state
    } catch (e) {
      print(e);
    }
  }
}
