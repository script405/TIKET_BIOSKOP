import 'dart:async';
import 'package:flutter/material.dart';

class QrisPaymentScreen extends StatefulWidget {
  final int total;
  final Map<String, dynamic> movie;
  final List<int> selectedSeats;
  final Function(Map<String, dynamic> historyItem) onFinish;

  const QrisPaymentScreen({
    super.key,
    required this.total,
    required this.movie,
    required this.selectedSeats,
    required this.onFinish,
  });

  @override
  State<QrisPaymentScreen> createState() => _QrisPaymentScreenState();
}

class _QrisPaymentScreenState extends State<QrisPaymentScreen> {
  int _countdown = 180; // 3 menit
  Timer? _timer;

  @override
  void initState() {
    super.initState();
    _startCountdown();
  }

  void _startCountdown() {
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      setState(() {
        if (_countdown > 0) {
          _countdown--;
        } else {
          _timer?.cancel();
        }
      });
    });
  }

  void _finishPayment() {
    final historyItem = {
      'movie': widget.movie,
      'total': widget.total,
      'seats': widget.selectedSeats,
    };
    widget.onFinish(historyItem);

    // Tutup halaman QRIS dan balik ke history
    Navigator.of(context).pop();
  }

  void _showReceiptDialog() {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          backgroundColor: Colors.black,
          title: const Text('E-Struk', style: TextStyle(color: Colors.white)),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Film: ${widget.movie['title']}',
                style: const TextStyle(color: Colors.white),
              ),
              const SizedBox(height: 8),
              Text(
                'Total: Rp ${widget.total}',
                style: const TextStyle(color: Colors.white),
              ),
              const SizedBox(height: 8),
              Text(
                'Kursi: ${widget.selectedSeats.map((n) => n + 1).join(', ')}',
                style: const TextStyle(color: Colors.white),
              ),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(); // Tutup dialog
                _finishPayment(); // Pindah ke history
              },
              child: const Text(
                'Tutup',
                style: TextStyle(color: Colors.yellow),
              ),
            ),
          ],
        );
      },
    );
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: const Text('QRIS Payment'),
        backgroundColor: Colors.transparent,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'Silakan scan QRIS di bawah ini',
              style: TextStyle(color: Colors.white, fontSize: 18),
            ),
            const SizedBox(height: 20),
            Image.asset(
              'assets/images/qris_placeholder.jpg', // Gambar QRIS placeholder
              width: 200,
              height: 200,
            ),
            const SizedBox(height: 20),
            Text(
              'Total: Rp ${widget.total}',
              style: const TextStyle(color: Colors.white, fontSize: 18),
            ),
            const SizedBox(height: 20),
            Text(
              'Sisa waktu: ${_countdown ~/ 60}:${(_countdown % 60).toString().padLeft(2, '0')}',
              style: const TextStyle(color: Colors.red, fontSize: 16),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: _showReceiptDialog,
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.yellow,
                foregroundColor: Colors.black,
              ),
              child: const Text('Selesai Pembayaran'),
            ),
          ],
        ),
      ),
    );
  }
}
