import 'package:flutter/material.dart';

class resultScreen extends StatelessWidget {
  resultScreen({Key? key, this.corectAnswer = 0}) : super(key: key);
  int corectAnswer = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.red[800],
        centerTitle: true,
        title: Text(
          'نتیجه بازی',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
      body: SafeArea(
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.all(25),
              child: Image(
                image: AssetImage('images/cup.png'),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Text(
              'پاسخ های صحیح شما',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            Text(
              '$corectAnswer',
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 80, fontWeight: FontWeight.bold),
            )
          ],
        ),
      ),
    );
  }
}
