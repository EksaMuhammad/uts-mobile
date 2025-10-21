import 'package:flutter/material.dart';
import 'result_screen.dart';

class ScanScreen extends StatefulWidget {
  const ScanScreen({super.key});

  @override
  State<ScanScreen> createState() => _ScanScreenState();
}

class _ScanScreenState extends State<ScanScreen> {
  bool _isCameraReady = false;
  bool _isLoading = true;

  @override
  void initState() {
    super.initState();
    _initializeCamera();
  }

  // Simulasi proses kamera siap
  Future<void> _initializeCamera() async {
    await Future.delayed(const Duration(seconds: 2)); // simulasi delay kamera
    setState(() {
      _isCameraReady = true;
      _isLoading = false;
    });
  }

  // Fungsi ambil gambar dengan error handling
  Future<void> _takePicture() async {
    try {
      // Simulasi ambil gambar berhasil
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => const ResultScreen(
            ocrText: 'Contoh hasil OCR\nBaris baru tetap utuh.',
          ),
        ),
      );
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text(
            "Pemindaian Gagal! Periksa Izin Kamera atau coba lagi.",
          ),
          backgroundColor: Colors.redAccent,
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    // Loading Screen sesuai instruksi soal
    if (_isLoading) {
      return Scaffold(
        backgroundColor: Colors.grey[900],
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
              CircularProgressIndicator(color: Colors.yellow),
              SizedBox(height: 16),
              Text(
                'Memuat Kamera... Harap tunggu.',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 18,
                ),
              ),
            ],
          ),
        ),
      );
    }

    // Kamera siap
    return Scaffold(
      appBar: AppBar(title: const Text('Scan Screen')),
      body: Center(
        child: ElevatedButton(
          onPressed: _takePicture,
          child: const Text('Ambil Gambar'),
        ),
      ),
    );
  }
}
