import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:async/async.dart';

String dropdownvalue = 'WIB';
var dateNow = DateFormat('EEEE, d MMM, yyyy HH:mm:ss').format(DateTime.now());

void _changeDate() {
  if (dropdownvalue == 'WITA') {
    dateNow = DateFormat('EEEE, d MMM, yyyy, HH:mm:ss')
        .format(DateTime.now().toUtc().add(const Duration(hours: 8)));
  } else if (dropdownvalue == 'WIT') {
    dateNow = DateFormat('EEEE, d MMM, yyyy HH:mm:ss')
        .format(DateTime.now().toUtc().add(const Duration(hours: 9)));
  } else {
    dateNow = DateFormat('EEEE, d MMM, yyyy HH:mm:ss')
        .format(DateTime.now().toUtc().add(const Duration(hours: 7)));
  }
}

class CalendarPage extends StatefulWidget {
  @override
  State<CalendarPage> createState() => _CalendarPageState();
}

class _CalendarPageState extends State<CalendarPage> {
  // List of items in our dropdown menu
  var items = [
    'WIB',
    'WITA',
    'WIT',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Kalender'),
        backgroundColor: Colors.deepOrange,
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              height: 20,
            ),
            StreamBuilder(
              stream: Stream.periodic(const Duration(seconds: 1)),
              builder: (context, snapshot) {
                _changeDate();
                return Text(
                  dateNow,
                  style: TextStyle(fontSize: 20),
                );
              },
            ),
            SizedBox(
              height: 10,
            ),
            SizedBox(
              child: DropdownButton(
                // Initial Value
                value: dropdownvalue,

                // Down Arrow Icon
                icon: const Icon(Icons.keyboard_arrow_down),

                // Array list of items
                items: items.map((String items) {
                  return DropdownMenuItem(
                    value: items,
                    child: Text(items),
                  );
                }).toList(),
                onChanged: (String? newValue) {
                  setState(() {
                    dropdownvalue = newValue!;
                    _changeDate();
                  });
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}