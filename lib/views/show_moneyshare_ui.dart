import 'package:flutter/material.dart';

class ShowMoneyshareUI extends StatefulWidget {
  // สร้างตัวเเปรที่จะรับค่าที่ส่งมา
  double money, tip, moneyshare;
  int person;
  // คอนสตรักที่จะได้ไว้รับค่าจากตัวเเปรด้านบน
  ShowMoneyshareUI(
      {Key? key,
      required this.money,
      required this.person,
      required this.tip,
      required this.moneyshare})
      : super(key: key);

  @override
  _ShowMoneyshareUIState createState() => _ShowMoneyshareUIState();
}

class _ShowMoneyshareUIState extends State<ShowMoneyshareUI> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.deepPurple[50],
      appBar: AppBar(
        title: Text(
          'ผลการแชร์เงิน',
        ),
        centerTitle: true,
        backgroundColor: Colors.purpleAccent[400],
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              SizedBox(
                height: 55,
              ),
              Image.asset(
                'assets/images/cash-icon.png',
                height: 150,
              ),
              SizedBox(
                height: 40,
              ),
              Text(
                'จำนวนเงินที่จะหาร',
                style: TextStyle(
                  fontSize: 25,
                ),
              ),
              Text(
                widget.money.toStringAsFixed(2),
                style: TextStyle(
                  fontSize: 25,
                  color: Colors.deepPurple,
                ),
              ),
              Text(
                'บาท',
                style: TextStyle(
                  fontSize: 20,
                ),
              ),
              SizedBox(
                height: 30,
              ),
              Text(
                'จำนวนคนที่จะหาร',
                style: TextStyle(
                  fontSize: 25,
                ),
              ),
              Text(
                widget.person.toString(),
                style: TextStyle(
                  fontSize: 25,
                  color: Colors.deepPurple,
                ),
              ),
              Text(
                'คน',
                style: TextStyle(
                  fontSize: 20,
                ),
              ),
              SizedBox(
                height: 30,
              ),
              Text(
                'จำนวนเงินทิป',
                style: TextStyle(
                  fontSize: 25,
                ),
              ),
              Text(
                widget.tip.toStringAsFixed(2),
                style: TextStyle(
                  fontSize: 25,
                  color: Colors.deepPurple,
                ),
              ),
              Text(
                'บาท',
                style: TextStyle(
                  fontSize: 20,
                ),
              ),
              SizedBox(
                height: 30,
              ),
              Text(
                'สรุปหารคนละ',
                style: TextStyle(
                  fontSize: 25,
                ),
              ),
              Text(
                // widget.moneyshare.toString(),
                widget.moneyshare.toStringAsFixed(2),
                style: TextStyle(
                  fontSize: 25,
                  color: Colors.red,
                ),
              ),
              Text(
                'บาท',
                style: TextStyle(
                  fontSize: 20,
                ),
              ),
              SizedBox(
                height: 40,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
