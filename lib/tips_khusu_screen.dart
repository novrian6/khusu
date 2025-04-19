import 'package:flutter/material.dart';

class TipsKhusuScreen extends StatelessWidget {
  const TipsKhusuScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Tips Sholat Khusyu',
              style: TextStyle(
                fontSize: 22,
                fontWeight: FontWeight.bold,
                color: Colors.deepPurple,
              ),
            ),
            const SizedBox(height: 16),

            // Mindfulness section
            _buildTipSection(
              context,
              'Mindfulness dalam Sholat',
              'Hadirkan kesadaran penuh (mindfulness) saat sholat dengan:',
              [
                'Fokuskan pikiran hanya pada Allah SWT dan ibadah yang sedang dilakukan',
                'Alihkan semua pikiran duniawi dan kesibukan sehari-hari',
                'Rasakan setiap gerakan tubuh dan aliran nafas saat sholat',
                'Saat pikiran mulai melayang, lembutkan hati dan kembalikan fokus pada sholat',
                'Latih mindfulness secara bertahap, mulai dari 1-2 menit hingga penuh waktu sholat',
              ],
              Icons.psychology,
            ),

            // Understanding recitation section
            _buildTipSection(
              context,
              'Pemahaman Bacaan Sholat',
              'Tingkatkan khusyu dengan memahami bacaan:',
              [
                'Pelajari arti dari setiap bacaan dalam sholat',
                'Ketahui konteks dan makna mendalam dari surat yang dibaca',
                'Tadabbur (renungkan) makna Al-Fatihah dan surat yang dibaca',
                'Coba variasikan bacaan surat pendek dengan mendalami artinya',
                'Gunakan waktu luang untuk memperdalam pemahaman bacaan sholat',
              ],
              Icons.menu_book,
            ),

            // Feeling the meaning section
            _buildTipSection(
              context,
              'Merasakan Makna Bacaan',
              'Rasakan makna bacaan dalam hati:',
              [
                'Hayati setiap pujian kepada Allah saat mengucap "Subhanallah" atau "Alhamdulillah"',
                'Rasakan kerendahan diri di hadapan Allah saat rukuk dan sujud',
                'Bayangkan bahwa Allah mendengar dan melihat shalatmu',
                'Tanamkan perasaan takut (khauf) dan berharap (raja\') kepada Allah',
                'Saat membaca doa, rasakan seperti berdialog langsung dengan Allah SWT',
              ],
              Icons.favorite,
            ),

            // Preparation section
            _buildTipSection(
              context,
              'Persiapan Sebelum Sholat',
              'Persiapkan diri sebelum sholat:',
              [
                'Berwudhu dengan sempurna dan merasakan setiap basuhan',
                'Pastikan pakaian, tempat, dan waktu sudah siap untuk sholat',
                'Luangkan 2-3 menit untuk menenangkan diri sebelum takbiratul ihram',
                'Tanamkan niat yang benar dan tulus untuk beribadah',
                'Kosongkan pikiran dari urusan dunia dengan mengingat kebesaran Allah',
              ],
              Icons.accessibility_new,
            ),

            // Continuous practice section
            _buildTipSection(
              context,
              'Praktik Berkelanjutan',
              'Tingkatkan khusyu dengan:',
              [
                'Konsisten berlatih setiap hari, kekhusyuan adalah proses bertahap',
                'Evaluasi kualitas sholat setelah selesai',
                'Belajar dari orang-orang yang shalatnya khusyu',
                'Perbanyak dzikir di luar waktu sholat untuk menjaga hati tetap terhubung dengan Allah',
                'Perbaiki amalan sehari-hari karena berpengaruh pada kualitas sholat',
              ],
              Icons.loop,
            ),

            const SizedBox(height: 24),
            const Center(
              child: Text(
                '"Sesungguhnya beruntunglah orang-orang yang beriman, (yaitu) orang yang khusyu dalam shalatnya." (QS. Al-Mu\'minun: 1-2)',
                style: TextStyle(
                  fontStyle: FontStyle.italic,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTipSection(
    BuildContext context,
    String title,
    String intro,
    List<String> points,
    IconData icon,
  ) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 10),
      elevation: 2,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Icon(icon, color: Colors.deepPurple),
                const SizedBox(width: 8),
                Text(
                  title,
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.deepPurple,
                  ),
                ),
              ],
            ),
            const Divider(),
            Text(
              intro,
              style: TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.w500,
                color: Colors.grey[800],
              ),
            ),
            const SizedBox(height: 8),
            ...points
                .map(
                  (point) => Padding(
                    padding: const EdgeInsets.only(bottom: 6),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          '• ',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                          ),
                        ),
                        Expanded(child: Text(point)),
                      ],
                    ),
                  ),
                )
                ,
          ],
        ),
      ),
    );
  }
}
