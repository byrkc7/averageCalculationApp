import 'package:flutter/material.dart';
import 'package:flutter_dinamik_not_hesaplama/widgets/ortalama_hesapla_page.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  
  const MyApp({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      
      title: "Dinamik Not Hesaplama",
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.red,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: OrtalamaHesaplaPage(),
    );
  }
}