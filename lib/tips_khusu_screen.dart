import 'package:flutter/material.dart';

class TipsKhusuScreen extends StatelessWidget {
  const TipsKhusuScreen({super.key});

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
            child: const Text(
              'Tips Agar Sholat Khusu:',
              style: TextStyle(
                fontSize: 24.0,
                fontWeight: FontWeight.bold,
                color: Colors.deepPurple,
              ),
              textAlign: TextAlign.center,
            ),
          ),
          const SizedBox(height: 20.0),
          const Divider(thickness: 2.0, color: Colors.deepPurple),
          const SizedBox(height: 20.0),

          // Group 1: Practical Tips
          ExpansionTile(
            title: const Text(
              '1. Tips Praktis',
              style: TextStyle(
                fontSize: 20.0,
                fontWeight: FontWeight.bold,
                color: Colors.black87,
              ),
            ),
            children: [
              Container(
                padding: const EdgeInsets.all(16.0),
                decoration: BoxDecoration(
                  color: Colors.deepPurple.shade50,
                  borderRadius: BorderRadius.circular(12.0),
                ),
                child: const Text(
                  '• Persiapkan diri dengan wudhu yang sempurna.\n'
                  '• Pilih tempat yang tenang dan bebas gangguan.\n'
                  '• Fokuskan niat hanya kepada Allah.\n'
                  '• Hindari gerakan yang tidak perlu.\n'
                  '• Perbanyak dzikir dan doa setelah sholat.',
                  style: TextStyle(fontSize: 18.0, color: Colors.black87),
                  textAlign: TextAlign.justify,
                ),
              ),
            ],
          ),
          const SizedBox(height: 12.0),

          // Group 2: Understanding and Reflection
          ExpansionTile(
            title: const Text(
              '2. Pemahaman dan Refleksi',
              style: TextStyle(
                fontSize: 20.0,
                fontWeight: FontWeight.bold,
                color: Colors.black87,
              ),
            ),
            children: [
              Container(
                padding: const EdgeInsets.all(16.0),
                decoration: BoxDecoration(
                  color: Colors.deepPurple.shade50,
                  borderRadius: BorderRadius.circular(12.0),
                ),
                child: const Text(
                  '• Pahami makna bacaan sholat untuk menghadirkan hati dan pikiran.\n'
                  '• Memahami arti bacaan membantu meningkatkan kekhusyukan.\n'
                  '• Repetisi bacaan yang dipahami dapat memperkuat jalur saraf di otak.\n'
                  '• Sholat dapat melatih pikiran bawah sadar agar lebih dekat kepada Allah.',
                  style: TextStyle(fontSize: 18.0, color: Colors.black87),
                  textAlign: TextAlign.justify,
                ),
              ),
            ],
          ),
          const SizedBox(height: 12.0),

          // Group 3: Spiritual Insights
          ExpansionTile(
            title: const Text(
              '3. Wawasan Spiritual',
              style: TextStyle(
                fontSize: 20.0,
                fontWeight: FontWeight.bold,
                color: Colors.black87,
              ),
            ),
            children: [
              Container(
                padding: const EdgeInsets.all(16.0),
                decoration: BoxDecoration(
                  color: Colors.deepPurple.shade50,
                  borderRadius: BorderRadius.circular(12.0),
                ),
                child: const Text(
                  '• Imam Al-Ghazali menyarankan menghadirkan hati dan mengingat kematian.\n'
                  '• Ibn Qayyim Al-Jawziyyah menekankan mengenal Allah melalui nama-nama-Nya.\n'
                  '• Para sufi mengajarkan untuk mengosongkan pikiran dari duniawi selama sholat.',
                  style: TextStyle(fontSize: 18.0, color: Colors.black87),
                  textAlign: TextAlign.justify,
                ),
              ),
            ],
          ),
          const SizedBox(height: 12.0),

          // Group 4: Scientific Perspectives
          ExpansionTile(
            title: const Text(
              '4. Perspektif Sains',
              style: TextStyle(
                fontSize: 20.0,
                fontWeight: FontWeight.bold,
                color: Colors.black87,
              ),
            ),
            children: [
              Container(
                padding: const EdgeInsets.all(16.0),
                decoration: BoxDecoration(
                  color: Colors.deepPurple.shade50,
                  borderRadius: BorderRadius.circular(12.0),
                ),
                child: const Text(
                  '• Meditasi dan fokus meningkatkan aktivitas di prefrontal cortex.\n'
                  '• Pernapasan dalam selama sholat menurunkan stres dan meningkatkan ketenangan.\n'
                  '• Sholat khusu membawa otak ke kondisi Alpha atau Theta, yang meningkatkan relaksasi dan fokus.\n'
                  '• Gelombang otak Alpha (8-12 Hz) terkait dengan meditasi ringan, sedangkan Theta (4-8 Hz) terkait dengan meditasi mendalam atau hypnosis state.\n'
                  '• Repetisi bacaan sholat yang dipahami dapat memperkuat neuroplasticity, membantu membentuk kebiasaan spiritual yang lebih baik.\n'
                  '• Kondisi ini membantu menurunkan stres, meningkatkan konsentrasi, dan memperkuat hubungan spiritual.',
                  style: TextStyle(fontSize: 18.0, color: Colors.black87),
                  textAlign: TextAlign.justify,
                ),
              ),
            ],
          ),
          const SizedBox(height: 12.0),

          // Group 5: Quran and Hadith References
          ExpansionTile(
            title: const Text(
              '5. Referensi Quran dan Hadits',
              style: TextStyle(
                fontSize: 20.0,
                fontWeight: FontWeight.bold,
                color: Colors.black87,
              ),
            ),
            children: [
              ExpansionTile(
                title: const Text(
                  'Quran',
                  style: TextStyle(
                    fontSize: 18.0,
                    fontWeight: FontWeight.bold,
                    color: Colors.black87,
                  ),
                ),
                children: [
                  Container(
                    padding: const EdgeInsets.all(16.0),
                    decoration: BoxDecoration(
                      color: Colors.deepPurple.shade50,
                      borderRadius: BorderRadius.circular(12.0),
                    ),
                    child: const Text(
                      '• "Sesungguhnya sholat itu mencegah dari perbuatan keji dan mungkar." (QS. Al-Ankabut: 45)\n'
                      '• "Dan dirikanlah sholat, tunaikanlah zakat, dan ruku\'lah beserta orang-orang yang ruku\'." (QS. Al-Baqarah: 43)\n'
                      '• "Peliharalah semua sholat(mu), dan (peliharalah) sholat wustha. Berdirilah untuk Allah (dalam sholatmu) dengan khusyuk." (QS. Al-Baqarah: 238)\n'
                      '• "Dan perintahkanlah kepada keluargamu mendirikan sholat dan bersabarlah kamu dalam mengerjakannya." (QS. Thaha: 132)\n'
                      '• "Dan dirikanlah sholat untuk mengingat-Ku." (QS. Thaha: 14)\n'
                      '• "Sesungguhnya beruntunglah orang-orang yang beriman, yaitu orang-orang yang khusyuk dalam sholatnya." (QS. Al-Mu’minun: 1-2)',
                      style: TextStyle(fontSize: 18.0, color: Colors.black87),
                      textAlign: TextAlign.justify,
                    ),
                  ),
                ],
              ),
              ExpansionTile(
                title: const Text(
                  'Hadits',
                  style: TextStyle(
                    fontSize: 18.0,
                    fontWeight: FontWeight.bold,
                    color: Colors.black87,
                  ),
                ),
                children: [
                  Container(
                    padding: const EdgeInsets.all(16.0),
                    decoration: BoxDecoration(
                      color: Colors.deepPurple.shade50,
                      borderRadius: BorderRadius.circular(12.0),
                    ),
                    child: const Text(
                      '• Rasulullah SAW bersabda: "Sholatlah seperti kalian melihat aku sholat." (HR. Bukhari)\n'
                      '• "Amalan yang paling dicintai oleh Allah adalah sholat pada waktunya." (HR. Bukhari dan Muslim)\n'
                      '• "Perbedaan antara seorang muslim dan kafir adalah meninggalkan sholat." (HR. Muslim)\n'
                      '• "Barang siapa menjaga sholat, maka sholat itu akan menjadi cahaya, bukti, dan keselamatan baginya pada hari kiamat." (HR. Ahmad)\n'
                      '• "Sholat adalah tiang agama. Barang siapa mendirikannya, maka ia telah menegakkan agama." (HR. Baihaqi)\n'
                      '• "Sesungguhnya sholat yang pertama kali dihisab dari seorang hamba pada hari kiamat adalah sholatnya." (HR. Abu Dawud)',
                      style: TextStyle(fontSize: 18.0, color: Colors.black87),
                      textAlign: TextAlign.justify,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
