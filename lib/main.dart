import 'package:flutter/material.dart';
import 'package:flutter_provider_exam/weather_info.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Provider example",
      theme: ThemeData(primarySwatch: Colors.deepOrange),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      builder: (context) => WeatherInfo(),
      child: Scaffold(
        appBar: AppBar(
          title: Text("Title"),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[MySpecialHeading(), MySpecialContent()],
          ),
        ),
        floatingActionButton: MyFloadingActionButton(),
      ),
    );
  }
}

class MyFloadingActionButton extends StatelessWidget {
  Color decideColor(WeatherInfo weatherInfo) {
    return weatherInfo.temperatureType == "celcius" ? Colors.red : Colors.green;
  }

  @override
  Widget build(BuildContext context) {
    var weatherInfo = Provider.of<WeatherInfo>(context);
    return FloatingActionButton(
      backgroundColor: decideColor(weatherInfo),
      tooltip: "Change temperature type",
      child: Icon(Icons.change_history),
      onPressed: () {
        String newWeatherType =
            weatherInfo.temperatureType == "celcius" ? "far" : "celcius";
        weatherInfo.temperatureType = newWeatherType;
      },
    );
  }
}

class MySpecialHeading extends StatelessWidget {
  Color decideColor(WeatherInfo weatherInfo) {
    return weatherInfo.temperatureType == "celcius" ? Colors.red : Colors.green;
  }
  @override
  Widget build(BuildContext context) {
    var weatherInfo = Provider.of<WeatherInfo>(context);
    return Padding(
      padding: EdgeInsets.all(8),
      child: Text(
        weatherInfo.temperatureType,
        style: TextStyle(fontSize: 20, color: decideColor(weatherInfo)),
      ),
    );
  }
}

class MySpecialContent extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(8),
      child: Text("Temperature value"),
    );
  }
}
