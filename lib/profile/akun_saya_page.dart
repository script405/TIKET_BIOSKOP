import 'package:flutter/material.dart';
import '../models/user.dart';
import 'bahasa_page.dart';
import 'edit_akun_page.dart';
import 'keamanan_akun_page.dart';
import 'metode_pembayaran.dart';
import 'pusat_bantuan_page.dart';

class AkunSayaPage extends StatelessWidget {
  final User user;

  const AkunSayaPage({super.key, required this.user});

  void goToPembayaran(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const MetodePembayaranPage()),
    );
  }

  void goToEditAkun(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const FormPage()),
    );
  }

  void goToKeamananAkun(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const KeamananAkunPage()),
    );
  }

  void goToBahasaPage(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const BahasaPage()),
    );
  }

  void goToPusatBantuanPage(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const PusatBantuanPage()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: const Text('My m.tix', style: TextStyle(color: Colors.white)),
      ),
      body: ListView(
        padding: const EdgeInsets.all(20),
        children: [
          Row(
            children: [
              const CircleAvatar(
                radius: 30,
                backgroundColor: Colors.white24,
                child: Text('N', style: TextStyle(color: Colors.white)),
              ),
              const SizedBox(width: 10),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    user.username, // otomatis dari login
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                  //Text(user.phone ?? '+62xxxxxxxxxx', style: const TextStyle(color: Colors.grey)),
                  const Text(
                    'm.tix POINT: 0',
                    style: TextStyle(color: Colors.grey),
                  ),
                ],
              ),
              const Spacer(),
              IconButton(
                icon: const Icon(Icons.edit, color: Colors.white),
                onPressed: () => goToEditAkun(context),
              ),
            ],
          ),
          const SizedBox(height: 20),
          ListTile(
            tileColor: Colors.white12,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            leading: const Icon(Icons.payment, color: Colors.white),
            title: const Text(
              'Metode pembayaran',
              style: TextStyle(color: Colors.white),
            ),
            subtitle: const Text(
              'Atur kartu dan e-wallet',
              style: TextStyle(color: Colors.grey),
            ),
            onTap: () => goToPembayaran(context),
          ),
          const SizedBox(height: 20),
          const Text(
            'Pengaturan',
            style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
          ),
          ListTile(
            leading: const Icon(Icons.security, color: Colors.white),
            title: const Text(
              'Keamanan akun',
              style: TextStyle(color: Colors.white),
            ),
            onTap: () => goToKeamananAkun(context),
          ),
          ListTile(
            leading: const Icon(Icons.language, color: Colors.white),
            title: const Text('Bahasa', style: TextStyle(color: Colors.white)),
            onTap: () => goToBahasaPage(context),
          ),
          const SizedBox(height: 20),
          const Text(
            'Lainnya',
            style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
          ),
          ListTile(
            leading: const Icon(Icons.phone, color: Colors.white),
            title: const Text(
              'Pusat Bantuan',
              style: TextStyle(color: Colors.white),
            ),
            onTap: () => goToPusatBantuanPage(context),
          ),
          ListTile(
            leading: const Icon(Icons.description, color: Colors.white),
            title: const Text(
              'Syarat penggunaan',
              style: TextStyle(color: Colors.white),
            ),
            onTap: () {},
          ),
          ListTile(
            leading: const Icon(Icons.privacy_tip, color: Colors.white),
            title: const Text(
              'Kebijakan privasi',
              style: TextStyle(color: Colors.white),
            ),
            onTap: () {},
          ),
          const SizedBox(height: 20),
          OutlinedButton.icon(
            onPressed: () {
              Navigator.pushNamedAndRemoveUntil(
                context,
                '/login',
                (route) => false,
              );
            },
            style: OutlinedButton.styleFrom(
              side: const BorderSide(color: Colors.white),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(30),
              ),
              padding: const EdgeInsets.symmetric(vertical: 14, horizontal: 24),
            ),
            icon: const Icon(Icons.logout, color: Colors.white),
            label: const Text('Keluar', style: TextStyle(color: Colors.white)),
          ),
        ],
      ),
    );
  }
}
