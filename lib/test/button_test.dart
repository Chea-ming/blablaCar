import 'package:flutter/material.dart';
import '../widgets/actions/blabutton.dart';

void main() {
  runApp(MyApp());
}

/// This is a test file for the BlaButton widget.
/// The BlaButton widget is a custom button widget that can be used to create buttons with different styles. 

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text('BlaButton Example'),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              BlaButton(
                onPressed: () {
                  print('Button 1 pressed');
                },
                text: 'Primary',
                icon: Icons.add,
                buttonType: ButtonType.primary,
                child: Text('Button 1'),
              ),
              SizedBox(height: 20),
              BlaButton(
                onPressed: () {
                  print('Button 2 pressed');
                },
                text: 'Secondary',
                icon: Icons.remove,
                buttonType: ButtonType.secondary,
                child: Text('Button 2'),
              ),
              SizedBox(height: 20),
              BlaButton(
                onPressed: () {
                  print('Button 3 pressed');
                },
                text: 'No icon',
                buttonType: ButtonType.primary,
                child: Text('Button 3'),
              ),
              SizedBox(height: 20),
              BlaButton(
                onPressed: () {
                  print('Button 4 pressed');
                },
                text: 'No icon',
                buttonType: ButtonType.secondary,
                child: Text('Button 4'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}