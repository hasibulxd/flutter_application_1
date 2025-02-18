import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

void main() {
  runApp(const LabClass05());
}

class LabClass05 extends StatelessWidget {
  const LabClass05({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Basic Flutter UI-02",
      home: Scaffold(
        appBar: AppBar(
          title: Text("Basic Flutter UI-02"),
          backgroundColor: Colors.blue[400],
          centerTitle: true,
        ),
        body: SingleChildScrollView(
          scrollDirection: Axis.horizontal, 
          child: Container(
            height: 600,
            //width: double.infinity,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly, 
              crossAxisAlignment: CrossAxisAlignment.center, 
              children: List.generate(
                100,
                (index) => Icon(
                  Iconsax.add_circle,
                  size: index.toDouble(), 
                  color: const Color.fromARGB(255, 21, 0, 255),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}