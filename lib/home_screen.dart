import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.all(16.0),
            decoration: BoxDecoration(
              color: Colors.deepPurple.shade50,
              borderRadius: BorderRadius.circular(12.0),
              boxShadow: [
                BoxShadow(
                  color: Colors.black12,
                  blurRadius: 4.0,
                  offset: Offset(0, 2),
                ),
              ],
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Selamat Datang di NovAI-Sholat Khusu',
                  style: TextStyle(
                    fontSize: 24.0,
                    fontWeight: FontWeight.bold,
                    color: Colors.deepPurple,
                  ),
                ),
                const SizedBox(height: 12.0),
                const Text(
                  'Sholat khusu adalah sholat yang dilakukan dengan penuh konsentrasi, '
                  'menghadirkan hati, dan fokus hanya kepada Allah. Kekhusyukan dalam sholat '
                  'adalah inti dari ibadah yang diterima oleh Allah dan menjadi sarana '
                  'untuk mendekatkan diri kepada-Nya.',
                  style: TextStyle(fontSize: 18.0, color: Colors.black87),
                  textAlign: TextAlign.justify,
                ),
                const SizedBox(height: 12.0),
                const Text(
                  'Mengapa penting? Karena sholat khusu membantu kita mencapai ketenangan jiwa, '
                  'meningkatkan keimanan, dan memperbaiki hubungan kita dengan Allah. '
                  'Sholat yang khusu juga menjadi cerminan kualitas ibadah kita sehari-hari.',
                  style: TextStyle(fontSize: 18.0, color: Colors.black87),
                  textAlign: TextAlign.justify,
                ),
              ],
            ),
          ),
          const SizedBox(height: 20.0),
          const Divider(thickness: 2.0, color: Colors.deepPurple),
          const SizedBox(height: 20.0),
          const Text(
            'Fitur Utama:',
            style: TextStyle(
              fontSize: 22.0,
              fontWeight: FontWeight.bold,
              color: Colors.deepPurple,
            ),
          ),
          const SizedBox(height: 16.0),
          const Text(
            '1. Tips Khusu: Panduan langkah-langkah untuk meningkatkan kekhusyukan.\n'
            '2. Gerakan Sholat: Penjelasan gerakan sholat yang benar.\n'
            '3. Surah: Pilihan surah untuk dibaca dalam sholat.',
            style: TextStyle(fontSize: 18.0, color: Colors.black87),
            textAlign: TextAlign.justify,
          ),
          const SizedBox(height: 20.0),
          Container(
            padding: const EdgeInsets.all(16.0),
            decoration: BoxDecoration(
              color: Colors.deepPurple.shade50,
              borderRadius: BorderRadius.circular(12.0),
              boxShadow: [
                BoxShadow(
                  color: Colors.black12,
                  blurRadius: 4.0,
                  offset: Offset(0, 2),
                ),
              ],
            ),
            child: const Text(
              '“Sesungguhnya beruntunglah orang-orang yang beriman, yaitu orang-orang yang khusyuk dalam sholatnya.” (QS. Al-Mu’minun: 1-2)',
              style: TextStyle(
                fontSize: 18.0,
                fontStyle: FontStyle.italic,
                color: Colors.black87,
              ),
              textAlign: TextAlign.center,
            ),
          ),
        ],
      ),
    );
  }
}
