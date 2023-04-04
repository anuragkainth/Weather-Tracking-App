import 'package:flutter/material.dart';
import 'package:weather_app/screens/city_screen.dart';
import 'package:weather_app/utilities/constants.dart';
import 'package:weather_app/services/weather.dart';

class LocationScreen extends StatefulWidget {
  LocationScreen({this.weatherData});

  final weatherData;

  @override
  _LocationScreenState createState() => _LocationScreenState();
}

class _LocationScreenState extends State<LocationScreen> {
  @override
  WeatherModel weatherModel = WeatherModel();
  int? temprature;
  String? weatherCondition;
  String? cityName;
  String? weatherMessage;
  String? countryName;

  void updateUI(dynamic data) {
    setState(() {
      if (data == null) {
        temprature = 0;
        weatherCondition = 'Error';
        weatherMessage = 'Unable to Fetch Data';
        cityName = '';
        countryName = '';
        return;
      }
      double temp = data['main']['temp'];
      temprature = temp.toInt();
      cityName = data['name'];
      int condition = data['weather'][0]['id'];
      weatherCondition = weatherModel.getWeatherIcon(condition);
      weatherMessage = weatherModel.getMessage(temp.toInt());
      countryName = data['sys']['country'];
    });
  }

  void initState() {
    super.initState();

    updateUI(widget.weatherData);
  }

  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('images/wallpaper_1.jpg'),
            fit: BoxFit.cover,
            colorFilter: ColorFilter.mode(
                Colors.white.withOpacity(0.8), BlendMode.dstATop),
          ),
        ),
        constraints: BoxConstraints.expand(),
        child: SafeArea(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  MaterialButton(
                    onPressed: () async {
                      var weatherData = await weatherModel.getLocationWeather();
                      updateUI(weatherData);
                    },
                    child: Icon(
                      Icons.near_me,
                      size: 50.0,
                    ),
                  ),
                  MaterialButton(
                    onPressed: () async {
                      var typedName = await Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) {
                            return CityScreen();
                          },
                        ),
                      );
                      if (typedName != null) {
                        var weatherData =
                            await weatherModel.getCityWeather(typedName);
                        updateUI(weatherData);
                      }
                    },
                    child: Icon(
                      Icons.location_city,
                      size: 50.0,
                    ),
                  ),
                ],
              ),
              Padding(
                padding: EdgeInsets.only(left: 15.0),
                child: Row(
                  children: <Widget>[
                    Text(
                      '$temprature°C',
                      style: kTempTextStyle,
                    ),
                    Text(
                      '$weatherCondition️',
                      style: kConditionTextStyle,
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.only(right: 15.0),
                child: Text(
                  "$weatherMessage in $cityName, $countryName",
                  textAlign: TextAlign.right,
                  style: kMessageTextStyle,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
