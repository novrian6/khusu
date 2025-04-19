import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class AsmaulHusnaScreen extends StatefulWidget {
  const AsmaulHusnaScreen({super.key});

  @override
  _AsmaulHusnaScreenState createState() => _AsmaulHusnaScreenState();
}

class _AsmaulHusnaScreenState extends State<AsmaulHusnaScreen> {
  List<dynamic> _asmaulHusnaList = [];
  bool _isLoading = true;
  bool _showFadilah = false;

  @override
  void initState() {
    super.initState();
    _loadAsmaulHusna();
  }

  Future<void> _loadAsmaulHusna() async {
    try {
      final String response = await rootBundle.loadString(
        'assets/json/asma/asmaul_husna.json',
      );
      final data = await json.decode(response);

      setState(() {
        _asmaulHusnaList = data['asmaul_husna'];
        _isLoading = false;
      });
    } catch (e) {
      setState(() {
        _isLoading = false;
      });
      print('Error loading Asmaul Husna data: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body:
          _isLoading
              ? Center(child: CircularProgressIndicator())
              : Column(
                children: [
                  // Fadhilah Asmaul Husna Card
                  Card(
                    margin: EdgeInsets.all(16.0),
                    child: Column(
                      children: [
                        ListTile(
                          title: Text(
                            'Fadhilah Asmaul Husna',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 18,
                            ),
                          ),
                          trailing: IconButton(
                            icon: Icon(
                              _showFadilah
                                  ? Icons.keyboard_arrow_up
                                  : Icons.keyboard_arrow_down,
                            ),
                            onPressed: () {
                              setState(() {
                                _showFadilah = !_showFadilah;
                              });
                            },
                          ),
                        ),
                        if (_showFadilah)
                          Padding(
                            padding: const EdgeInsets.all(16.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Text(
                                  'Al-Quran:',
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.deepPurple,
                                  ),
                                ),
                                const SizedBox(height: 8),
                                const Text(
                                  '"Dan Allah memiliki Asmaul Husna (nama-nama yang terbaik), maka bermohonlah kepada-Nya dengan menyebut Asmaul Husna itu." (QS. Al-A\'raf: 180)',
                                  style: TextStyle(fontSize: 14),
                                ),
                                const SizedBox(height: 16),
                                const Text(
                                  'Hadits:',
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.deepPurple,
                                  ),
                                ),
                                const SizedBox(height: 8),
                                const Text(
                                  'Dari Abu Hurairah, Rasulullah SAW bersabda: "Sesungguhnya Allah mempunyai 99 nama, yaitu seratus kurang satu. Barangsiapa yang menghitungnya (menghafal dan mengamalkannya) maka ia akan masuk surga." (HR. Bukhari dan Muslim)',
                                  style: TextStyle(fontSize: 14),
                                ),
                                const SizedBox(height: 16),
                                const Text(
                                  'Keutamaan:',
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    color: Colors.deepPurple,
                                  ),
                                ),
                                const SizedBox(height: 8),
                                const Text(
                                  '1. Jalan menuju surga\n'
                                  '2. Doa yang dipanjatkan dengan Asmaul Husna lebih didengar\n'
                                  '3. Mendapatkan kemudahan dan pertolongan Allah\n'
                                  '4. Meningkatkan iman dan perasaan dekat dengan Allah\n'
                                  '5. Menenangkan hati dan pikiran',
                                  style: TextStyle(fontSize: 14),
                                ),
                              ],
                            ),
                          ),
                      ],
                    ),
                  ),

                  // The list of Asmaul Husna names
                  Expanded(
                    child: ListView.builder(
                      itemCount: _asmaulHusnaList.length,
                      itemBuilder: (context, index) {
                        final item = _asmaulHusnaList[index];
                        return Card(
                          margin: EdgeInsets.symmetric(
                            horizontal: 16.0,
                            vertical: 8.0,
                          ),
                          elevation: 2.0,
                          child: Padding(
                            padding: EdgeInsets.all(16.0),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  children: [
                                    Container(
                                      width: 40,
                                      height: 40,
                                      decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        color: Colors.deepPurple,
                                      ),
                                      child: Center(
                                        child: Text(
                                          '${index + 1}',
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      ),
                                    ),
                                    SizedBox(width: 16),
                                    Expanded(
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            item['transliteration'],
                                            style: TextStyle(
                                              fontSize: 18,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                          Text(
                                            item['indonesian'],
                                            style: TextStyle(
                                              fontSize: 14,
                                              color: Colors.grey[700],
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(height: 12),
                                Center(
                                  child: Text(
                                    item['arabic'],
                                    style: TextStyle(
                                      fontSize: 28,
                                      fontFamily: 'Arial',
                                    ),
                                    textDirection: TextDirection.rtl,
                                  ),
                                ),
                                SizedBox(height: 8),
                                Text(
                                  item['english'],
                                  style: TextStyle(fontStyle: FontStyle.italic),
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                ],
              ),
    );
  }
}
