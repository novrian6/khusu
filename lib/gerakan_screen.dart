import 'package:flutter/material.dart';
import 'gerakan_detail_screen.dart'; // Import the detail screen
import 'berdiri_tegak_screen.dart'; // Import BerdiriTegakScreen

class GerakanScreen extends StatelessWidget {
  const GerakanScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Gerakan Sholat'),
        backgroundColor: Colors.deepPurple,
      ),
      body: ListView(
        padding: const EdgeInsets.all(16.0),
        children: [
          ListTile(
            leading: const Icon(Icons.directions_run),
            title: const Text('Niat'),
            subtitle: const Text('Melafalkan niat untuk sholat.'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder:
                      (context) => const GerakanDetailScreen(
                        title: 'Niat',
                        description: 'Melafalkan niat untuk sholat.',
                        arabicText:
                            'أُصَلِّي فَرْضَ الظُّهْرِ أَرْبَعَ رَكَعَاتٍ مُسْتَقْبِلَ الْقِبْلَةِ أَدَاءً لِلّٰهِ تَعَالَى',
                        transliteration:
                            'Ushalli fardhazh-zhuhri arba\'a raka\'atin mustaqbilal qiblati adaa-an lillaahi ta\'aala',
                        indonesianTranslation:
                            'Saya berniat sholat fardhu Dzuhur empat rakaat menghadap kiblat karena Allah Ta\'ala.',
                        englishTranslation:
                            'I intend to perform the obligatory prayer of Dhuhr, four rakats, facing the Qibla, for the sake of Allah Ta\'ala.',
                      ),
                ),
              );
            },
          ),
          ListTile(
            leading: const Icon(Icons.directions_run),
            title: const Text('Takbiratul Ihram'),
            subtitle: const Text(
              'Mengangkat kedua tangan sambil mengucapkan takbir.',
            ),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder:
                      (context) => const GerakanDetailScreen(
                        title: 'Takbiratul Ihram',
                        description:
                            'Mengangkat kedua tangan sambil mengucapkan takbir.',
                        arabicText: 'اللَّهُ أَكْبَرُ',
                        transliteration: 'Allahu Akbar',
                        indonesianTranslation: 'Allah Maha Besar.',
                        englishTranslation: 'Allah is the Greatest.',
                      ),
                ),
              );
            },
          ),
          ListTile(
            leading: const Icon(Icons.directions_run),
            title: const Text('Doa Iftitah'),
            subtitle: const Text('Membaca doa iftitah sebelum Al-Fatihah.'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder:
                      (context) => const GerakanDetailScreen(
                        title: 'Doa Iftitah',
                        description: 'Membaca doa iftitah sebelum Al-Fatihah.',
                        arabicText:
                            'إِنِّي وَجَّهْتُ وَجْهِيَ لِلَّذِي فَطَرَ السَّمَاوَاتِ وَالْأَرْضَ حَنِيفًا مُسْلِمًا وَمَا أَنَا مِنَ الْمُشْرِكِينَ',
                        transliteration:
                            'Inni wajjahtu wajhiya lilladzii fatharas samaawaati wal-ardha haniifan musliman wa maa ana minal musyrikiin',
                        indonesianTranslation:
                            'Sesungguhnya aku menghadapkan wajahku kepada Allah yang menciptakan langit dan bumi dengan lurus dan berserah diri, dan aku bukanlah termasuk orang-orang yang mempersekutukan-Nya.',
                        englishTranslation:
                            'Indeed, I have turned my face toward Allah, who created the heavens and the earth, inclining toward truth, and I am not of those who associate others with Him.',
                      ),
                ),
              );
            },
          ),
          ListTile(
            leading: const Icon(Icons.directions_run),
            title: const Text('Berdiri Tegak'),
            subtitle: const Text('Membaca surat Al-Fatihah dan surat pendek.'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const BerdiriTegakScreen(),
                ),
              );
            },
          ),
          ListTile(
            leading: const Icon(Icons.directions_run),
            title: const Text('Rukuk'),
            subtitle: const Text(
              'Membungkuk dengan tangan di lutut sambil membaca doa rukuk.',
            ),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder:
                      (context) => const GerakanDetailScreen(
                        title: 'Rukuk',
                        description:
                            'Membungkuk dengan tangan di lutut sambil membaca doa rukuk.',
                        arabicText: 'سُبْحَانَ رَبِّيَ الْعَظِيمِ وَبِحَمْدِهِ',
                        transliteration:
                            'Subhaana Rabbiyal Adziimi wa bihamdih',
                        indonesianTranslation:
                            'Maha Suci Tuhanku Yang Maha Agung dan dengan memuji-Nya.',
                        englishTranslation:
                            'Glory is to my Lord, the Most Great, and with His praise.',
                      ),
                ),
              );
            },
          ),
          ListTile(
            leading: const Icon(Icons.directions_run),
            title: const Text('I\'tidal'),
            subtitle: const Text(
              'Berdiri tegak kembali sambil membaca doa i\'tidal.',
            ),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder:
                      (context) => const GerakanDetailScreen(
                        title: 'I\'tidal',
                        description:
                            'Berdiri tegak kembali sambil membaca doa i\'tidal.',
                        arabicText:
                            'سَمِعَ اللّٰهُ لِمَنْ حَمِدَهُ رَبَّنَا لَكَ الْحَمْدُ مِلْءَ السَّمَاوَاتِ وَمِلْءَ الْأَرْضِ وَمِلْءَ مَا شِئْتَ مِنْ شَيْءٍ بَعْدُ',
                        transliteration:
                            'Sami\'a Allahu liman hamidah, Rabbanaa lakal hamd, mil-as samaawaati wa mil-al ardhi wa mil-a maa shi’ta min shay-in ba’du',
                        indonesianTranslation:
                            'Allah mendengar orang yang memuji-Nya. Ya Tuhan kami, bagi-Mu segala puji, sepenuh langit, sepenuh bumi, dan sepenuh apa saja yang Engkau kehendaki setelah itu.',
                        englishTranslation:
                            'Allah hears those who praise Him. Our Lord, to You belongs all praise, as much as the heavens and the earth and as much as You will beyond that.',
                      ),
                ),
              );
            },
          ),
          ListTile(
            leading: const Icon(Icons.directions_run),
            title: const Text('Sujud'),
            subtitle: const Text(
              'Bersujud dengan tujuh anggota tubuh menyentuh lantai.',
            ),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder:
                      (context) => const GerakanDetailScreen(
                        title: 'Sujud',
                        description:
                            'Bersujud dengan tujuh anggota tubuh menyentuh lantai.',
                        arabicText: 'سُبْحَانَ رَبِّيَ الْأَعْلَى وَبِحَمْدِهِ',
                        transliteration: 'Subhaana Rabbiyal A\'laa wa bihamdih',
                        indonesianTranslation:
                            'Maha Suci Tuhanku Yang Maha Tinggi dan dengan memuji-Nya.',
                        englishTranslation:
                            'Glory is to my Lord, the Most High, and with His praise.',
                      ),
                ),
              );
            },
          ),
          ListTile(
            leading: const Icon(Icons.directions_run),
            title: const Text('Duduk di Antara Dua Sujud'),
            subtitle: const Text(
              'Duduk sambil membaca doa di antara dua sujud.',
            ),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder:
                      (context) => const GerakanDetailScreen(
                        title: 'Duduk di Antara Dua Sujud',
                        description:
                            'Duduk sambil membaca doa di antara dua sujud.',
                        arabicText:
                            'رَبِّ اغْفِرْ لِي وَارْحَمْنِي وَاجْبُرْنِي وَارْفَعْنِي وَارْزُقْنِي وَاهْدِنِي وَعَافِنِي وَاعْفُ عَنِّي',
                        transliteration:
                            'Rabbighfir lii, warhamnii, wajburnii, warfa\'nii, warzuqnii, wahdinii, wa\'aafinii, wa\'fu \'annii',
                        indonesianTranslation:
                            'Ya Allah, ampunilah aku, rahmatilah aku, cukupkanlah aku, angkatlah derajatku, berilah aku rezeki, berilah aku petunjuk, sehatkanlah aku, dan maafkanlah aku.',
                        englishTranslation:
                            'O Allah, forgive me, have mercy on me, strengthen me, raise my rank, provide for me, guide me, grant me health, and pardon me.',
                      ),
                ),
              );
            },
          ),
          ListTile(
            leading: const Icon(Icons.directions_run),
            title: const Text('Tasyahud Awal'),
            subtitle: const Text(
              'Duduk membaca tasyahud awal pada rakaat kedua.',
            ),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder:
                      (context) => const GerakanDetailScreen(
                        title: 'Tasyahud Awal',
                        description:
                            'Duduk membaca tasyahud awal pada rakaat kedua.',
                        arabicText:
                            'التَّحِيَّاتُ الْمُبَارَكَاتُ الصَّلَوَاتُ الطَّيِّبَاتُ لِلّٰهِ. السَّلَامُ عَلَيْكَ أَيُّهَا النَّبِيُّ وَرَحْمَةُ اللّٰهِ وَبَرَكَاتُهُ. السَّلَامُ عَلَيْنَا وَعَلَىٰ عِبَادِ اللّٰهِ الصَّالِحِينَ. أَشْهَدُ أَنْ لَا إِلٰهَ إِلَّا اللّٰهُ وَأَشْهَدُ أَنَّ مُحَمَّدًا رَسُولُ اللّٰهِ.',
                        transliteration:
                            'Attahiyyaatul mubaarakaatush shalawaatuth thayyibaatu lillaah. Assalaamu \'alaika ayyuhan-nabiyyu wa rahmatullaahi wa barakaatuh. Assalaamu \'alainaa wa \'alaa \'ibaadillaahis-saaliheen. Ashhadu allaa ilaaha illallaah wa ashhadu anna Muhammadan rasuulullaah.',
                        indonesianTranslation:
                            'Segala penghormatan, keberkahan, shalawat, dan kebaikan hanya milik Allah. Salam sejahtera atasmu, wahai Nabi, beserta rahmat Allah dan keberkahan-Nya. Salam sejahtera atas kami dan atas hamba-hamba Allah yang saleh. Aku bersaksi bahwa tidak ada Tuhan selain Allah, dan aku bersaksi bahwa Muhammad adalah utusan Allah.',
                        englishTranslation:
                            'All greetings, blessings, prayers, and good deeds are for Allah. Peace be upon you, O Prophet, and the mercy of Allah and His blessings. Peace be upon us and upon the righteous servants of Allah. I bear witness that there is no deity but Allah, and I bear witness that Muhammad is the Messenger of Allah.',
                      ),
                ),
              );
            },
          ),
          ListTile(
            leading: const Icon(Icons.directions_run),
            title: const Text('Tasyahud Akhir'),
            subtitle: const Text(
              'Duduk membaca tasyahud akhir pada rakaat terakhir.',
            ),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder:
                      (context) => const GerakanDetailScreen(
                        title: 'Tasyahud Akhir',
                        description:
                            'Duduk membaca tasyahud akhir pada rakaat terakhir.',
                        arabicText:
                            'التَّحِيَّاتُ الْمُبَارَكَاتُ الصَّلَوَاتُ الطَّيِّبَاتُ لِلّٰهِ. السَّلَامُ عَلَيْكَ أَيُّهَا النَّبِيُّ وَرَحْمَةُ اللّٰهِ وَبَرَكَاتُهُ. السَّلَامُ عَلَيْنَا وَعَلَىٰ عِبَادِ اللّٰهِ الصَّالِحِينَ. أَشْهَدُ أَنْ لَا إِلٰهَ إِلَّا اللّٰهُ وَأَشْهَدُ أَنَّ مُحَمَّدًا رَسُولُ اللّٰهِ. اللّٰهُمَّ صَلِّ عَلَىٰ مُحَمَّدٍ وَعَلَىٰ آلِ مُحَمَّدٍ كَمَا صَلَّيْتَ عَلَىٰ إِبْرَاهِيمَ وَعَلَىٰ آلِ إِبْرَاهِيمَ. وَبَارِكْ عَلَىٰ مُحَمَّدٍ وَعَلَىٰ آلِ مُحَمَّدٍ كَمَا بَارَكْتَ عَلَىٰ إِبْرَاهِيمَ وَعَلَىٰ آلِ إِبْرَاهِيمَ. فِي الْعَالَمِينَ إِنَّكَ حَمِيدٌ مَجِيدٌ.',
                        transliteration:
                            'Attahiyyaatul mubaarakaatush shalawaatuth thayyibaatu lillaah. Assalaamu \'alaika ayyuhan-nabiyyu wa rahmatullaahi wa barakaatuh. Assalaamu \'alainaa wa \'alaa \'ibaadillaahis-saaliheen. Ashhadu allaa ilaaha illallaah wa ashhadu anna Muhammadan rasuulullaah. Allaahumma salli \'alaa Muhammadin wa \'alaa aali Muhammadin kamaa sallayta \'alaa Ibraahiima wa \'alaa aali Ibraahiim. Wabaarik \'alaa Muhammadin wa \'alaa aali Muhammadin kamaa baarakta \'alaa Ibraahiima wa \'alaa aali Ibraahiim. Fil \'aalamiina innaka hamiidum majiid.',
                        indonesianTranslation:
                            'Segala penghormatan, keberkahan, shalawat, dan kebaikan hanya milik Allah. Salam sejahtera atasmu, wahai Nabi, beserta rahmat Allah dan keberkahan-Nya. Salam sejahtera atas kami dan atas hamba-hamba Allah yang saleh. Aku bersaksi bahwa tidak ada Tuhan selain Allah, dan aku bersaksi bahwa Muhammad adalah utusan Allah. Ya Allah, limpahkanlah rahmat kepada Muhammad dan keluarga Muhammad sebagaimana Engkau telah melimpahkan rahmat kepada Ibrahim dan keluarga Ibrahim. Limpahkanlah keberkahan kepada Muhammad dan keluarga Muhammad sebagaimana Engkau telah melimpahkan keberkahan kepada Ibrahim dan keluarga Ibrahim. Di seluruh alam semesta, sesungguhnya Engkau Maha Terpuji lagi Maha Mulia.',
                        englishTranslation:
                            'All greetings, blessings, prayers, and good deeds are for Allah. Peace be upon you, O Prophet, and the mercy of Allah and His blessings. Peace be upon us and upon the righteous servants of Allah. I bear witness that there is no deity but Allah, and I bear witness that Muhammad is the Messenger of Allah. O Allah, send blessings upon Muhammad and the family of Muhammad as You sent blessings upon Ibrahim and the family of Ibrahim. And send blessings upon Muhammad and the family of Muhammad as You sent blessings upon Ibrahim and the family of Ibrahim. In all the worlds, indeed You are Praiseworthy and Glorious.',
                      ),
                ),
              );
            },
          ),
          ListTile(
            leading: const Icon(Icons.directions_run),
            title: const Text('Salam'),
            subtitle: const Text('Mengucapkan salam ke kanan dan ke kiri.'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder:
                      (context) => const GerakanDetailScreen(
                        title: 'Salam',
                        description: 'Mengucapkan salam ke kanan dan ke kiri.',
                        arabicText:
                            'السَّلَامُ عَلَيْكُمْ وَرَحْمَةُ اللّٰهِ وَبَرَكَاتُهُ',
                        transliteration:
                            'Assalaamu \'alaikum wa rahmatullaahi wa barakaatuh',
                        indonesianTranslation:
                            'Salam sejahtera, rahmat Allah, dan keberkahan-Nya.',
                        englishTranslation:
                            'Peace be upon you, and the mercy of Allah and His blessings.',
                      ),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
