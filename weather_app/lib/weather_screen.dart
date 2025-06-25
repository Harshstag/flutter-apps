import 'dart:convert';
import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:weather_app/additional_info_item.dart';
import 'package:weather_app/hourly_forecast_card.dart';
import 'package:http/http.dart' as http;
import 'package:weather_app/secrets.dart';

class WeatherScreen extends StatefulWidget {
  const WeatherScreen({super.key});

  @override
  State<WeatherScreen> createState() => _WeatherScreenState();
}

class _WeatherScreenState extends State<WeatherScreen> {
  @override
  void initState() {
    super.initState();
    getCurrentWeather();
  }

  Future<Map<String, dynamic>> getCurrentWeather() async {
    String cityName = "London";

    try {
      final res = await http.get(
        Uri.parse(
          'https://api.openweathermap.org/data/2.5/forecast?q=$cityName&APPID=$openWeatherAPIKey',
        ),
      );
      final data = jsonDecode(res.body);

      if (data['cod'] != '200') {
        throw "An unexpected error occurred";
      }

      return data;
    } on Exception catch (e) {
      throw e.toString();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Weather App"),
        titleTextStyle: const TextStyle(
          fontWeight: FontWeight.w900,
          fontSize: 18,
          color: Colors.white,
        ),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: () {
              print("refresh Clicked");
            },
            icon: const Icon(Icons.refresh),
          ),
        ],
      ),
      body: FutureBuilder(
        future: getCurrentWeather(),
        builder: (context, asyncSnapshot) {
          if (asyncSnapshot.connectionState == ConnectionState.waiting) {
            return Center(child: const CircularProgressIndicator.adaptive());
          }

          if (asyncSnapshot.hasError) {
            return Center(child: Text(asyncSnapshot.error.toString()));
          }
          final data = asyncSnapshot.data!;
          final currWeatherData = data['list'][0];
          final currtemp = currWeatherData['main']['temp'];
          final currSky = currWeatherData['weather'][0]['main'];
          final currHumidity = currWeatherData['main']['humidity'];
          final currPressure = currWeatherData['main']['pressure'];
          final currWindSpeed = currWeatherData['wind']['speed'];

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
                        color: const Color.fromARGB(255, 57, 58, 78),
                        elevation: 10,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(16),
                        ),
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(16),
                          child: BackdropFilter(
                            filter: ImageFilter.blur(sigmaX: 6, sigmaY: 6),
                            child: Padding(
                              padding: const EdgeInsets.all(20.0),
                              child: Column(
                                children: [
                                  Text(
                                    "${(currtemp - 273.15).toStringAsFixed(2)} °C",
                                    style: const TextStyle(
                                      fontSize: 32,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  const SizedBox(height: 10),
                                  Icon(
                                    currSky == "Clouds"
                                        ? Icons.cloud
                                        : currSky == "Rain"
                                        ? Icons.thunderstorm
                                        : currSky == "Thunderstorm"
                                        ? Icons.thunderstorm
                                        : currSky == "Drizzle"
                                        ? Icons.thunderstorm
                                        : currSky == "Snow"
                                        ? Icons.snowing
                                        : currSky == "Clear"
                                        ? Icons.sunny
                                        : Icons.sunny,
                                    size: 50,
                                  ),
                                  const SizedBox(height: 10),
                                  Text(
                                    "${currSky}",
                                    style: const TextStyle(fontSize: 20),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 20),
                    const Text(
                      "Hourly Forecast",
                      style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
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
                                    DateTime.fromMillisecondsSinceEpoch(
                                      data['list'][i]['dt'] * 1000,
                                      isUtc: true,
                                    ).toLocal().hour.toString().padLeft(
                                      2,
                                      '0',
                                    ) +
                                    ":00",
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
                                temperature: data['list'][i]["main"]["temp"]
                                    .toString(),
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
                      ),
                    ),
                    const SizedBox(height: 5),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        AdditionalInfoItem(
                          icon: Icons.water_drop,
                          label: "Humidity",
                          value: "${currHumidity}",
                        ),
                        AdditionalInfoItem(
                          icon: Icons.air,
                          label: "Wind Speed",
                          value: "${currWindSpeed}",
                        ),
                        AdditionalInfoItem(
                          icon: Icons.beach_access,
                          label: "Pressure",
                          value: "${currPressure}",
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
    );
  }
}
