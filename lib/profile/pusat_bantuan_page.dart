import 'package:flutter/material.dart';

class PusatBantuanPage extends StatelessWidget {
  const PusatBantuanPage({super.key});

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

      backgroundColor: const Color.fromARGB(255, 0, 0, 0),

      body: ListView(
        padding: const EdgeInsets.all(20),
        children: [
          //BAGIAN LAPOR
          Container(
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: const Color.fromARGB(255, 62, 62, 62),
              borderRadius: BorderRadius.circular(10),
            ),
            child: Column(
              children: [
                ListTile(
                  leading: Icon(Icons.description),
                  title: const Text(
                    'Lapor',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  trailing: Icon(Icons.arrow_forward_ios, size: 14),
                ),
              ],
            ),
          ),

          const SizedBox(height: 20),

          // BAGIAN WHATSAPP
          Container(
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: const Color.fromARGB(255, 62, 62, 62),
              borderRadius: BorderRadius.circular(10),
            ),
            child: Column(
              children: const [
                ListTile(
                  leading: Icon(Icons.chat),
                  title: const Text(
                    'WhatsApp',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  subtitle: const Text('0852552010(chat only)'),
                  trailing: Icon(Icons.arrow_forward_ios, size: 14),
                ),
              ],
            ),
          ),

          const SizedBox(height: 20),

          // BAGIAN TELEPON
          Container(
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: const Color.fromARGB(255, 62, 62, 62),
              borderRadius: BorderRadius.circular(10),
            ),
            child: Column(
              children: const [
                ListTile(
                  leading: Icon(Icons.phone),
                  title: const Text(
                    'Telepon',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  subtitle: const Text('0852552010'),
                  trailing: Icon(Icons.arrow_forward_ios, size: 14),
                ),
              ],
            ),
          ),

          const SizedBox(height: 20),

          // BAGIAN EMAIL
          Container(
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: const Color.fromARGB(255, 62, 62, 62),
              borderRadius: BorderRadius.circular(10),
            ),
            child: Column(
              children: const [
                ListTile(
                  leading: Icon(Icons.email),
                  title: const Text(
                    'Email',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                  subtitle: const Text('mtix@nonton.com'),
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
