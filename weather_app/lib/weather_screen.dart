import 'dart:convert';
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:weather_app/additional_info_item.dart';
import 'package:weather_app/hourly_forecast_card.dart';
import 'package:http/http.dart' as http;
import 'package:weather_app/secrets.dart';
import 'package:geolocator/geolocator.dart';

class WeatherScreen extends StatefulWidget {
  const WeatherScreen({super.key});

  @override
  State<WeatherScreen> createState() => _WeatherScreenState();
}

class _WeatherScreenState extends State<WeatherScreen> {
  late Future<Map<String, dynamic>> weather;

  @override
  void initState() {
    super.initState();
    weather = getCurrentWeather();
  }

  Future<Map<String, dynamic>> getCurrentWeather() async {
    try {
      // Get current position
      Position position = await _getCurrentPosition();

      print('Making API request to: https://api.openweathermap.org/data/2.5/forecast?lat=${position.latitude}&lon=${position.longitude}&APPID=$openWeatherAPIKey');
      
      final res = await http.get(
        Uri.parse(
          'https://api.openweathermap.org/data/2.5/forecast?lat=${position.latitude}&lon=${position.longitude}&APPID=$openWeatherAPIKey',
        ),
        headers: {
          'Content-Type': 'application/json',
        },
      ).timeout(const Duration(seconds: 10));
      
      print('API Response status: ${res.statusCode}');
      print('API Response body: ${res.body}');
      
      final data = jsonDecode(res.body);

      if (data['cod'] != '200') {
        throw Exception("API Error: ${data['message'] ?? 'Unknown error'}");
      }

      return data;
    } catch (e) {
      print('Error in getCurrentWeather: $e');
      if (e.toString().contains('SocketException')) {
        throw Exception('Network Error: Please check your internet connection and try again.');
      } else if (e.toString().contains('TimeoutException')) {
        throw Exception('Request timeout: The server is taking too long to respond.');
      } else {
        throw Exception('Error: ${e.toString()}');
      }
    }
  }

  Future<Position> _getCurrentPosition() async {
    bool serviceEnabled;
    LocationPermission permission;

    // Test if location services are enabled.
    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      // Location services are not enabled don't continue
      // accessing the position and request users of the
      // App to enable the location services.
      throw Exception('Location services are disabled.');
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        // Permissions are denied, next time you could try
        // requesting permissions again (this is also where
        // Android's shouldShowRequestPermissionRationale
        // returned true. According to Android guidelines
        // your App should show an explanatory UI now.
        throw Exception('Location permissions are denied');
      }
    }

    if (permission == LocationPermission.deniedForever) {
      // Permissions are denied forever, handle appropriately.
      throw Exception(
        'Location permissions are permanently denied, we cannot request permissions.',
      );
    }

    // When we reach here, permissions are granted and we can
    // continue accessing the position of the device.
    return await Geolocator.getCurrentPosition(
      desiredAccuracy: LocationAccuracy.high,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: false,
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 3, 25, 39),
        elevation: 0,
        title: const Text("Weather App by HRS"),
        titleTextStyle: const TextStyle(
          fontWeight: FontWeight.w900,
          fontSize: 18,
          color: Colors.white,
        ),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () {
              setState(() {
                weather = getCurrentWeather();
              });
            },
            icon: const Icon(Icons.refresh, color: Colors.white),
          ),
        ],
      ),
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Color.fromARGB(255, 0, 38, 109),
              Color.fromARGB(255, 38, 59, 95),
              Color.fromARGB(255, 68, 106, 139),
              Color.fromARGB(255, 36, 99, 216),
            ],
            stops: [0.0, 0.3, 0.7, 1.0],
          ),
        ),
        child: FutureBuilder(
          future: weather,
          builder: (context, asyncSnapshot) {
            if (asyncSnapshot.connectionState == ConnectionState.waiting) {
              return Center(child: const CircularProgressIndicator.adaptive());
            }

            if (asyncSnapshot.hasError) {
              return Center(
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Icon(
                        Icons.error_outline,
                        size: 64,
                        color: Colors.white70,
                      ),
                      const SizedBox(height: 16),
                      Text(
                        asyncSnapshot.error.toString(),
                        textAlign: TextAlign.center,
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                        ),
                      ),
                      const SizedBox(height: 16),
                      ElevatedButton.icon(
                        onPressed: () {
                          setState(() {
                            weather = getCurrentWeather();
                          });
                        },
                        icon: const Icon(Icons.refresh),
                        label: const Text('Retry'),
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.white.withOpacity(0.2),
                          foregroundColor: Colors.white,
                        ),
                      ),
                    ],
                  ),
                ),
              );
            }
            final data = asyncSnapshot.data!;
            final currWeatherData = data['list'][0];
            final currtemp = currWeatherData['main']['temp'];
            final currSky = currWeatherData['weather'][0]['main'];
            final currHumidity = currWeatherData['main']['humidity'];
            final currPressure = currWeatherData['main']['pressure'];
            final currWindSpeed = currWeatherData['wind']['speed'];
            final cityName = data['city']['name'];
            final country = data['city']['country'];

            return Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        width: double.infinity,
                        child: Card(
                          color: Colors.white.withOpacity(0.1),
                          elevation: 0,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20),
                            side: BorderSide(
                              color: Colors.white.withOpacity(0.2),
                              width: 1,
                            ),
                          ),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(20),
                            child: BackdropFilter(
                              filter: ImageFilter.blur(sigmaX: 15, sigmaY: 15),
                              child: Container(
                                decoration: BoxDecoration(
                                  gradient: LinearGradient(
                                    begin: Alignment.topLeft,
                                    end: Alignment.bottomRight,
                                    colors: [
                                      Colors.white.withOpacity(0.2),
                                      Colors.white.withOpacity(0.1),
                                    ],
                                  ),
                                  borderRadius: BorderRadius.circular(20),
                                  border: Border.all(
                                    color: Colors.white.withOpacity(0.3),
                                    width: 1,
                                  ),
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.all(24.0),
                                  child: Column(
                                    children: [
                                      Text(
                                        "$cityName, $country",
                                        style: const TextStyle(
                                          fontSize: 18,
                                          fontWeight: FontWeight.bold,
                                          color: Color.fromARGB(
                                            255,
                                            3,
                                            25,
                                            39,
                                          ),
                                        ),
                                      ),
                                      const SizedBox(height: 8),
                                      Text(
                                        "${(currtemp - 273.15).toStringAsFixed(1)}°C",
                                        style: const TextStyle(
                                          fontSize: 48,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.white,
                                        ),
                                      ),
                                      const SizedBox(height: 12),
                                      Icon(
                                        currSky == "Clouds"
                                            ? Icons.cloud
                                            : currSky == "Rain"
                                            ? Icons.grain
                                            : currSky == "Thunderstorm"
                                            ? Icons.thunderstorm
                                            : currSky == "Drizzle"
                                            ? Icons.grain
                                            : currSky == "Snow"
                                            ? Icons.ac_unit
                                            : currSky == "Clear"
                                            ? Icons.wb_sunny
                                            : Icons.wb_sunny,
                                        size: 60,
                                        color: Colors.white,
                                      ),
                                      const SizedBox(height: 12),
                                      Text(
                                        currSky,
                                        style: const TextStyle(
                                          fontSize: 20,
                                          fontWeight: FontWeight.w400,
                                          color: Colors.white70,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: 20),
                      const Text(
                        "Forecast for today",
                        style: TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                      const SizedBox(height: 10),
                      SingleChildScrollView(
                        scrollDirection: Axis.horizontal,
                        child: Row(
                          children: [
                            for (var i = 1; i < 7; i++)
                              Padding(
                                padding: const EdgeInsets.only(right: 10.0),
                                child: HourlyForecastCard(
                                  time:
                                      "${DateTime.fromMillisecondsSinceEpoch(data['list'][i]['dt'] * 1000, isUtc: true).toLocal().hour.toString().padLeft(2, '0')}:00",
                                  icon:
                                      data['list'][i]['weather'][0]['main'] ==
                                          "Clouds"
                                      ? Icons.cloud
                                      : data['list'][i]['weather'][0]['main'] ==
                                            "Rain"
                                      ? Icons.thunderstorm
                                      : data['list'][i]['weather'][0]['main'] ==
                                            "Thunderstorm"
                                      ? Icons.thunderstorm
                                      : data['list'][i]['weather'][0]['main'] ==
                                            "Drizzle"
                                      ? Icons.thunderstorm
                                      : data['list'][i]['weather'][0]['main'] ==
                                            "Snow"
                                      ? Icons.snowing
                                      : data['list'][i]['weather'][0]['main'] ==
                                            "Clear"
                                      ? Icons.sunny
                                      : Icons.sunny,
                                  temperature:
                                      "${(data['list'][i]["main"]["temp"] - 273.15).toStringAsFixed(0)}°C",
                                ),
                              ),
                          ],
                        ),
                      ),
                      const SizedBox(height: 20),
                      const Text(
                        "Additional Information",
                        style: TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      ),
                      const SizedBox(height: 5),

                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          AdditionalInfoItem(
                            icon: Icons.water_drop,
                            label: "Humidity",
                            value: "$currHumidity",
                          ),
                          AdditionalInfoItem(
                            icon: Icons.air,
                            label: "Wind Speed",
                            value: "$currWindSpeed",
                          ),
                          AdditionalInfoItem(
                            icon: Icons.beach_access,
                            label: "Pressure",
                            value: "$currPressure",
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
