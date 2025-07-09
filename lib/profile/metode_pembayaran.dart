import 'package:flutter/material.dart';

class MetodePembayaranPage extends StatelessWidget {
  const MetodePembayaranPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Edit Profile',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.black,
        iconTheme: const IconThemeData(color: Colors.white), // icon back putih
      ),
      backgroundColor: const Color.fromARGB(
        255,
        0,
        0,
        0,
      ), // Latar belakang lembut

      body: ListView(
        padding: const EdgeInsets.all(20),
        children: [
          // BAGINN MTIX POINT
          Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: const Color.fromARGB(255, 62, 62, 62),
              borderRadius: BorderRadius.circular(15),
            ),
            child: Column(
              children: [
                ListTile(
                  leading: Icon(Icons.stars, size: 30),
                  title: Text(
                    'm.tix Point',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  subtitle: Text('Saldo: Rp0'),
                  trailing: Icon(Icons.arrow_forward_ios, size: 14),
                ),
              ],
            ),
          ),

          const SizedBox(height: 20),

          //BAGIAN JUDUL E WALET
          const Text('E-Wallet', style: TextStyle(fontWeight: FontWeight.bold)),
          const SizedBox(height: 10),
          //BAGIAN LIST E WALET
          Container(
            decoration: BoxDecoration(
              color: const Color.fromARGB(255, 62, 62, 62),
              borderRadius: BorderRadius.circular(15),
            ),
            child: Column(
              children: const [
                // LIST GOPEY
                ListTile(
                  leading: Icon(Icons.account_balance_wallet),
                  title: Text('GoPay'),
                  subtitle: Text('Saldo: Rp2.001'),
                  trailing: Icon(Icons.arrow_forward_ios, size: 14),
                ),

                // LIST SHOPE PAY
                ListTile(
                  leading: Icon(Icons.account_balance_wallet),
                  title: Text('Shope pay'),
                  subtitle: Text(
                    'Sambungkan',
                    style: TextStyle(color: Colors.teal),
                  ),
                  trailing: Icon(Icons.arrow_forward_ios, size: 14),
                ),

                // LIST ALO BANK
                ListTile(
                  leading: Icon(Icons.account_balance_wallet),
                  title: Text('Allo Bank'),
                  subtitle: Text(
                    'Sambungkan',
                    style: TextStyle(color: Colors.teal),
                  ),
                  trailing: Icon(Icons.arrow_forward_ios, size: 14),
                ),
              ],
            ),
          ),

          const SizedBox(height: 20),

          // BAGIAN JUDUL OTHER
          const Text('Other', style: TextStyle(fontWeight: FontWeight.bold)),
          const SizedBox(height: 10),
          // BAGIAN LIST CONTEINER
          Container(
            decoration: BoxDecoration(
              color: const Color.fromARGB(255, 62, 62, 62),
              borderRadius: BorderRadius.circular(15),
            ),
            child: const ListTile(
              leading: Icon(Icons.qr_code),
              title: Text('QRIS'),
              trailing: Icon(Icons.arrow_forward_ios, size: 14),
            ),
          ),

          const SizedBox(height: 20),

          // BAGIAN VIRTUAL ACCOUNT
          const Text(
            'Virtual Account',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 10),
          Container(
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              color: const Color.fromARGB(255, 62, 62, 62),
              borderRadius: BorderRadius.circular(15),
            ),
            child: const Text('Belum ada akun virtual yang ditambahkan'),
          ),
        ],
      ),
    );
  }
}
