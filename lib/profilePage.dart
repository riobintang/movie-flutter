import 'package:flutter/material.dart';
import 'package:movie_app/currencyConvert.dart';
import 'package:movie_app/messagePage.dart';
import 'package:movie_app/timeZoneConverter.dart';

class ProfilePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: <Widget>[
          Center(
            child: Column(
              children: [
                SizedBox(height: 20),
                CircleAvatar(
                  radius: 50,
                  backgroundImage: AssetImage('asset/image/rio_bintang.jpg'),
                ),
                SizedBox(height: 20),
                Text(
                  'Rio Bintang Adi Putra',
                  style: TextStyle(fontSize: 20),
                ),
                SizedBox(height: 10),
                Text(
                  '123200087',
                  style: TextStyle(fontSize: 16),
                ),
                SizedBox(height: 30),
                SizedBox(
                  height: 35,
                  width: 160,
                  child: ElevatedButton(
                    onPressed: () => Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => CurrencyConvert())),
                    child: Text("Currency Convert"),
                    style: ElevatedButton.styleFrom(
                      primary: Colors.black,
                      onPrimary: Colors.white,
                    ),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                //ElevatedButton(onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (context) => CurrencyConvert())), child: Text("Currency Convert")),
                SizedBox(
                  height: 35,
                  width: 160,
                  child: ElevatedButton(
                    onPressed: () => Navigator.push(context,
                        MaterialPageRoute(builder: (context) => messagePage())),
                    child: Text("Kesan Pesan"),
                    style: ElevatedButton.styleFrom(
                      primary: Colors.black,
                      onPrimary: Colors.white,
                    ),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                SizedBox(
                  height: 35,
                  width: 160,
                  child: ElevatedButton(
                    onPressed: () => Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => TimeZoneConverterPage())),
                    child: Text("Time Zone"),
                    style: ElevatedButton.styleFrom(
                      primary: Colors.black,
                      onPrimary: Colors.white,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
