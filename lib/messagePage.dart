import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class messagePage extends StatelessWidget {
  const messagePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Kesan Pesan"),backgroundColor: Colors.black,),
      body: Container(child: Padding(padding: EdgeInsets.all(15), child: Text("Dosennya memberikan penjelasan yang mudah dimengerti dan materi yang diberikan menantang. Perkuliahannya menyenangkan tetapi saya tidak mau mengalaminya lagi. Pesan dari saya, diperbanyak materi tentang flutter walaupun materi sudah didapat dari praktikum.", style: TextStyle(fontSize: 30),),),),    
    );
  }
}