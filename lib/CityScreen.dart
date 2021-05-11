import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

String cityname;

class CityScreen extends StatefulWidget {
  @override
  _CityScreenState createState() => _CityScreenState();
}

class _CityScreenState extends State<CityScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
            image: DecorationImage(
          image: AssetImage('images/cityscape.jpg'),
          fit: BoxFit.cover,
        )),
        child: SafeArea(
          child: Padding(
            padding: EdgeInsets.only(top: 30),
            child: Column(
              children: [
                Align(
                  alignment: Alignment.topLeft,
                  child: FlatButton(
                      onPressed: () {Navigator.pop(context);},
                      child: Icon(
                        MdiIcons.chevronLeft,
                        size: 50,
                        color: Colors.white,
                      )),
                ),
                Padding(
                  padding: EdgeInsets.all(20),
                  child: TextField(
                      decoration: InputDecoration(
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.all(Radius.circular(5)),
                          borderSide: BorderSide(width: 3, color: Colors.white),
                        ),
                        border: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.white),
                          borderRadius: BorderRadius.circular(5),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.white),
                          borderRadius: BorderRadius.circular(5),
                        ),
                        hintText: ('eg : Salem'),
                        hintStyle: TextStyle(
                            color: Colors.grey[500],
                            fontWeight: FontWeight.w500,
                            fontSize: 17),
                        fillColor: Colors.white,
                        filled: true,
                        icon: Icon(
                          MdiIcons.cityVariantOutline,
                          color: Colors.white,
                        ),
                      ),
                      onChanged: (value) {
                        cityname = value;
                      }),
                ),
                FlatButton(
                    onPressed: () {
                        Navigator.pop(context, cityname);
                    },
                    child: Text(
                      'Get Weather',
                      style: TextStyle(color: Colors.white, fontSize: 35),
                    ))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
