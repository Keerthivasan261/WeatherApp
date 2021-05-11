import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:weather_changer/CityScreen.dart';
import 'weather.dart';

const textstyle_1 =
    TextStyle(fontSize: 50, fontWeight: FontWeight.w600, color: Colors.white);
const textstyle_2 =
    TextStyle(fontSize: 70, fontWeight: FontWeight.w800, color: Colors.white);

class LocationScreen extends StatefulWidget {
  LocationScreen({this.data});

  final data;

  @override
  _LocationScreenState createState() => _LocationScreenState();
}

class _LocationScreenState extends State<LocationScreen> {
  weatherConditions weatherdata = weatherConditions();

  int temperature;
  String country;
  String city;
  String emoji;
  String text;
  String celcius;

  @override
  void initState() {
    super.initState();
    updateUI(widget.data);
    print(widget.data);
  }

  void updateUI(dynamic weather) {
    if (weather == null) {
      temperature = 0;
      emoji = '';
      text = '';
      celcius = 'Turn on your location if it is turned off..';
    } else {
      setState(() {
        var temp = weather['main']['temp'];
        temperature = temp.toInt();
        var condition = weather['weather'][0]['id'];
        country = weather['sys']['country'];
        city = weather['name'];

        emoji = weatherdata.getWeatherTypeAsEmoji(condition);
        text = weatherdata.getWeatherTypeAsText(condition);
        celcius = weatherdata.getTemperature(temperature);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('images/background.jpg'),
            fit: BoxFit.cover,
          ),
        ),
        child: SafeArea(
          child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children:
                    [
                      FlatButton(
                        onPressed: () async {
                          var W_data = await weatherdata.weathermodel();
                          updateUI(W_data);
                        },
                        child: Icon(
                          MdiIcons.crosshairsGps,
                          color: Colors.white,
                          size: 40,
                        ),
                      ),
                      FlatButton(
                        onPressed: () async{
                          var name = await Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => CityScreen(),
                            ),
                          );
                          if(name!=null) {
                            updateUI(await weatherdata.getcityname(name));
                          }
                        },
                        child: Icon(
                          MdiIcons.city,
                          color: Colors.white,
                          size: 60,
                        ),
                      ),
                    ]),
                Padding(
                  padding: EdgeInsets.only(left: 10),
                  child: Row(children: [
                    Text(
                      '$temperature°',
                      style: textstyle_2,
                    ),
                    SizedBox(
                      width: 40,
                    ),
                    Text(
                      emoji,
                      style: textstyle_2,
                    ),
                    // SizedBox(
                    //   width: 200,
                    // )
                  ]),
                ),
                Padding(
                  padding: EdgeInsets.only(bottom: 20),
                  child: Text(
                    'It\'s $text and $celcius in $city',
                    style: textstyle_1,
                    textAlign: TextAlign.center,
                  ),
                ),
              ]),
        ),
      ),
    );
  }
}
