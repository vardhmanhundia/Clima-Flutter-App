import './networking.dart';
import './location.dart';


const kApikey = '0e1a38592ee081dc5f385984fcb63a09';
const openWeatherMapUrl = 'https://api.openweathermap.org/data/2.5/weather';

class WeatherModel {

  Future<dynamic> getLocationWeather() async{
    Location location = Location();
    await location.getGeoLocation();
    print('longitude:'+location.longitude.toString());
    print('latitude:'+location.latitude.toString());
    Networking weatherFetch = Networking(
        url:'$openWeatherMapUrl?lat=${location.latitude}&lon=${location.longitude}&appid=$kApikey&units=metric'
    );
    return weatherFetch.getData();

  }

  String getWeatherIcon(int condition) {
    if (condition < 300) {
      return '🌩';
    } else if (condition < 400) {
      return '🌧';
    } else if (condition < 600) {
      return '☔️';
    } else if (condition < 700) {
      return '☃️';
    } else if (condition < 800) {
      return '🌫';
    } else if (condition == 800) {
      return '☀️';
    } else if (condition <= 804) {
      return '☁️';
    } else {
      return '🤷‍';
    }
  }

  String getMessage(int temp) {
    if (temp > 25) {
      return 'It\'s 🍦 time';
    } else if (temp > 20) {
      return 'Time for shorts and 👕';
    } else if (temp < 10) {
      return 'You\'ll need 🧣 and 🧤';
    } else {
      return 'Bring a 🧥 just in case';
    }
  }
}
