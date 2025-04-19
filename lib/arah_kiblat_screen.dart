import 'package:flutter/material.dart';
import 'dart:math' as math;
import 'dart:async';

class ArahKiblatScreen extends StatefulWidget {
  const ArahKiblatScreen({super.key});

  @override
  State<ArahKiblatScreen> createState() => _ArahKiblatScreenState();
}

class _ArahKiblatScreenState extends State<ArahKiblatScreen> {
  // Simulate compass data with a timer (for simulator compatibility)
  double _direction = 0;
  final bool _isSimulator = true;
  Timer? _compassTimer;
  final double _kiblatDirection = 292.53; // Example: Jakarta to Mecca

  @override
  void initState() {
    super.initState();
    // Start the simulated compass if in a simulator
    _startSimulatedCompass();
  }

  @override
  void dispose() {
    _compassTimer?.cancel();
    super.dispose();
  }

  void _startSimulatedCompass() {
    // Use a timer to simulate compass movement
    _compassTimer = Timer.periodic(const Duration(milliseconds: 100), (timer) {
      setState(() {
        // Simulate a gently moving compass
        _direction = (_direction + 2) % 360;
      });
    });
  }

  // Helper for rendering cardinal directions
  Widget _buildDirectionText(
    String text,
    double top,
    double left, {
    Color color = Colors.black,
  }) {
    return Positioned(
      top: top,
      left: left,
      child: Text(
        text,
        style: TextStyle(
          fontWeight: FontWeight.bold,
          fontSize: 18,
          color: color,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Arah Kiblat'),
        backgroundColor: Colors.deepPurple,
      ),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Text(
              'Arah Kiblat',
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),
            Text(
              _isSimulator
                  ? 'Mode Simulasi'
                  : 'Arah Anda: ${_direction.toStringAsFixed(1)}°',
              style: const TextStyle(fontSize: 18),
            ),
            const SizedBox(height: 10),
            Text(
              'Arah Kiblat: ${_kiblatDirection.toStringAsFixed(1)}°',
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 30),

            // Compass widget
            SizedBox(
              height: 300,
              width: 300,
              child: Stack(
                alignment: Alignment.center,
                children: [
                  // Rotating compass
                  Transform.rotate(
                    angle: -_direction * (math.pi / 180),
                    child: Container(
                      width: 280,
                      height: 280,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(color: Colors.grey, width: 3),
                        image: const DecorationImage(
                          image: AssetImage('assets/images/compass-face.jpg'),
                          fit: BoxFit.contain,
                        ),
                      ),
                      child: Stack(
                        alignment: Alignment.center,
                        children: [
                          Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              const SizedBox(height: 15),
                              Container(
                                width: 15,
                                height: 15,
                                decoration: const BoxDecoration(
                                  color: Colors.red,
                                  shape: BoxShape.circle,
                                ),
                              ),
                              Container(
                                width: 2,
                                height: 120,
                                color: Colors.red,
                              ),
                            ],
                          ),
                          // Cardinal directions
                          _buildDirectionText("U", 10, 135, color: Colors.red),
                          _buildDirectionText("T", 135, 255),
                          _buildDirectionText("S", 255, 135),
                          _buildDirectionText("B", 135, 15),

                          // Intercardinal directions
                          _buildDirectionText("TL", 45, 215),
                          _buildDirectionText("BD", 45, 45),
                          _buildDirectionText("BL", 215, 45),
                          _buildDirectionText("TG", 215, 215),
                        ],
                      ),
                    ),
                  ),

                  // Fixed overlay for Kiblat direction
                  Transform.rotate(
                    angle: (_kiblatDirection - _direction) * (math.pi / 180),
                    child: Container(
                      width: 10,
                      height: 140,
                      alignment: Alignment.topCenter,
                      child: Container(
                        width: 10,
                        height: 140,
                        decoration: const BoxDecoration(
                          gradient: LinearGradient(
                            begin: Alignment.topCenter,
                            end: Alignment.bottomCenter,
                            colors: [Colors.green, Colors.transparent],
                          ),
                        ),
                      ),
                    ),
                  ),

                  // Center dot
                  Container(
                    width: 20,
                    height: 20,
                    decoration: const BoxDecoration(
                      color: Colors.black,
                      shape: BoxShape.circle,
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 30),
            Container(
              padding: const EdgeInsets.all(16),
              margin: const EdgeInsets.symmetric(horizontal: 20),
              decoration: BoxDecoration(
                color: Colors.grey[200],
                borderRadius: BorderRadius.circular(16),
              ),
              child: Column(
                children: [
                  Text(
                    _isSimulator
                        ? 'Anda menggunakan simulator. Kompas berputar secara otomatis untuk demo.'
                        : 'Arahkan smartphone Anda ke arah yang ditunjukkan oleh garis hijau untuk menghadap kiblat.',
                    textAlign: TextAlign.center,
                    style: const TextStyle(fontSize: 16),
                  ),
                  const SizedBox(height: 10),
                  const Text(
                    'Untuk akurasi terbaik, kalibrasi kompas Anda dan jauhkan dari benda-benda logam.',
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 14, color: Colors.grey),
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
