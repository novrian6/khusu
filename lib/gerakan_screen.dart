import 'package:flutter/material.dart';
import 'package:khusu/takbiratul_ikhram_screen.dart';
import 'package:khusu/rukuk_screen.dart';
import 'package:khusu/itidal_screen.dart';
import 'package:khusu/sujud_screen.dart';
import 'package:khusu/duduk_antara_sujud_screen.dart';
import 'package:khusu/tasyahud_awal_screen.dart';
import 'package:khusu/tasyahud_akhir_screen.dart';
import 'package:khusu/salam_screen.dart';
import 'package:khusu/iftitah_screen.dart';
import 'package:khusu/berdiri_rakaat_screen.dart';
import 'package:khusu/berdiri_surah_screen.dart';

class GerakanScreen extends StatelessWidget {
  const GerakanScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Gerakan Sholat'),
        backgroundColor: Colors.deepPurple,
        elevation: 0,
      ),
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [Colors.deepPurple, Color(0xFFF5F5F5)],
            stops: [0.0, 0.3],
          ),
        ),
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Padding(
                padding: EdgeInsets.only(bottom: 24.0, left: 8.0),
                child: Text(
                  'Gerakan Sholat',
                  style: TextStyle(
                    fontSize: 28.0,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ),
              _buildSection(
                title: 'Umum',
                children: _buildGestureList(context),
              ),
              const SizedBox(height: 16.0),
              _buildSection(
                title: 'Urutan Gerakan 2 Rakaat',
                children: _build2RakaatList(context),
              ),
              const SizedBox(height: 16.0),
              _buildSection(
                title: 'Urutan Gerakan 3 Rakaat',
                children: _build3RakaatList(context),
              ),
              const SizedBox(height: 16.0),
              _buildSection(
                title: 'Urutan Gerakan 4 Rakaat',
                children: _build4RakaatList(context),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildSection({
    required String title,
    required List<Widget> children,
  }) {
    return Card(
      elevation: 4,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: ExpansionTile(
        initiallyExpanded: title == 'Umum',
        childrenPadding: const EdgeInsets.symmetric(
          horizontal: 16.0,
          vertical: 8.0,
        ),
        title: Text(
          title,
          style: const TextStyle(
            fontSize: 20.0,
            fontWeight: FontWeight.bold,
            color: Colors.deepPurple,
          ),
        ),
        children: children,
      ),
    );
  }

  List<Widget> _buildGestureList(BuildContext context) {
    return [
      _buildNavItem(
        context: context,
        title: 'Takbiratul Ihram',
        screen: const TakbiratulIhramScreen(),
      ),
      _buildNavItem(
        context: context,
        title: 'Berdiri Tegak (Iftitah)',
        screen: const IftitahScreen(),
      ),
      _buildNavItem(
        context: context,
        title: 'Berdiri Tegak (Al-Fatihah)',
        screen: const BerdiriRakaatScreen(),
      ),
      _buildNavItem(
        context: context,
        title: 'Berdiri Tegak (Surah)',
        screen: const BerdiriSurahScreen(),
      ),
      _buildNavItem(
        context: context,
        title: 'Rukuk',
        screen: const RukukScreen(),
      ),
      _buildNavItem(
        context: context,
        title: 'I\'tidal',
        screen: const ItidalScreen(),
      ),
      _buildNavItem(
        context: context,
        title: 'Sujud',
        screen: const SujudScreen(),
      ),
      _buildNavItem(
        context: context,
        title: 'Duduk di antara dua sujud',
        screen: const DudukAntaraSujudScreen(),
      ),
      _buildNavItem(
        context: context,
        title: 'Duduk Tasyahud Awal',
        screen: const TasyahudAwalScreen(),
      ),
      _buildNavItem(
        context: context,
        title: 'Duduk Tasyahud Akhir',
        screen: const TasyahudAkhirScreen(),
      ),
      _buildNavItem(
        context: context,
        title: 'Salam',
        screen: const SalamScreen(),
      ),
    ];
  }

  Widget _buildNavItem({
    required BuildContext context,
    required String title,
    required Widget screen,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6.0),
      child: InkWell(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => screen),
          );
        },
        borderRadius: BorderRadius.circular(8),
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 12.0, horizontal: 8.0),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            border: Border.all(color: Colors.deepPurple.shade100),
            color: Colors.deepPurple.shade50,
          ),
          child: Row(
            children: [
              const Icon(Icons.arrow_right, color: Colors.deepPurple),
              const SizedBox(width: 8),
              Expanded(
                child: Text(
                  title,
                  style: const TextStyle(
                    fontSize: 18.0,
                    color: Colors.deepPurple,
                  ),
                ),
              ),
              const Icon(Icons.navigate_next, color: Colors.deepPurple),
            ],
          ),
        ),
      ),
    );
  }

  List<Widget> _build2RakaatList(BuildContext context) {
    return [
      _buildRakaatHeader('Rakaat Pertama'),
      // Niat (mental intention, not a physical movement but implied)
      _buildNavItem(
        context: context,
        title: 'Takbiratul Ihram',
        screen: const TakbiratulIhramScreen(),
      ),
      _buildNavItem(
        context: context,
        title: 'Berdiri Tegak (Iftitah)',
        screen: const IftitahScreen(),
      ),
      _buildAlFatihahRecitation(context),
      _buildSurahRecitation(context, isWajib: true),
      _buildNavItem(
        context: context,
        title: 'Rukuk',
        screen: const RukukScreen(),
      ),
      _buildNavItem(
        context: context,
        title: 'I\'tidal',
        screen: const ItidalScreen(),
      ),
      _buildNavItem(
        context: context,
        title: 'Sujud',
        screen: const SujudScreen(),
      ),
      _buildNavItem(
        context: context,
        title: 'Duduk di antara dua sujud',
        screen: const DudukAntaraSujudScreen(),
      ),
      _buildNavItem(
        context: context,
        title: 'Sujud',
        screen: const SujudScreen(),
      ),
      const SizedBox(height: 16),

      _buildRakaatHeader('Rakaat Kedua'),
      _buildNavItem(
        context: context,
        title: 'Berdiri Tegak (Al-Fatihah)',
        screen: const BerdiriRakaatScreen(),
      ),
      _buildAlFatihahRecitation(context),
      _buildSurahRecitation(context, isWajib: true),
      _buildNavItem(
        context: context,
        title: 'Rukuk',
        screen: const RukukScreen(),
      ),
      _buildNavItem(
        context: context,
        title: 'I\'tidal',
        screen: const ItidalScreen(),
      ),
      _buildNavItem(
        context: context,
        title: 'Sujud',
        screen: const SujudScreen(),
      ),
      _buildNavItem(
        context: context,
        title: 'Duduk di antara dua sujud',
        screen: const DudukAntaraSujudScreen(),
      ),
      _buildNavItem(
        context: context,
        title: 'Sujud',
        screen: const SujudScreen(),
      ),
      _buildNavItem(
        context: context,
        title: 'Duduk Tasyahud Akhir',
        screen: const TasyahudAkhirScreen(),
      ),
      _buildNavItem(
        context: context,
        title: 'Salam',
        screen: const SalamScreen(),
      ),
    ];
  }

  List<Widget> _build3RakaatList(BuildContext context) {
    return [
      _buildRakaatHeader('Rakaat Pertama'),
      // Niat (implied at the beginning)
      _buildNavItem(
        context: context,
        title: 'Takbiratul Ihram',
        screen: const TakbiratulIhramScreen(),
      ),
      _buildNavItem(
        context: context,
        title: 'Berdiri Tegak (Iftitah)',
        screen: const IftitahScreen(),
      ),
      _buildAlFatihahRecitation(context),
      _buildSurahRecitation(context, isWajib: true),
      _buildNavItem(
        context: context,
        title: 'Rukuk',
        screen: const RukukScreen(),
      ),
      _buildNavItem(
        context: context,
        title: 'I\'tidal',
        screen: const ItidalScreen(),
      ),
      _buildNavItem(
        context: context,
        title: 'Sujud',
        screen: const SujudScreen(),
      ),
      _buildNavItem(
        context: context,
        title: 'Duduk di antara dua sujud',
        screen: const DudukAntaraSujudScreen(),
      ),
      _buildNavItem(
        context: context,
        title: 'Sujud',
        screen: const SujudScreen(),
      ),
      _buildNavItem(
        context: context,
        title: 'Duduk Tasyahud Awal',
        screen: const TasyahudAwalScreen(),
      ),
      const SizedBox(height: 16),

      _buildRakaatHeader('Rakaat Kedua'),
      _buildNavItem(
        context: context,
        title: 'Berdiri Tegak (Al-Fatihah)',
        screen: const BerdiriRakaatScreen(),
      ),
      _buildAlFatihahRecitation(context),
      _buildSurahRecitation(context, isWajib: true),
      _buildNavItem(
        context: context,
        title: 'Rukuk',
        screen: const RukukScreen(),
      ),
      _buildNavItem(
        context: context,
        title: 'I\'tidal',
        screen: const ItidalScreen(),
      ),
      _buildNavItem(
        context: context,
        title: 'Sujud',
        screen: const SujudScreen(),
      ),
      _buildNavItem(
        context: context,
        title: 'Duduk di antara dua sujud',
        screen: const DudukAntaraSujudScreen(),
      ),
      _buildNavItem(
        context: context,
        title: 'Sujud',
        screen: const SujudScreen(),
      ),
      _buildNavItem(
        context: context,
        title: 'Duduk Tasyahud Akhir',
        screen: const TasyahudAkhirScreen(),
      ),
      _buildNavItem(
        context: context,
        title: 'Salam',
        screen: const SalamScreen(),
      ),
      const SizedBox(height: 16),

      _buildRakaatHeader('Rakaat Ketiga'),
      _buildNavItem(
        context: context,
        title: 'Berdiri Tegak (Al-Fatihah)',
        screen: const BerdiriRakaatScreen(),
      ),
      _buildAlFatihahRecitation(context),
      _buildSurahRecitation(context, isWajib: false),
      _buildNavItem(
        context: context,
        title: 'Rukuk',
        screen: const RukukScreen(),
      ),
      _buildNavItem(
        context: context,
        title: 'I\'tidal',
        screen: const ItidalScreen(),
      ),
      _buildNavItem(
        context: context,
        title: 'Sujud',
        screen: const SujudScreen(),
      ),
      _buildNavItem(
        context: context,
        title: 'Duduk di antara dua sujud',
        screen: const DudukAntaraSujudScreen(),
      ),
      _buildNavItem(
        context: context,
        title: 'Sujud',
        screen: const SujudScreen(),
      ),
      _buildNavItem(
        context: context,
        title: 'Duduk Tasyahud Akhir',
        screen: const TasyahudAkhirScreen(),
      ),
      _buildNavItem(
        context: context,
        title: 'Salam',
        screen: const SalamScreen(),
      ),
    ];
  }

  List<Widget> _build4RakaatList(BuildContext context) {
    return [
      _buildRakaatHeader('Rakaat Pertama'),
      // Niat (implied at the beginning)
      _buildNavItem(
        context: context,
        title: 'Takbiratul Ihram',
        screen: const TakbiratulIhramScreen(),
      ),
      _buildNavItem(
        context: context,
        title: 'Berdiri Tegak (Iftitah)',
        screen: const IftitahScreen(),
      ),
      _buildAlFatihahRecitation(context),
      _buildSurahRecitation(context, isWajib: true),
      _buildNavItem(
        context: context,
        title: 'Rukuk',
        screen: const RukukScreen(),
      ),
      _buildNavItem(
        context: context,
        title: 'I\'tidal',
        screen: const ItidalScreen(),
      ),
      _buildNavItem(
        context: context,
        title: 'Sujud',
        screen: const SujudScreen(),
      ),
      _buildNavItem(
        context: context,
        title: 'Duduk di antara dua sujud',
        screen: const DudukAntaraSujudScreen(),
      ),
      _buildNavItem(
        context: context,
        title: 'Sujud',
        screen: const SujudScreen(),
      ),
      const SizedBox(height: 16),

      _buildRakaatHeader('Rakaat Kedua'),
      _buildNavItem(
        context: context,
        title: 'Berdiri Tegak (Al-Fatihah)',
        screen: const BerdiriRakaatScreen(),
      ),
      _buildAlFatihahRecitation(context),
      _buildSurahRecitation(context, isWajib: true),
      _buildNavItem(
        context: context,
        title: 'Rukuk',
        screen: const RukukScreen(),
      ),
      _buildNavItem(
        context: context,
        title: 'I\'tidal',
        screen: const ItidalScreen(),
      ),
      _buildNavItem(
        context: context,
        title: 'Sujud',
        screen: const SujudScreen(),
      ),
      _buildNavItem(
        context: context,
        title: 'Duduk di antara dua sujud',
        screen: const DudukAntaraSujudScreen(),
      ),
      _buildNavItem(
        context: context,
        title: 'Sujud',
        screen: const SujudScreen(),
      ),
      _buildNavItem(
        context: context,
        title: 'Duduk Tasyahud Awal',
        screen: const TasyahudAwalScreen(),
      ),
      const SizedBox(height: 16),

      _buildRakaatHeader('Rakaat Ketiga'),
      _buildNavItem(
        context: context,
        title: 'Berdiri Tegak (Al-Fatihah)',
        screen: const BerdiriRakaatScreen(),
      ),
      _buildAlFatihahRecitation(context),
      _buildSurahRecitation(context, isWajib: false),
      _buildNavItem(
        context: context,
        title: 'Rukuk',
        screen: const RukukScreen(),
      ),
      _buildNavItem(
        context: context,
        title: 'I\'tidal',
        screen: const ItidalScreen(),
      ),
      _buildNavItem(
        context: context,
        title: 'Sujud',
        screen: const SujudScreen(),
      ),
      _buildNavItem(
        context: context,
        title: 'Duduk di antara dua sujud',
        screen: const DudukAntaraSujudScreen(),
      ),
      _buildNavItem(
        context: context,
        title: 'Sujud',
        screen: const SujudScreen(),
      ),
      const SizedBox(height: 16),

      _buildRakaatHeader('Rakaat Keempat'),
      _buildNavItem(
        context: context,
        title: 'Berdiri Tegak (Al-Fatihah)',
        screen: const BerdiriRakaatScreen(),
      ),
      _buildAlFatihahRecitation(context),
      _buildSurahRecitation(context, isWajib: false),
      _buildNavItem(
        context: context,
        title: 'Rukuk',
        screen: const RukukScreen(),
      ),
      _buildNavItem(
        context: context,
        title: 'I\'tidal',
        screen: const ItidalScreen(),
      ),
      _buildNavItem(
        context: context,
        title: 'Sujud',
        screen: const SujudScreen(),
      ),
      _buildNavItem(
        context: context,
        title: 'Duduk di antara dua sujud',
        screen: const DudukAntaraSujudScreen(),
      ),
      _buildNavItem(
        context: context,
        title: 'Sujud',
        screen: const SujudScreen(),
      ),
      _buildNavItem(
        context: context,
        title: 'Duduk Tasyahud Akhir',
        screen: const TasyahudAkhirScreen(),
      ),
      _buildNavItem(
        context: context,
        title: 'Salam',
        screen: const SalamScreen(),
      ),
    ];
  }

  Widget _buildSurahRecitation(BuildContext context, {required bool isWajib}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6.0),
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 12.0, horizontal: 8.0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          border: Border.all(
            color: isWajib ? Colors.deepPurple.shade200 : Colors.amber.shade300,
          ),
          color: isWajib ? Colors.deepPurple.shade50 : Colors.amber.shade50,
        ),
        child: Row(
          children: [
            Icon(
              Icons.menu_book,
              color: isWajib ? Colors.deepPurple : Colors.amber.shade800,
            ),
            const SizedBox(width: 8),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Bacaan Surah setelah Al-Fatihah',
                    style: TextStyle(
                      fontSize: 18.0,
                      fontWeight: FontWeight.bold,
                      color:
                          isWajib ? Colors.deepPurple : Colors.amber.shade800,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    isWajib
                        ? 'Disunnahkan membaca surah atau ayat Al-Quran setelah Al-Fatihah'
                        : 'Boleh membaca surah setelah Al-Fatihah (opsional)',
                    style: TextStyle(
                      fontSize: 14.0,
                      color:
                          isWajib
                              ? Colors.deepPurple.shade700
                              : Colors.amber.shade900,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildRakaatHeader(String title) {
    return Padding(
      padding: const EdgeInsets.only(top: 8.0, bottom: 12.0),
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 12.0),
        decoration: BoxDecoration(
          color: Colors.deepPurple.shade700,
          borderRadius: BorderRadius.circular(8),
        ),
        child: Text(
          title,
          style: const TextStyle(
            fontSize: 18.0,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
      ),
    );
  }

  Widget _buildAlFatihahRecitation(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6.0),
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 12.0, horizontal: 8.0),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          border: Border.all(color: Colors.green.shade300),
          color: Colors.green.shade50,
        ),
        child: Row(
          children: [
            Icon(Icons.menu_book, color: Colors.green.shade800),
            const SizedBox(width: 8),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    'Membaca Al-Fatihah',
                    style: TextStyle(
                      fontSize: 18.0,
                      fontWeight: FontWeight.bold,
                      color: Colors.green.shade800,
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    'Wajib membaca Al-Fatihah pada setiap rakaat',
                    style: TextStyle(
                      fontSize: 14.0,
                      color: Colors.green.shade800,
                    ),
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
