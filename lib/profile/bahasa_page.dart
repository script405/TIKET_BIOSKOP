import 'package:flutter/material.dart';

class BahasaPage extends StatelessWidget {
  const BahasaPage({super.key});

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

      body: Container(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            // BAGIAN BAHASA INDONESIA
            Container(
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: const Color.fromARGB(255, 62, 62, 62),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Column(
                children: [
                  ListTile(
                    leading: CircleAvatar(
                      backgroundImage: NetworkImage(
                        'data:image/png;base64,iVBORw0KGgoAAAANSUhEUgAAARMAAAC3CAMAAAAGjUrGAAAADFBMVEX////tHCTsAAz2qKrp10ouAAAA20lEQVR4nO3QsRGAQAzAsAD770wf139QSBP4PBfbfB3wQ56UJ+VJeVKelCflSXlSnpQn5Ul5Up6UJ+VJeVKelCflSXlSnpQn5Ul5Up6UJ+VJeVKelCflSXlSnpQn5Ul5Up6UJ+VJeVKelCflSXlSnpQn5Ul5Up6UJ+VJeVKelCflSXlSnpQn5Ul5Up6UJ+VJeVKelCflSXlSnpQn5Ul5Up6UJ+VJeVKelCflSXlSnpQn5Ul5Up6UJ+VJeVJzs83DNgAAAAAAAAAAAAAAAAAAAAAAAAAAAAAAABzzAnoGZg5GBxcoAAAAAElFTkSuQmCC',
                      ),
                    ),
                    title: Text(
                      'Bahasa Indonesia',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    trailing: Icon(Icons.arrow_forward_ios, size: 14),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 20),

            // BAGIAN BAHASA INGGRIS
            Container(
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: const Color.fromARGB(255, 62, 62, 62),
                borderRadius: BorderRadius.circular(10),
              ),
              child: Column(
                children: [
                  ListTile(
                    leading: CircleAvatar(
                      backgroundImage: NetworkImage(
                        'https://cdn.pixabay.com/photo/2013/07/13/12/03/flag-159070_1280.png',
                      ),
                    ),
                    title: Text(
                      'Bahasa Inggris',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    trailing: Icon(Icons.arrow_forward_ios, size: 14),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
