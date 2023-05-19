import 'package:flutter/material.dart';
import 'package:konversi_mata_uang/currencyConvert.dart';
//import 'package:uts_tpm/favoritePage.dart';
//import 'package:uts_tpm/memberPage.dart';
//import 'package:uts_tpm/sitesPage.dart';

class MainPage extends StatelessWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              height: 30,
              width: 200,
              child: ElevatedButton(
                  onPressed: () => {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => CurrencyConvert(),
                            ))
                      },
                  child: Text("Currency Convert")),
            ),
            SizedBox(
              height: 10,
            ),
            // SizedBox(
            //   height: 30,
            //   width: 200,
            //   child: ElevatedButton(
            //       onPressed: () => {
            //             Navigator.push(
            //                 context,
            //                 MaterialPageRoute(
            //                   builder: (context) => /*StopWatch()*/,
            //                 ))
            //           },
            //       child: Text("Stopwatch")),
            // ),
            SizedBox(
              height: 10,
            ),
            

          ],
        ),
      ),
    );
  }
}
