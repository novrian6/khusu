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

class GerakanScreen extends StatelessWidget {
  const GerakanScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Gerakan Sholat'),
        backgroundColor: Colors.deepPurple,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Gerakan Sholat',
              style: TextStyle(
                fontSize: 24.0,
                fontWeight: FontWeight.bold,
                color: Colors.deepPurple,
              ),
            ),
            const SizedBox(height: 16.0),
            ExpansionTile(
              title: const Text(
                'Umum',
                style: TextStyle(
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.black87,
                ),
              ),
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder:
                                  (context) => const TakbiratulIhramScreen(),
                            ),
                          );
                        },
                        child: const Text(
                          '• Takbiratul Ihram',
                          style: TextStyle(fontSize: 18.0, color: Colors.blue),
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const IftitahScreen(),
                            ),
                          );
                        },
                        child: const Text(
                          '• Berdiri Tegak (Iftitah)',
                          style: TextStyle(fontSize: 18.0, color: Colors.blue),
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const BerdiriRakaatScreen(),
                            ),
                          );
                        },
                        child: const Text(
                          '• Berdiri Tegak (Rakaat)',
                          style: TextStyle(fontSize: 18.0, color: Colors.blue),
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const RukukScreen(),
                            ),
                          );
                        },
                        child: const Text(
                          '• Rukuk',
                          style: TextStyle(fontSize: 18.0, color: Colors.blue),
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const ItidalScreen(),
                            ),
                          );
                        },
                        child: const Text(
                          '• I\'tidal',
                          style: TextStyle(fontSize: 18.0, color: Colors.blue),
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const SujudScreen(),
                            ),
                          );
                        },
                        child: const Text(
                          '• Sujud',
                          style: TextStyle(fontSize: 18.0, color: Colors.blue),
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder:
                                  (context) => const DudukAntaraSujudScreen(),
                            ),
                          );
                        },
                        child: const Text(
                          '• Duduk di antara dua sujud',
                          style: TextStyle(fontSize: 18.0, color: Colors.blue),
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const TasyahudAwalScreen(),
                            ),
                          );
                        },
                        child: const Text(
                          '• Duduk Tasyahud Awal',
                          style: TextStyle(fontSize: 18.0, color: Colors.blue),
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const TasyahudAkhirScreen(),
                            ),
                          );
                        },
                        child: const Text(
                          '• Duduk Tasyahud Akhir',
                          style: TextStyle(fontSize: 18.0, color: Colors.blue),
                        ),
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => const SalamScreen(),
                            ),
                          );
                        },
                        child: const Text(
                          '• Salam',
                          style: TextStyle(fontSize: 18.0, color: Colors.blue),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            ExpansionTile(
              title: const Text(
                '2 Rakaat',
                style: TextStyle(
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.black87,
                ),
              ),
              children: [
                ListTile(
                  title: const Text('Rakaat Pertama'),
                  subtitle: const Text(
                    '• Takbiratul Ihram\n'
                    '• Berdiri Tegak (Iftitah)\n'
                    '• Rukuk\n'
                    '• I\'tidal\n'
                    '• Sujud\n'
                    '• Duduk di antara dua sujud',
                  ),
                ),
                ListTile(
                  title: const Text('Rakaat Kedua'),
                  subtitle: const Text(
                    '• Berdiri Tegak (Rakaat)\n'
                    '• Rukuk\n'
                    '• I\'tidal\n'
                    '• Sujud\n'
                    '• Duduk Tasyahud akhir\n'
                    '• Salam',
                  ),
                ),
              ],
            ),
            ExpansionTile(
              title: const Text(
                '3 Rakaat',
                style: TextStyle(
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.black87,
                ),
              ),
              children: [
                ListTile(
                  title: const Text('Rakaat Pertama'),
                  subtitle: const Text(
                    '• Takbiratul Ihram\n'
                    '• Berdiri Tegak (Iftitah)\n'
                    '• Rukuk\n'
                    '• I\'tidal\n'
                    '• Sujud\n'
                    '• Duduk di antara dua sujud',
                  ),
                ),
                ListTile(
                  title: const Text('Rakaat Kedua'),
                  subtitle: const Text(
                    '• Berdiri Tegak (Rakaat)\n'
                    '• Rukuk\n'
                    '• I\'tidal\n'
                    '• Sujud\n'
                    '• Duduk Tasyahud awal',
                  ),
                ),
                ListTile(
                  title: const Text('Rakaat Ketiga'),
                  subtitle: const Text(
                    '• Berdiri Tegak (Rakaat)\n'
                    '• Rukuk\n'
                    '• I\'tidal\n'
                    '• Sujud\n'
                    '• Duduk Tasyahud akhir\n'
                    '• Salam',
                  ),
                ),
              ],
            ),
            ExpansionTile(
              title: const Text(
                '4 Rakaat',
                style: TextStyle(
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold,
                  color: Colors.black87,
                ),
              ),
              children: [
                ListTile(
                  title: const Text('Rakaat Pertama'),
                  subtitle: const Text(
                    '• Takbiratul Ihram\n'
                    '• Berdiri Tegak (Iftitah)\n'
                    '• Rukuk\n'
                    '• I\'tidal\n'
                    '• Sujud\n'
                    '• Duduk di antara dua sujud',
                  ),
                ),
                ListTile(
                  title: const Text('Rakaat Kedua'),
                  subtitle: const Text(
                    '• Berdiri Tegak (Rakaat)\n'
                    '• Rukuk\n'
                    '• I\'tidal\n'
                    '• Sujud\n'
                    '• Duduk Tasyahud awal',
                  ),
                ),
                ListTile(
                  title: const Text('Rakaat Ketiga'),
                  subtitle: const Text(
                    '• Berdiri Tegak (Rakaat)\n'
                    '• Rukuk\n'
                    '• I\'tidal\n'
                    '• Sujud\n'
                    '• Duduk di antara dua sujud',
                  ),
                ),
                ListTile(
                  title: const Text('Rakaat Keempat'),
                  subtitle: const Text(
                    '• Berdiri Tegak (Rakaat)\n'
                    '• Rukuk\n'
                    '• I\'tidal\n'
                    '• Sujud\n'
                    '• Duduk Tasyahud akhir\n'
                    '• Salam',
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
