import 'package:flutter/material.dart';

class Home extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('时光网电影'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            FlatButton(
              onPressed: (){
                Navigator.of(context).pushNamed('/cities');
              },
              color: Colors.blueAccent,
              child: Text(
                '获取城市',
                style: TextStyle(
                  color: Colors.black87
                ),
                ),
            )
          ],
        ),
      ),
    );
  }
}