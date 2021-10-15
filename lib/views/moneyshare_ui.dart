import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_app_moneyshare/views/show_moneyshare_ui.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class MoneyshareUI extends StatefulWidget {
  const MoneyshareUI({Key? key}) : super(key: key);

  @override
  _MoneyshareUIState createState() => _MoneyshareUIState();
}

class _MoneyshareUIState extends State<MoneyshareUI> {
  bool tipCheck = false;
  TextEditingController txMoney = TextEditingController();
  TextEditingController txPerson = TextEditingController();
  TextEditingController txTip = TextEditingController();
  // เมธอดเเสดง dialog
  showWarningDialog(context, msg) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Container(
            color: Colors.purpleAccent[400],
            padding: EdgeInsets.only(
              top: 10,
              bottom: 10,
            ),
            child: Align(
              alignment: Alignment.center,
              child: Text(
                'คำเตือน',
              ),
            ),
          ),
          content: Text(
            msg,
          ),
          actions: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: Text(
                    'ตกลง',
                  ),
                  style: ElevatedButton.styleFrom(
                    primary: Colors.purpleAccent[400],
                  ),
                ),
              ],
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.deepPurple[50],
      appBar: AppBar(
        backgroundColor: Colors.purpleAccent[400],
        title: Text(
          'แชร์เงินกันดิวะะะะะะะะะะ',
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            children: [
              SizedBox(
                height: 40,
              ),
              Image.asset(
                'assets/images/cash-icon.png',
                height: 150,
              ),
              SizedBox(
                height: 40,
              ),
              Padding(
                padding: const EdgeInsets.only(
                  left: 40,
                  right: 40,
                ),
                child: TextField(
                  controller: txMoney,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.purpleAccent,
                      ),
                    ),
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.purpleAccent,
                      ),
                    ),
                    prefixIcon: Icon(
                      FontAwesomeIcons.moneyBillWave,
                      color: Colors.purpleAccent[400],
                    ),
                    hintText: 'ป้อนจำนวนเงิน(บาท)',
                    hintStyle: TextStyle(
                      color: Colors.grey[400],
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 30,
              ),
              Padding(
                padding: const EdgeInsets.only(
                  left: 40,
                  right: 40,
                ),
                child: TextField(
                  controller: txPerson,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.purpleAccent,
                      ),
                    ),
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.purpleAccent,
                      ),
                    ),
                    prefixIcon: Icon(
                      Icons.person,
                      color: Colors.purpleAccent[400],
                    ),
                    hintText: 'ป้อนจำนวนคน(คน)',
                    hintStyle: TextStyle(
                      color: Colors.grey[400],
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 30,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Checkbox(
                    onChanged: (data) {
                      setState(() {
                        if (data != null) {
                          tipCheck = data;
                          if (data == false) {
                            txTip.text = '';
                          }
                        }
                      });
                    },
                    value: tipCheck,
                    activeColor: Colors.deepPurple,
                    checkColor: Colors.yellow,
                    side: BorderSide(
                      color: Colors.deepPurple,
                    ),
                  ),
                  Text(
                    'ทิปให้พนักงานเสริฟ',
                    style: TextStyle(
                      color: Color(0xFF333333),
                    ),
                  )
                ],
              ),
              SizedBox(
                height: 15,
              ),
              Padding(
                padding: const EdgeInsets.only(
                  left: 40,
                  right: 40,
                ),
                child: TextField(
                  controller: txTip,
                  enabled: tipCheck,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    enabledBorder: UnderlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.purpleAccent,
                      ),
                    ),
                    focusedBorder: UnderlineInputBorder(
                      borderSide: BorderSide(
                        color: Colors.purpleAccent,
                      ),
                    ),
                    prefixIcon: Icon(
                      FontAwesomeIcons.coins,
                      color: Colors.purpleAccent[400],
                    ),
                    hintText: 'ป้อนจำนวนเงินทิป(บาท)',
                    hintStyle: TextStyle(
                      color: Colors.grey[400],
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 40,
              ),
              Padding(
                padding: const EdgeInsets.only(
                  left: 50,
                  right: 50,
                ),
                child: ElevatedButton(
                  onPressed: () {
                    // ตรวจสอบการป้อนต่างๆ ว่าป้อนหรือบัง ถ้ายังเเสดงเตือน
                    if (txMoney.text.length == 0) {
                      // เเสดง dialog เตือน
                      showWarningDialog(context, 'ป้อนเงินด้วย..');
                    } else if (txPerson.text.length == 0) {
                      // เเสดง dialog เตือน
                      showWarningDialog(context, 'ป้อนจำนวนคนด้วย..');
                    } else {
                      // พร้อมคำนวณ
                      double money = 0, tip = 0, moneyshare = 0;
                      int person = 0;
                      // เเปลงข้อตวามจาก TextField เป็นตัวเลข
                      money = double.parse(txMoney.text);
                      person = int.parse(txPerson.text);
                      if (tipCheck == true) {
                        if (txTip.text.length == 0) {
                          // เเสดง dialog เตือน
                          showWarningDialog(context, 'ป้อนเงินทิปด้วย..');
                          return; // ออกจากการทำงานไม่ทำที่เหลือ
                        } else {
                          tip = double.parse(txTip.text);
                        }
                      }
                      // คำนวณ
                      moneyshare = (money + tip) / person;
                      // ส่งไปเเสดงผลที่หน้า ShowMoneyshare
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) {
                            return ShowMoneyshareUI(
                              money: money,
                              tip: tip,
                              person: person,
                              moneyshare: moneyshare,
                            );
                          },
                        ),
                      );
                    }
                  },
                  child: Text(
                    'คำนวณ',
                  ),
                  style: ElevatedButton.styleFrom(
                    primary: Colors.deepPurple,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(
                        50,
                      ),
                    ),
                    fixedSize: Size(
                      MediaQuery.of(context).size.width,
                      50.0,
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Padding(
                padding: const EdgeInsets.only(
                  left: 50,
                  right: 50,
                ),
                child: ElevatedButton.icon(
                  onPressed: () {
                    setState(() {
                      txMoney.text = '';
                      txPerson.text = '';
                      tipCheck = false;
                      txTip.text = '';
                    });
                  },
                  icon: Icon(
                    Icons.refresh,
                  ),
                  label: Text(
                    'ยกเลิก',
                  ),
                  style: ElevatedButton.styleFrom(
                    primary: Colors.red,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(
                        50,
                      ),
                    ),
                    fixedSize: Size(
                      MediaQuery.of(context).size.width,
                      50,
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 25,
              ),
              Text(
                'Created by CS SAU 2021',
                style: TextStyle(
                  color: Color(0xFF454545),
                  fontWeight: FontWeight.bold,
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
