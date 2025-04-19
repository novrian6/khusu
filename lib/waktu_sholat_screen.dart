import 'package:flutter/material.dart';
import 'dart:async';
import 'package:adhan_dart/adhan_dart.dart' hide DateComponents;
// Removed invalid import for 'date_components.dart'
import 'package:intl/intl.dart';

class WaktuSholatScreen extends StatefulWidget {
  const WaktuSholatScreen({super.key});

  @override
  State<WaktuSholatScreen> createState() => _WaktuSholatScreenState();
}

class _WaktuSholatScreenState extends State<WaktuSholatScreen> {
  String _currentTime = '';
  String _currentDate = '';
  late Timer _timer;
  late List<PrayerTime> _prayerTimes = [];
  int _nextPrayerIndex = 0;

  // Default coordinates for Jakarta, Indonesia
  final double _latitude = -6.2088;
  final double _longitude = 106.8456;

  @override
  void initState() {
    super.initState();
    _updateDateTime();
    _calculatePrayerTimes();

    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      _updateDateTime();
      // Recalculate next prayer index every minute
      if (DateTime.now().second == 0) {
        _updateNextPrayer();
      }
    });
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  void _updateDateTime() {
    final now = DateTime.now();
    final timeString =
        '${_formatTimeUnit(now.hour)}:${_formatTimeUnit(now.minute)}:${_formatTimeUnit(now.second)}';
    final dateString = '${now.day}/${now.month}/${now.year}';

    setState(() {
      _currentTime = timeString;
      _currentDate = dateString;
    });
  }

  /*************  ✨ Windsurf Command ⭐  *************/
  /// Format a time unit (hour, minute, second) as a 2-digit string with leading
  /// zero if necessary.
  ///
  /// Example: 9 becomes "09", 12 becomes "12".
  /// *****  433a53cd-fb55-45da-8402-6e8425b713c1  ******
  String _formatTimeUnit(int unit) {
    return unit < 10 ? '0$unit' : '$unit';
  }

  void _calculatePrayerTimes() {
    try {
      // Get the current date
      final DateTime now = DateTime.now();

      // Set coordinates for Jakarta, Indonesia
      final coordinates = Coordinates(_latitude, _longitude);

      // Calculate prayer times using the Muslim World League method which is common in Indonesia
      final params =
          CalculationMethod.muslimWorldLeague(); //.muslim_world_league();
      params.madhab = Madhab.shafi;

      // Calculate prayer times - use the proper constructor based on the package version
      final prayerTimes = PrayerTimes(
        coordinates: coordinates,
        date: now, // Pass DateTime directly
        calculationParameters: params,
      );

      // Format the prayer times using Indonesia's UTC+7 timezone
      final formatter = DateFormat.jm();

      // Set the prayer times with correct names in Indonesian
      _prayerTimes = [
        PrayerTime(
          name: 'Subuh',
          time: formatter.format(prayerTimes.fajr!.toLocal()),
        ),
        PrayerTime(
          name: 'Syuruq',
          time: formatter.format(prayerTimes.sunrise!.toLocal()),
        ),
        PrayerTime(
          name: 'Dzuhur',
          time: formatter.format(prayerTimes.dhuhr!.toLocal()),
        ),
        PrayerTime(
          name: 'Ashar',
          time: formatter.format(prayerTimes.asr!.toLocal()),
        ),
        PrayerTime(
          name: 'Maghrib',
          time: formatter.format(prayerTimes.maghrib!.toLocal()),
        ),
        PrayerTime(
          name: 'Isya',
          time: formatter.format(prayerTimes.isha!.toLocal()),
        ),
      ];

      _updateNextPrayer();
    } catch (e) {
      print('Error calculating prayer times: $e');
      // Provide fallback prayer times if calculation fails
      _prayerTimes = [
        PrayerTime(name: 'Subuh', time: '04:30 AM'),
        PrayerTime(name: 'Syuruq', time: '05:45 AM'),
        PrayerTime(name: 'Dzuhur', time: '12:00 PM'),
        PrayerTime(name: 'Ashar', time: '03:15 PM'),
        PrayerTime(name: 'Maghrib', time: '06:00 PM'),
        PrayerTime(name: 'Isya', time: '07:15 PM'),
      ];

      // Show error message
      if (mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text(
              'Gagal menghitung waktu sholat. Menggunakan data perkiraan.',
            ),
            backgroundColor: Colors.red,
          ),
        );
      }
    }
  }

  void _updateNextPrayer() {
    final now = DateTime.now();
    final currentTimeInMinutes = now.hour * 60 + now.minute;

    // Default to first prayer (in case all prayers for today have passed)
    _nextPrayerIndex = 0;

    for (int i = 0; i < _prayerTimes.length; i++) {
      // Skip sunrise as it's not a prayer time
      if (_prayerTimes[i].name == 'Syuruq') continue;

      final String timeStr = _prayerTimes[i].time;

      // Parse the time considering both 12-hour format variants
      try {
        final parsedTime = DateFormat.jm().parse(timeStr);
        final prayerHour = parsedTime.hour;
        final prayerMinute = parsedTime.minute;
        final prayerTimeInMinutes = prayerHour * 60 + prayerMinute;

        if (prayerTimeInMinutes > currentTimeInMinutes) {
          _nextPrayerIndex = i;
          break;
        }
      } catch (e) {
        // If there's an error parsing the time, skip this entry
        continue;
      }
    }

    // If all prayers today have passed, highlight first prayer
    if (mounted) setState(() {});
  }

  String _formatAdhanTime(DateTime? time) {
    if (time == null) return "--:--";
    return DateFormat.jm().format(time.toLocal());
  }

  @override
  Widget build(BuildContext context) {
    // Prayer times are now calculated using adhan_dart

    return Scaffold(
      body: Column(
        children: [
          // Header with date and real-time clock
          Container(
            padding: const EdgeInsets.all(16),
            color: Colors.deepPurple.shade50,
            child: Column(
              children: [
                // Digital clock display
                Container(
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      colors: [
                        Colors.deepPurple.shade700,
                        Colors.deepPurple.shade500,
                      ],
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                    ),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Column(
                    children: [
                      Text(
                        _currentTime,
                        style: const TextStyle(
                          fontSize: 38,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                          letterSpacing: 2,
                        ),
                      ),
                      Text(
                        _currentDate,
                        style: const TextStyle(
                          fontSize: 16,
                          color: Colors.white70,
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  'Waktu Sholat untuk ${_getLocation()}',
                  style: const TextStyle(fontSize: 16),
                ),
                const SizedBox(height: 8),
                ElevatedButton.icon(
                  icon: const Icon(Icons.refresh),
                  label: const Text('Refresh Jadwal'),
                  onPressed: () {
                    // Show loading indicator while refreshing
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(
                        content: Text('Memperbarui jadwal waktu sholat...'),
                        duration: Duration(seconds: 1),
                      ),
                    );

                    // Perform the refresh
                    setState(() {
                      _calculatePrayerTimes();
                    });

                    // Show success message after refresh completes
                    Future.delayed(const Duration(milliseconds: 1200), () {
                      if (mounted) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text(
                              'Jadwal waktu sholat telah diperbarui',
                            ),
                            backgroundColor: Colors.green,
                            duration: Duration(seconds: 2),
                          ),
                        );
                      }
                    });
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.deepPurple,
                    foregroundColor: Colors.white,
                  ),
                ),
              ],
            ),
          ),

          // Next prayer time highlight
          Container(
            margin: const EdgeInsets.symmetric(vertical: 16, horizontal: 8),
            padding: const EdgeInsets.all(16),
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [Colors.deepPurple, Colors.deepPurple.shade300],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
              borderRadius: BorderRadius.circular(12),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.5),
                  spreadRadius: 2,
                  blurRadius: 5,
                  offset: const Offset(0, 3),
                ),
              ],
            ),
            child:
                _prayerTimes.isEmpty
                    ? const Center(
                      child: CircularProgressIndicator(color: Colors.white),
                    )
                    : Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              'Waktu Sholat Selanjutnya',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 16,
                              ),
                            ),
                            const SizedBox(height: 8),
                            Text(
                              _prayerTimes[_nextPrayerIndex].name,
                              style: const TextStyle(
                                color: Colors.white,
                                fontSize: 24,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        ),
                        Text(
                          _prayerTimes[_nextPrayerIndex].time,
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 32,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
          ),

          // List of all prayer times
          Expanded(
            child:
                _prayerTimes.isEmpty
                    ? const Center(child: CircularProgressIndicator())
                    : ListView.builder(
                      itemCount: _prayerTimes.length,
                      itemBuilder: (context, index) {
                        final prayer = _prayerTimes[index];
                        final isNext = index == _nextPrayerIndex;
                        // Skip highlighting sunrise in the next prayer indicator
                        final isActualPrayer = prayer.name != 'Syuruq';

                        return Card(
                          elevation: isNext && isActualPrayer ? 4 : 1,
                          margin: const EdgeInsets.symmetric(
                            vertical: 4,
                            horizontal: 8,
                          ),
                          color:
                              isNext && isActualPrayer
                                  ? Colors.deepPurple.shade50
                                  : prayer.name == 'Syuruq'
                                  ? Colors.amber.shade50
                                  : Colors.white,
                          child: ListTile(
                            leading: Icon(
                              prayer.name == 'Syuruq'
                                  ? Icons.wb_sunny
                                  : Icons.access_time,
                              color:
                                  isNext && isActualPrayer
                                      ? Colors.deepPurple
                                      : prayer.name == 'Syuruq'
                                      ? Colors.amber.shade800
                                      : Colors.grey,
                            ),
                            title: Text(
                              prayer.name,
                              style: TextStyle(
                                fontWeight:
                                    isNext && isActualPrayer
                                        ? FontWeight.bold
                                        : FontWeight.normal,
                              ),
                            ),
                            trailing: Text(
                              prayer.time,
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight:
                                    isNext && isActualPrayer
                                        ? FontWeight.bold
                                        : FontWeight.normal,
                              ),
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

  String _getLocation() {
    return 'Jakarta, Indonesia (${_latitude.toStringAsFixed(4)}, ${_longitude.toStringAsFixed(4)})';
  }
}

class PrayerTime {
  final String name;
  final String time;

  PrayerTime({required this.name, required this.time});
}
