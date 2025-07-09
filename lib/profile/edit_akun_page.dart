import 'package:flutter/material.dart';

class FormPage extends StatelessWidget {
  const FormPage({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController nameController = TextEditingController();
    TextEditingController addressController = TextEditingController();
    TextEditingController emailController = TextEditingController();
    TextEditingController jeniskelaminController = TextEditingController();
    TextEditingController AlamatController = TextEditingController();

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Edit Profile',
          style: TextStyle(color: Colors.white),
        ),
        backgroundColor: Colors.black,
        iconTheme: const IconThemeData(color: Colors.white), // icon back putih
      ),
      body: Container(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            // FORM NAMA PANJANG
            Container(
              padding: const EdgeInsets.all(5),
              decoration: BoxDecoration(
                border: Border.all(color: Colors.grey),
                borderRadius: BorderRadius.circular(10),
              ),
              child: TextField(
                controller: nameController,
                decoration: const InputDecoration(
                  border: InputBorder.none,
                  label: Text('Nama Panjang'),
                  contentPadding: EdgeInsets.only(
                    left: 10,
                  ), //jarak tulisan dari kiri
                ),
              ),
            ),

            const SizedBox(height: 20),

            // FORM NOMOR TELEPON
            Container(
              padding: const EdgeInsets.all(5),
              decoration: BoxDecoration(
                border: Border.all(color: Colors.grey),
                borderRadius: BorderRadius.circular(10),
              ),
              child: TextField(
                controller: addressController,
                decoration: const InputDecoration(
                  border: InputBorder.none,
                  label: Text('Nomor Telepon'),
                  contentPadding: EdgeInsets.only(left: 10),
                ),
              ),
            ),

            const SizedBox(height: 20),

            // FORM EMAIL
            Container(
              padding: const EdgeInsets.all(5),
              decoration: BoxDecoration(
                border: Border.all(color: Colors.grey),
                borderRadius: BorderRadius.circular(10),
              ),
              child: TextField(
                controller: emailController,
                decoration: const InputDecoration(
                  border: InputBorder.none,
                  label: Text('Email'),
                  contentPadding: EdgeInsets.only(left: 10),
                ),
              ),
            ),

            const SizedBox(height: 20),

            // FORM JENIS KELAMIN
            Container(
              padding: const EdgeInsets.all(5),
              decoration: BoxDecoration(
                border: Border.all(color: Colors.grey),
                borderRadius: BorderRadius.circular(10),
              ),
              child: TextField(
                controller: jeniskelaminController,
                decoration: const InputDecoration(
                  border: InputBorder.none,
                  label: Text('Jenis Kelamin'),
                  contentPadding: EdgeInsets.only(left: 10),
                ),
              ),
            ),

            const SizedBox(height: 20),

            // FORM ALAMAT
            Container(
              padding: const EdgeInsets.all(5),
              decoration: BoxDecoration(
                border: Border.all(color: Colors.grey),
                borderRadius: BorderRadius.circular(10),
              ),
              child: TextField(
                controller: AlamatController,
                decoration: const InputDecoration(
                  border: InputBorder.none,
                  label: Text('Alamat'),
                  contentPadding: EdgeInsets.only(left: 10),
                ),
              ),
            ),

            const SizedBox(height: 20),

            // TOMBOL SIMPAN
            Spacer(),
            ElevatedButton(
              onPressed: () => {},
              child: Text('Simpan'),
              style: ElevatedButton.styleFrom(),
            ),
          ],
        ),
      ),
    );
  }
}
