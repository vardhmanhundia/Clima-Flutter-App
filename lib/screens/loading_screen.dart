import 'package:flutter/material.dart';
import '../services/location.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import '../utilities/constants.dart';
import '../services/networking.dart';
import './location_screen.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import '../services/weather.dart';


class LoadingScreen extends StatefulWidget {
  @override
  _LoadingScreenState createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {

  @override
  void initState() {
    super.initState();
    getLocation();
  }

  void getLocation() async{

    var weatherdata = await WeatherModel().getLocationWeather();

    Navigator.push(context, MaterialPageRoute(builder: (context){
      return LocationScreen(locationWeather: weatherdata,);
    }));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SpinKitDoubleBounce(
          color: Colors.white,
          size: 100.0,
        ),
      ),
    );
  }
}
