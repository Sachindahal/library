import 'package:flutter/material.dart';

class ItemsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Item List'),
      ),
      body: Center(
        child:AnimatedOpacity(
          opacity:1.0,
          duration: Duration(seconds: 1),
          child:Text(
          'List of items',
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 30.0,
            color: Colors.blue,
          ),
        ),
        ), 
        
      ),
    );
  }
}
