import 'package:flutter/material.dart';

class BuyTicketPage extends StatelessWidget {
  const BuyTicketPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Buy Ticket')),
      body: const Center(
        child: Text('Halaman Buy Ticket', style: TextStyle(fontSize: 20)),
      ),
    );
  }
}
