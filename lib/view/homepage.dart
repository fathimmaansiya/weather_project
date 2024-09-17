import 'package:flutter/material.dart';
import 'package:weather_project/controller/weatherfunction.dart';
import 'package:weather_project/model/weathermodel.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

 

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  WeatherService weatherService = WeatherService();
  WeatherModel? weatherModel;
  TextEditingController cityController = TextEditingController();
  bool loading = false;
  var wheatherobj= WeatherService();

  Future<void> getWeatherByCity() async {
    if (cityController.text.isEmpty) return;
    setState(() {
      loading = true;
    });
    try {
      WeatherModel weather =
          await wheatherobj.fetchWeatherByCityName(cityController.text);
      setState(() {
        weatherModel = weather;
      });
    } catch (e) {
      print('error;$e');
    } finally {
      setState(() {
        loading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          SizedBox(
            height: 30,
          ),
          TextField(
            controller: cityController,
            decoration: InputDecoration(
                border:
                    OutlineInputBorder(borderRadius: BorderRadius.circular(20)),
                suffixIcon:
                    IconButton(onPressed: () {
                      getWeatherByCity();
                    }, icon: Icon(Icons.search)),
                labelText: 'enter the city'),
          ),
          SizedBox(
            height: 30,
          ),
          loading
              ? CircularProgressIndicator()
              : weatherModel == null
                  ? Text("no data available")
                  : Column(
                      children: [
                        Text('weather:${weatherModel!.description}'),
                        Text('weather:${weatherModel!.temperature}'),
                        Text('weather:${weatherModel!.humidity}'),
                      ],
                    )
        ],
      ),
      // body: Container(
      //   child: TextField(
      //     decoration: InputDecoration(
      //         border:
      //             OutlineInputBorder(borderRadius: BorderRadius.circular(20)),
      //         suffixIcon:
      //             IconButton(onPressed: () {}, icon: Icon(Icons.search))),
      //   ),
      //   height: 300,
      //   width: MediaQuery.of(context).size.width,
      //   decoration: BoxDecoration(
      //       color: Colors.black26,
      //       image: DecorationImage(
      //           image: AssetImage("assets/cloud_image_2.png"),
      //           fit: BoxFit.cover)),
      // ),
    );
  }
}
