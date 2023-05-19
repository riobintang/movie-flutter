import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:flutter/material.dart';

String firstCurrency = "USD";
String secondCurrency = "IDR";
double secondValue = 0;

class CurrencyConvert extends StatefulWidget {
  const CurrencyConvert({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _CurrencyConvert();
}

class _CurrencyConvert extends State<CurrencyConvert> {
  var items = ["USD", "IDR", "RUB", "EUR"];
  List<double> converts = [1, 14800, 79.83, 0.92];
  var currencys = [
    {"currency": "USD", "value": 1},
    {"currency": "IDR", "value": 14800},
    {"currency": "RUB", "value": 79.83},
    {"currency": "EUR", "value": 0.92}
  ];
  final TextEditingController _firstValueController = TextEditingController();
  //final TextEditingController _secondValue = TextEditingController();

  void _calculateConvert() {
    int? firstValue = int.tryParse(_firstValueController.text);

    firstValue ??= 0;
    
    double tesValue = converts[items.indexOf(firstCurrency)];
    setState(() {
      int from = items.indexOf(firstCurrency);
    int to = items.indexOf(secondCurrency);
      // print(firstValue);
      // print(converts[to]);
      // print("first: $firstCurrency");
      // print("second: $secondCurrency");
      // print("from: $from");
      // print("to: $to");
      secondValue = double.parse(((firstValue!/converts[from]) * converts[to]).toStringAsFixed(3));
    });
    
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Currency Convert"),
      ),
      body: Center(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SizedBox(
            height: 20,
          ),
          Container(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  width: 100,
                  child: TextField(
                    controller: _firstValueController,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      labelText: 'Input value',
                    ),
                  ),
                ),
                SizedBox(
                  width: 50,
                ),
                Container(
                  width: 70,
                  child: new DropdownButton(
                      isExpanded: true,
                      // Initial Value
                      value: firstCurrency,

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
                          firstCurrency = newValue!;
                          //_changeDate();
                        });
                      }),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 70,
          ),
          Container(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  width: 100,
                  child: Text("$secondValue"),
                ),
                SizedBox(
                  width: 50,
                ),
                Container(
                    width: 70,
                    child: new DropdownButton(
                        // Initial Value
                        value: secondCurrency,

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
                            secondCurrency = newValue!;
                            
                          });
                        })),
              ],
            ),
          ),
          ElevatedButton(onPressed: _calculateConvert, child: Text("Convert")),
          SizedBox(height: 20,),
          
        ],
      )),
    );
  }
}
