import 'package:flutter/material.dart';

class DoaScreen extends StatelessWidget {
  const DoaScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final List<Map<String, String>> doaContent = [
      {
        "title": "Pembuka: Hamdalah dan Shalawat",
        "arabic":
            "الْحَمْدُ لِلَّهِ رَبِّ الْعَالَمِينَ، وَالصَّلَاةُ وَالسَّلَامُ عَلَىٰ أَشْرَفِ الْأَنْبِيَاءِ وَالْمُرْسَلِينَ، نَبِيِّنَا مُحَمَّدٍ وَعَلَىٰ آلِهِ وَصَحْبِهِ أَجْمَعِينَ",
        "transliteration":
            "Alhamdulillahi Rabbil-'alamin, wa as-salatu wa as-salamu 'ala ashrafil-anbiya'i wal-mursalin, nabiyyina Muhammadin wa 'ala alihi wa sahbihi ajma'in.",
        "indonesian":
            "Segala puji bagi Allah, Tuhan semesta alam, salawat dan salam atas penghulu para nabi dan rasul, Nabi kami Muhammad, beserta keluarga dan seluruh sahabatnya.",
        "english":
            "All praise is due to Allah, the Lord of the worlds. Blessings and peace be upon the most noble of prophets and messengers, our Prophet Muhammad, and upon his family and all his companions.",
      },
      {
        "title": "Istighfar (3x)",
        "arabic": "أَسْتَغْفِرُ اللَّهَ",
        "transliteration": "Astaghfirullah",
        "indonesian": "Aku memohon ampun kepada Allah.",
        "english": "I seek forgiveness from Allah.",
      },
      {
        "title": "Doa Keselamatan",
        "arabic": "اللَّهُمَّ احْفَظْنَا وَاجْعَلْنَا فِي أَمَانِكَ",
        "transliteration": "Allahumma ihfazna wa aj‘alna fi amanik",
        "indonesian":
            "Ya Allah, lindungilah kami dan jadikan kami dalam penjagaan-Mu.",
        "english": "O Allah, protect us and place us in Your care.",
      },
      {
        "title": "Ayat Kursi (1x)",
        "arabic":
            "اللَّهُ لَا إِلَٰهَ إِلَّا هُوَ الْحَيُّ الْقَيُّومُ ۚ لَا تَأْخُذُهُ سِنَةٌ وَلَا نَوْمٌ ۚ لَهُ مَا فِي السَّمَاوَاتِ وَمَا فِي الْأَرْضِ ۗ مَنْ ذَا الَّذِي يَشْفَعُ عِنْدَهُ إِلَّا بِإِذْنِهِ ۚ يَعْلَمُ مَا بَيْنَ أَيْدِيهِمْ وَمَا خَلْفَهُمْ ۖ وَلَا يُحِيطُونَ بِشَيْءٍ مِنْ عِلْمِهِ إِلَّا بِمَا شَاءَ ۚ وَسِعَ كُرْسِيُّهُ السَّمَاوَاتِ وَالْأَرْضَ ۖ وَلَا يَئُودُهُ حِفْظُهُمَا ۚ وَهُوَ الْعَلِيُّ الْعَظِيمُ",
        "transliteration":
            "Allahu la ilaha illa huwa al-hayyul-qayyum. La ta’khudhuhu sinatun wa la nawm. Lahu ma fi as-samawati wa ma fi al-ardh. Man dha alladhi yashfa‘u ‘indahu illa bi-idhnihi. Ya‘lamu ma bayna aydihim wa ma khalfahum, wa la yuhituna bi-shay’in min ‘ilmihi illa bima sha’a. Wasi‘a kursiyyuhu as-samawati wa al-ardh, wa la ya’uduhu hifdhuhuma wa huwa al-‘aliyyu al-‘azhim.",
        "indonesian":
            "Allah, tidak ada Tuhan selain Dia, Yang Maha Hidup, Yang terus-menerus mengurus (makhluk-Nya). Tidak mengantuk dan tidak tidur. Milik-Nya apa yang ada di langit dan di bumi. Tidak ada yang dapat memberi syafaat di sisi-Nya tanpa izin-Nya. Dia mengetahui apa yang di hadapan mereka dan apa yang di belakang mereka, dan mereka tidak mengetahui apa pun tentang ilmu-Nya kecuali apa yang Dia kehendaki. Kursi-Nya meliputi langit dan bumi. Dia tidak merasa berat memelihara keduanya. Dan Dia Maha Tinggi, Maha Besar.",
        "english":
            "Allah! There is no deity except Him, the Ever-Living, the Sustainer of [all] existence. Neither drowsiness overtakes Him nor sleep. To Him belongs whatever is in the heavens and whatever is on the earth. Who is it that can intercede with Him except by His permission? He knows what is [presently] before them and what will be after them, and they encompass not a thing of His knowledge except for what He wills. His Kursi extends over the heavens and the earth, and their preservation tires Him not. And He is the Most High, the Most Great.",
      },
      {
        "title": "Tasbih, Tahmid, Takbir (33x masing-masing)",
        "arabic": "سُبْحَانَ اللَّهِ، الْحَمْدُ لِلَّهِ، اللَّهُ أَكْبَرُ",
        "transliteration": "Subhanallah, Alhamdulillah, Allahu Akbar",
        "indonesian":
            "Maha Suci Allah, Segala puji bagi Allah, Allah Maha Besar.",
        "english":
            "Glory be to Allah, All praise is due to Allah, Allah is the Greatest.",
      },
      {
        "title": "Doa untuk Kecerdasan",
        "arabic": "رَبِّ زِدْنِي عِلْمًا",
        "transliteration": "Rabbi zidni ilma",
        "indonesian": "Ya Tuhanku, tambahkanlah aku ilmu.",
        "english": "My Lord, increase me in knowledge.",
      },
      {
        "title": "Doa untuk Anak Sholeh",
        "arabic": "رَبِّ اجْعَلْنِي مُقِيمَ الصَّلَاةِ وَمِنْ ذُرِّيَّتِي",
        "transliteration": "Rabbi aj‘alni muqimas-salati wa min dhurriyati",
        "indonesian":
            "Ya Tuhanku, jadikanlah aku dan anak keturunanku orang yang mendirikan salat.",
        "english":
            "My Lord, make me and my descendants those who establish prayer.",
      },
      {
        "title": "Doa untuk Almarhum Keluarga",
        "arabic": "اللَّهُمَّ اغْفِرْ لَهُمْ وَارْحَمْهُمْ",
        "transliteration": "Allahumma aghfir lahum warhamhum",
        "indonesian": "Ya Allah, ampunilah mereka dan rahmatilah mereka.",
        "english": "O Allah, forgive them and have mercy on them.",
      },
      {
        "title": "Doa untuk Orang Tua",
        "arabic": "رَبِّ ارْحَمْهُمَا كَمَا رَبَّيَانِي صَغِيرًا",
        "transliteration": "Rabbi irhamhuma kama rabbayani saghira",
        "indonesian":
            "Ya Tuhanku, sayangilah mereka sebagaimana mereka menyayangiku di waktu kecil.",
        "english":
            "My Lord, have mercy upon them as they brought me up when I was small.",
      },
      {
        "title": "Doa untuk Keluarga",
        "arabic":
            "رَبَّنَا هَبْ لَنَا مِنْ أَزْوَاجِنَا وَذُرِّيَّاتِنَا قُرَّةَ أَعْيُنٍ",
        "transliteration":
            "Rabbana hablana min azwajina wa dhurriyatina qurrata a'yun",
        "indonesian":
            "Ya Tuhan kami, anugerahkanlah kepada kami pasangan dan keturunan yang menyejukkan hati.",
        "english":
            "Our Lord, grant us from among our spouses and offspring comfort to our eyes.",
      },
      {
        "title": "Doa untuk Mereka yang Berjuang di Jalan Allah",
        "arabic": "رَبَّنَا أَفْرِغْ عَلَيْنَا صَبْرًا وَثَبِّتْ أَقْدَامَنَا",
        "transliteration": "Rabbana afrigh alayna sabran wa thabbit aqdamana",
        "indonesian":
            "Ya Tuhan kami, limpahkanlah kesabaran kepada kami dan teguhkanlah pendirian kami.",
        "english": "Our Lord, pour upon us patience and plant firmly our feet.",
      },
      {
        "title": "Doa untuk Rezeki yang Banyak",
        "arabic": "اللَّهُمَّ ارْزُقْنَا رِزْقًا وَاسِعًا حَلَالًا طَيِّبًا",
        "transliteration": "Allahumma arzuqna rizqan wasi‘an halal-an tayyiban",
        "indonesian":
            "Ya Allah, berikanlah kami rezeki yang luas, halal, dan baik.",
        "english":
            "O Allah, provide us with abundant, lawful, and good sustenance.",
      },
      {
        "title": "Doa untuk Kesehatan",
        "arabic": "اللَّهُمَّ اشْفِنَا شِفَاءً لَا يُغَادِرُ سَقَمًا",
        "transliteration": "Allahumma ishfina shifa'an la yughadiru saqama",
        "indonesian":
            "Ya Allah, sembuhkanlah kami dengan kesembuhan yang tidak meninggalkan penyakit.",
        "english": "O Allah, heal us with a healing that leaves no illness.",
      },
      {
        "title": "Doa untuk Keselamatan Dunia Akhirat dan Masuk Surga",
        "arabic":
            "رَبَّنَا آتِنَا فِي الدُّنْيَا حَسَنَةً وَفِي الْآخِرَةِ حَسَنَةً",
        "transliteration":
            "Rabbana atina fid-dunya hasanatan wa fil-akhirati hasanatan",
        "indonesian":
            "Ya Tuhan kami, berikanlah kami kebaikan di dunia dan kebaikan di akhirat.",
        "english":
            "Our Lord, give us good in this world and good in the Hereafter.",
      },
      {
        "title": "Doa Sapu Jagat",
        "arabic": "اللَّهُمَّ إِنِّي أَسْأَلُكَ الْعَفْوَ وَالْعَافِيَةَ",
        "transliteration": "Allahumma inni as’aluka al-afwa wal-afiyah",
        "indonesian": "Ya Allah, aku memohon ampunan dan keselamatan.",
        "english": "O Allah, I ask You for forgiveness and well-being.",
      },
      {
        "title": "Doa Penutup",
        "arabic": "سُبْحَانَكَ اللَّهُمَّ وَبِحَمْدِكَ",
        "transliteration": "Subhanaka Allahumma wa bihamdika",
        "indonesian": "Maha Suci Engkau, ya Allah, dan segala puji bagi-Mu.",
        "english": "Glory is to You, O Allah, and praise is Yours.",
      },
      {
        "title": "Penutup: Shalawat dan Hamdalah",
        "arabic":
            "اللَّهُمَّ صَلِّ عَلَىٰ مُحَمَّدٍ وَالْحَمْدُ لِلَّهِ رَبِّ الْعَالَمِينَ",
        "transliteration":
            "Allahumma salli 'ala Muhammad walhamdulillahi Rabbil-'alamin",
        "indonesian":
            "Ya Allah, limpahkanlah rahmat kepada Nabi Muhammad dan segala puji bagi Allah, Tuhan semesta alam.",
        "english":
            "O Allah, send blessings upon Muhammad, and all praise is due to Allah, the Lord of the worlds.",
      },
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text('Doa'),
        backgroundColor: Colors.deepPurple,
      ),
      body: ListView.builder(
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
        itemCount: doaContent.length,
        itemBuilder: (context, index) {
          final doa = doaContent[index];
          return Padding(
            padding: const EdgeInsets.only(bottom: 12.0),
            child: Card(
              elevation: 6,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12.0),
              ),
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      doa['title']!,
                      style: const TextStyle(
                        fontSize: 20.0,
                        fontWeight: FontWeight.bold,
                        color: Colors.deepPurple,
                      ),
                    ),
                    const Divider(
                      color: Colors.deepPurple,
                      thickness: 1.0,
                      height: 16.0,
                    ),
                    Text(
                      doa['arabic']!,
                      style: const TextStyle(
                        fontSize: 24.0,
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                      ),
                      textAlign: TextAlign.right,
                    ),
                    const SizedBox(height: 8.0),
                    Text(
                      doa['transliteration']!,
                      style: const TextStyle(
                        fontSize: 16.0,
                        fontStyle: FontStyle.italic,
                        color: Colors.grey,
                      ),
                    ),
                    const SizedBox(height: 8.0),
                    Text(
                      doa['indonesian']!,
                      style: const TextStyle(
                        fontSize: 16.0,
                        color: Colors.black87,
                      ),
                    ),
                    if (doa.containsKey('english')) const SizedBox(height: 8.0),
                    if (doa.containsKey('english'))
                      Text(
                        doa['english']!,
                        style: const TextStyle(
                          fontSize: 16.0,
                          color: Colors.black54,
                        ),
                      ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
