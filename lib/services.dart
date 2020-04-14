import 'package:http/http.dart' as http;
import 'dart:convert';


Future <MyData> fetchData()async{
var url = 'http://api.openweathermap.org/data/2.5/weather?q=Karachi&units=metric&APPID=0154ac07e7c0fc3b2556cc8e5da8ad48';

  final response = await http.get(url);
 if (response.statusCode == 200) {
    // If the call to the server was successful, parse the JSON.
    return MyData.fromJson(json.decode(response.body));
  } else {
    // If that call was not successful, throw an error.
    throw Exception('Failed to load post');
  }

}

class Main {
  final int temp;
  final int maxTemp;
  final int minTemp;
  final double feelsLike;

  Main({this.temp,this.maxTemp,this.minTemp,this.feelsLike});

  factory Main.fromJson(Map<String, dynamic> json){
    return Main(
      temp: json['temp'],
      maxTemp: json['temp_max'],
      minTemp: json['temp_min'],
      feelsLike: json['feels_like'],
     );
  }

}




class WeatherData{
  final String description;

  WeatherData({this.description});

  factory WeatherData.fromJson(dynamic json){
    return WeatherData(
      description: json['description'] as String,
    );
  }
  @override
  String toString() {
    return '${description[0].toUpperCase()}${description.substring(1)}';
  }
}

class MyData{
  Main main;
  List <WeatherData> weather = List();

  MyData({this.main,this.weather});

  factory MyData.fromJson(Map<String, dynamic> json) {
    return MyData(
      main: Main.fromJson(json['main']),
      weather: (json['weather'] as List).map((weatherData)=>WeatherData.fromJson(weatherData)).toList(),
      
    );
  }

}

