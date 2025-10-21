import 'package:flutter/material.dart';
import 'result_screen.dart';

class ScanScreen extends StatelessWidget {
  const ScanScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Scan Screen')),
      body: Center(
        child: ElevatedButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const ResultScreen(
                  ocrText: 'Contoh hasil OCR\nBaris baru tetap utuh.',
                ),
              ),
            );
          },
          child: const Text('Lanjut ke Hasil OCR'),
        ),
      ),
    );
  }
}
