import 'package:flutter/material.dart';

class KeamananAkunPage extends StatelessWidget {
  const KeamananAkunPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Keamanan Akun'),
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
      ),

      backgroundColor: const Color.fromARGB(255, 0, 0, 0),
      body: ListView(
        padding: const EdgeInsets.all(20),
        children: [
          //  BAGIAN LIST GANTI PIN
          Container(
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: Colors.grey[300],
              borderRadius: BorderRadius.circular(10),
            ),
            child: Column(
              children: [
                ListTile(
                  leading: Icon(Icons.lock),
                  title: const Text(
                    'Ganti PIN',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  trailing: Icon(Icons.arrow_forward_ios, size: 14),
                ),
              ],
            ),
          ),

          const SizedBox(height: 20),

          // BAGIAN LIST HAPUS AKUN
          Container(
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: Colors.grey[300],
              borderRadius: BorderRadius.circular(10),
            ),

            child: Column(
              children: const [
                ListTile(
                  leading: Icon(Icons.delete),
                  title: const Text(
                    'Hapus Akun',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  trailing: Icon(Icons.arrow_forward_ios, size: 14),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
