import 'Networking.dart';
import 'location.dart';

const api_key = 'aaa49a286e9eaec5a707c4ed611ae721';

class weatherConditions {

  Future<dynamic> getcityname(String name) async{
    NetworkHelper networkHelper = NetworkHelper(
        'https://api.openweathermap.org/data/2.5/weather?q=$name&appid=$api_key&units=metric');
    var weatherData = await networkHelper.getdata();
    return weatherData;
  }

  Future<dynamic> weathermodel() async{
    Location location = Location();
    await location.getCurrentLocation();
    NetworkHelper networkHelper = NetworkHelper(
        'https://api.openweathermap.org/data/2.5/weather?lat=${location.latitude}&lon=${location.longitude}&appid=$api_key&units=metric');
    var weatherData = await networkHelper.getdata();
    return weatherData;
  }

  String getWeatherTypeAsEmoji(int id) {
    if (id < 300) {
      if (id >= 200 && id <= 209) {
        return '⛈';
      } else if (id >= 210 && id <= 221) {
        return '🌩';
      } else {
        return '⛈';
      }
    } else if (id < 400) {
      return '☔';
    } else if (id < 500) {
      return '🌧';
    } else if (id < 600) {
      return '🌧';
    } else if (id < 700) {
      return '❄️';
    } else if (id == 800) {
      return '☀';
    } else if (id < 800) {
      if (id < 750) {
        return '🌫';
      } else {
        return '💨';
      }
    } else {
      return '☁️';
    }
  }

  String getWeatherTypeAsText(int id) {
    if (id < 300) {
      if (id >= 200 && id <= 209) {
        return 'Little rainy and ThunderStorm';
      } else if (id >= 210 && id <= 221) {
        return 'ThunderStorm';
      } else {
        return 'Drizzle and ThunderStorm';
      }
    } else if (id < 400) {
      return 'Drizzle';
    } else if (id < 500) {
      return 'Light Rain';
    } else if (id < 600) {
      return 'Heavy Rain';
    } else if (id < 700) {
      return 'Snow';
    } else if (id == 800) {
      return 'Clear Sky and Sunny';
    } else if (id < 800) {
      if (id < 750) {
        return 'Mist';
      } else {
        return 'Heavy Wind/Sand Storm';
      }
    } else {
      return 'Cloudy';
    }
  }

  String getTemperature(int c) {
    if (c > 33) {return 'Too hot';}
    else if(c > 27){return 'little warm';}
    else if(c > 21){return 'feels room temperature';}
    else if(c > 16){return 'little cold';}
    else if(c > 5){return 'extreme cold';}
    else{return 'Frozen cold';}
  }
}
