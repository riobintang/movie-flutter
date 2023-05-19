import 'package:flutter/material.dart';

class ProfilePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Profile'),
      ),
      body: ListView(
        children: <Widget>[
          Center(
            child: Column(
              children: [
                Text(
                  'Profile',
                  style: TextStyle(fontSize: 24),
                ),
                SizedBox(height: 20),
                SizedBox(height: 20),
                CircleAvatar(
                  radius: 50,
                  backgroundImage: AssetImage('assets/images/bintang.jpg'),
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
                SizedBox(height: 20),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
