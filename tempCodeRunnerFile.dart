import 'package:flutter/material.dart';

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
        body: Center( // Centers the entire content vertically and horizontally
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start, // Aligns the "4" and icons to the left
            children: [
              Text(
                "4", 
                style: TextStyle(
                  fontSize: 30, 
              
                ),
              ),
              SizedBox(height: 10), // Adds space between the "4" and the icons
              Row(
                children: [
                  Icon(Icons.star, size: 50),
                  SizedBox(width: 20),
                  Icon(Icons.star, size: 50),
                  SizedBox(width: 20),
                  Icon(Icons.star, size: 50),
                  SizedBox(width: 20),
                  Icon(Icons.star, size: 50),
                  SizedBox(width: 20),
                  Icon(Icons.star_outline, size: 50),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}