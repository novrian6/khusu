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
          ExpansionTile(
            title: const Text(
              '1. Tips Umum',
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
                  '• Pahami makna bacaan sholat.\n'
                  '• Hindari gerakan yang tidak perlu.\n'
                  '• Perbanyak dzikir dan doa setelah sholat.',
                  style: TextStyle(fontSize: 18.0, color: Colors.black87),
                  textAlign: TextAlign.justify,
                ),
              ),
            ],
          ),
          const SizedBox(height: 12.0),
          ExpansionTile(
            title: const Text(
              '2. Referensi Quran dan Hadits',
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
                  '• "Sesungguhnya beruntunglah orang-orang yang beriman, '
                  'yaitu orang-orang yang khusyuk dalam sholatnya." (QS. Al-Mu’minun: 1-2)\n'
                  '• Rasulullah SAW bersabda: "Sholatlah seperti kalian melihat aku sholat." (HR. Bukhari)\n'
                  '• "Dan dirikanlah sholat untuk mengingat-Ku." (QS. Thaha: 14)',
                  style: TextStyle(fontSize: 18.0, color: Colors.black87),
                  textAlign: TextAlign.justify,
                ),
              ),
            ],
          ),
          const SizedBox(height: 12.0),
          ExpansionTile(
            title: const Text(
              '3. Tips dari Kitab Ulama dan Sufi',
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
                  '• Imam Al-Ghazali dalam kitab "Ihya Ulumuddin" menyarankan untuk '
                  'menghadirkan hati dan mengingat kematian saat sholat, agar lebih khusyuk.\n'
                  '• Ibn Qayyim Al-Jawziyyah dalam "Madarij As-Salikin" menekankan pentingnya '
                  'mengenal Allah melalui nama-nama dan sifat-sifat-Nya untuk meningkatkan kekhusyukan.\n'
                  '• Para sufi seperti Imam Junaid Al-Baghdadi mengajarkan untuk '
                  'mengosongkan pikiran dari duniawi dan hanya fokus kepada Allah selama sholat.',
                  style: TextStyle(fontSize: 18.0, color: Colors.black87),
                  textAlign: TextAlign.justify,
                ),
              ),
            ],
          ),
          const SizedBox(height: 12.0),
          ExpansionTile(
            title: const Text(
              '4. Referensi Sains dan Neuroscience',
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
                  '• Neuroscience menunjukkan bahwa meditasi dan fokus dapat meningkatkan aktivitas '
                  'di prefrontal cortex, bagian otak yang bertanggung jawab atas konsentrasi dan kontrol diri. '
                  'Sholat yang dilakukan dengan khusyuk memiliki efek serupa dengan meditasi.\n'
                  '• Hypno-science menyarankan penggunaan afirmasi positif sebelum sholat, seperti mengingatkan diri '
                  'bahwa sholat adalah momen untuk mendekatkan diri kepada Allah.\n'
                  '• Penelitian menunjukkan bahwa pernapasan dalam dan teratur selama sholat dapat menurunkan '
                  'tingkat stres dan meningkatkan ketenangan mental.',
                  style: TextStyle(fontSize: 18.0, color: Colors.black87),
                  textAlign: TextAlign.justify,
                ),
              ),
            ],
          ),
          const SizedBox(height: 12.0),
          ExpansionTile(
            title: const Text(
              '5. Frekuensi Gelombang Otak dan Sholat Khusu',
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
                  '• Gelombang otak manusia terbagi menjadi beberapa jenis: Beta, Alpha, Theta, dan Delta. '
                  'Sholat khusu dapat membawa otak ke dalam kondisi Alpha atau Theta, yang merupakan kondisi '
                  'relaksasi mendalam dan fokus tinggi.\n'
                  '• Kondisi Alpha (8-12 Hz) sering dikaitkan dengan keadaan meditasi ringan, di mana pikiran '
                  'tenang dan fokus. Dalam sholat, ini terjadi saat kita membaca ayat-ayat dengan penuh penghayatan.\n'
                  '• Kondisi Theta (4-8 Hz) adalah kondisi yang lebih dalam, sering dikaitkan dengan hypnosis state '
                  'atau meditasi mendalam. Dalam sholat, ini dapat dicapai saat hati benar-benar hadir dan fokus '
                  'pada Allah, menghilangkan gangguan duniawi.\n'
                  '• Penelitian menunjukkan bahwa kondisi ini membantu menurunkan stres, meningkatkan konsentrasi, '
                  'dan memperkuat hubungan spiritual.',
                  style: TextStyle(fontSize: 18.0, color: Colors.black87),
                  textAlign: TextAlign.justify,
                ),
              ),
            ],
          ),
          const SizedBox(height: 12.0),
          ExpansionTile(
            title: const Text(
              '6. Pentingnya Memahami Bacaan Sholat',
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
                  '• Memahami bacaan sholat membantu menghadirkan hati dan pikiran selama ibadah. '
                  'Ketika kita memahami arti dari setiap bacaan, kita lebih mudah untuk fokus dan '
                  'menghayati maknanya, sehingga meningkatkan kekhusyukan.\n'
                  '• Dari sudut pandang neuroscience, repetisi bacaan sholat yang dipahami dapat '
                  'menguatkan jalur saraf di otak, menciptakan pola pikir positif dan rasa tenang. '
                  'Hal ini mirip dengan teknik afirmasi dalam self-hypnosis, di mana pengulangan '
                  'kata-kata positif dapat memengaruhi pikiran bawah sadar.\n'
                  '• Pikiran sadar bertugas memahami arti bacaan, sementara pikiran bawah sadar '
                  'menyerap emosi dan makna yang terkandung dalam bacaan tersebut. Dengan repetisi '
                  'yang konsisten, sholat dapat menjadi sarana untuk melatih pikiran bawah sadar '
                  'agar lebih dekat kepada Allah dan menjauhkan diri dari hal-hal negatif.\n'
                  '• Penelitian menunjukkan bahwa pengulangan yang disertai pemahaman mendalam '
                  'dapat meningkatkan neuroplasticity, yaitu kemampuan otak untuk berubah dan '
                  'beradaptasi, sehingga membantu membentuk kebiasaan spiritual yang lebih baik.',
                  style: TextStyle(fontSize: 18.0, color: Colors.black87),
                  textAlign: TextAlign.justify,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
