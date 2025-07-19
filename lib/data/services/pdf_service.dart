import 'dart:io';
import 'package:earalyze/presentation/resources/color_manager.dart';
import 'package:flutter/services.dart';
import 'package:path_provider/path_provider.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:printing/printing.dart';
import 'package:share_plus/share_plus.dart';

import '../data_source/local/app_preferences.dart';

class PdfService {
  Future<Uint8List> generatePdf({
    required String doctorName,
    required String specialization,
    required String visitDate,
    required String patientName,
    required String birthDate,
    required String medicalNumber,
    required String ihi,
    required String phone,
    required String email,
    required String assessment,
    required String diagnosis,
    required String prescription,
  }) async {
    // Create a PDF document
    final pdf = pw.Document();

    // Load the app logo from assets
    final logoImage = pw.MemoryImage(
      (await rootBundle.load('assets/images/app_logo.png'))
          .buffer
          .asUint8List(),
    );

    // Add a page to the PDF
    pdf.addPage(
      pw.Page(
        pageFormat: PdfPageFormat.a4,
        margin: const pw.EdgeInsets.all(20),
        build: (pw.Context context) {
          return pw.Column(
            crossAxisAlignment: pw.CrossAxisAlignment.start,
            children: [
              // Header with Logo and Title
              pw.Center(
                child: pw.Image(
                  logoImage,
                  width: 200,
                  height: 200,
                ),
              ),
              pw.SizedBox(height: 10),
              pw.Center(
                child: pw.Text(
                  'MEDICAL REPORT',
                  style: pw.TextStyle(
                    fontSize: 24,
                    fontWeight: pw.FontWeight.bold,
                    color: PdfColor.fromInt(AppPreferences.isDarkMode()
                        ? ColorManager.primaryDarkLight.value
                        : ColorManager.primaryDarkDarkMode.value),
                  ),
                ),
              ),
              pw.SizedBox(height: 20),

              // Visit Info
              pw.Text(
                'Visit Info',
                style: pw.TextStyle(
                  fontSize: 18,
                  fontWeight: pw.FontWeight.bold,
                ),
              ),
              pw.Table(
                border: pw.TableBorder.all(),
                children: [
                  pw.TableRow(
                    children: [
                      pw.Text(' Doctor\'s Name:'),
                      pw.Text(' $doctorName'),
                      pw.Text(' Visit Date:'),
                      pw.Text(' $visitDate'),
                    ],
                  ),
                  pw.TableRow(
                    children: [
                      pw.Text(' Specialization:'),
                      pw.Text(' $specialization'),
                      pw.Text(''),
                      pw.Text(''),
                    ],
                  ),
                ],
              ),
              pw.SizedBox(height: 20),

              // Patient Info
              pw.Text(
                ' Patient Info',
                style: pw.TextStyle(
                  fontSize: 18,
                  fontWeight: pw.FontWeight.bold,
                ),
              ),
              pw.Table(
                border: pw.TableBorder.all(),
                children: [
                  pw.TableRow(
                    children: [
                      pw.Text(' Full Name:'),
                      pw.Text(' $patientName'),
                      pw.Text(' Birth Date:'),
                      pw.Text(' $birthDate'),
                    ],
                  ),
                  pw.TableRow(
                    children: [
                      pw.Text(' Med. Number:'),
                      pw.Text(' $medicalNumber'),
                      pw.Text(' IHI:'),
                      pw.Text(' $ihi'),
                    ],
                  ),
                  pw.TableRow(
                    children: [
                      pw.Text(' Phone:'),
                      pw.Text(' $phone'),
                      pw.Text(' Email:'),
                      pw.Text(' $email'),
                    ],
                  ),
                ],
              ),
              pw.SizedBox(height: 20),

              // Assessment
              pw.Text(
                'Assessment',
                style: pw.TextStyle(
                  fontSize: 18,
                  fontWeight: pw.FontWeight.bold,
                ),
              ),
              pw.Text(
                assessment,
                style: const pw.TextStyle(fontSize: 16),
              ),
              pw.SizedBox(height: 20),

              // Diagnosis
              pw.Text(
                'Diagnosis',
                style: pw.TextStyle(
                  fontSize: 18,
                  fontWeight: pw.FontWeight.bold,
                ),
              ),
              pw.Text(
                diagnosis,
                style: const pw.TextStyle(fontSize: 16),
              ),
              pw.SizedBox(height: 20),

              // Prescription
              pw.Text(
                'Prescription',
                style: pw.TextStyle(
                  fontSize: 18,
                  fontWeight: pw.FontWeight.bold,
                ),
              ),
              pw.Text(
                prescription,
                style: const pw.TextStyle(fontSize: 16),
              ),
              pw.SizedBox(height: 20),

              // Footer
              pw.Center(
                child: pw.Text(
                  'For inquiries and appointments, feel free to contact us.\n'
                  'Phone: +1 (555) 123-4567, Email: info@earalyze.com\n'
                  'www.earalyze.com',
                  style: const pw.TextStyle(
                    fontSize: 14,
                    color: PdfColors.grey600,
                  ),
                  textAlign: pw.TextAlign.center,
                ),
              ),
            ],
          );
        },
      ),
    );

    // Save the PDF and return the bytes
    return pdf.save();
  }

  Future<void> savePdfFile(String fileName, Uint8List byteList) async {
    final Directory documentsDir = await getApplicationDocumentsDirectory();
    final filePath = "${documentsDir.path}/$fileName.pdf";
    final file = File(filePath);
    await file.writeAsBytes(byteList);
  }

  Future<void> printPdf(Uint8List byteList) async {
    await Printing.layoutPdf(
        onLayout: (PdfPageFormat format) async => byteList);
  }

  Future<void> sharePdf(Uint8List pdfData) async {
    // Save the PDF to a temporary file
    final tempDir = await getTemporaryDirectory();
    final file = File('${tempDir.path}/medical_report.pdf');
    await file.writeAsBytes(pdfData);

    // Share the PDF file
    await Share.shareXFiles(
      [XFile(file.path)],
      text: 'Here is the medical report.',
    );
  }
}
