import 'package:flutter/material.dart';

class ProfilePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Profile Page'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Container(
            padding: EdgeInsets.all(25.0),
            width: double.infinity,
            child: Text(
              'Result ..',
              textAlign: TextAlign.center,
            ),
          ),
          RaisedButton(
            child: Text('Back to home', style: TextStyle(
              color: Colors.white,
            ),),
            color: Colors.green,
            onPressed: (){
              Navigator.pushNamed(context, '/');
            },
          ),
        ],
      ),
    );
  }
}
