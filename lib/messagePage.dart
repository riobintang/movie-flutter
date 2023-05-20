import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class messagePage extends StatelessWidget {
  const messagePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Kesan Pesan")),
      body: Container(child: Text("Tes kesan pesan")),
    );
  }
}