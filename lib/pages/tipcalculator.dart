import 'package:flutter/material.dart';

class TipCalculator extends StatefulWidget {
  const TipCalculator({Key? key}) : super(key: key);

  @override
  State<TipCalculator> createState() => _TipCalculatorState();
}

class _TipCalculatorState extends State<TipCalculator> {
  int _tipPercentage = 0;
  int _personCounter = 1;
  double _billAmount = 0.0;
  double? _personBill;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        margin: EdgeInsets.all(100.5),
        //alignment: Alignment.center,
        //color: Colors.grey,
        child: ListView(
          children: [
            Container(
              height: 150,
              width: MediaQuery.of(context).size.width * 0.01,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Total Bill per person",
                    style: TextStyle(color: Colors.white, fontSize: 15),
                  ),
                  Text(
                    "${calculateTotalBillPerPerson(_billAmount, _personCounter)}",
                    style: TextStyle(color: Colors.white, fontSize: 35),
                  ),
                ],
              ),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10.0),
                color: Colors.blue,
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 20.0),
              padding: EdgeInsets.all(12.0),
              decoration: BoxDecoration(
                color: Colors.transparent,
                border: Border.all(
                  style: BorderStyle.solid,
                  color: Colors.blueGrey.shade100,
                ),
                borderRadius: BorderRadius.circular(10.0),
              ),
              child: Column(
                children: [
                  TextField(
                    keyboardType:
                        TextInputType.numberWithOptions(decimal: true),
                    style: TextStyle(color: Colors.blue),
                    decoration: InputDecoration(
                      //prefixText: "Bill Amount   ",
                      labelText: "Bill Amount   ",
                      prefixIcon: Icon(Icons.attach_money),
                    ),
                    onChanged: (String value) {
                      setState(() {
                        try {
                          _billAmount = double.parse(value);
                          //print("bill amount is $_billAmount");
                        } catch (exception) {
                          _billAmount = 0.0;
                        }
                      });
                    },
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 20.0, bottom: 20.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("Split"),
                        Row(
                          children: [
                            ButtonTheme(
                              minWidth: 35.0,
                              height: 15.0,
                              child: RaisedButton(
                                onPressed: () {
                                  setState(() {
                                    if (_personCounter > 1) {
                                      _personCounter--;
                                    }
                                  });
                                },
                                child: Text(
                                  "-",
                                  style: TextStyle(fontSize: 20),
                                ),
                              ),
                            ),
                            SizedBox(
                              width: 2.0,
                            ),
                            Text(
                              "$_personCounter",
                              style:
                                  TextStyle(color: Colors.blue, fontSize: 19),
                            ),
                            SizedBox(
                              width: 2.0,
                            ),
                            ButtonTheme(
                              minWidth: 35.0,
                              height: 15.0,
                              child: RaisedButton(
                                onPressed: () {
                                  setState(() {
                                    _personCounter++;
                                  });
                                },
                                child: Text(
                                  "+",
                                  style: TextStyle(fontSize: 20),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(top: 20, bottom: 20),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("Tip"),
                        Text(
                          "\$ ${calculateTotaltip(_billAmount, _tipPercentage).toStringAsFixed(2)}  ",
                          style: TextStyle(color: Colors.blue, fontSize: 18),
                        ),
                      ],
                    ),
                  ),

                  //Slider
                  Column(
                    children: [
                      Text(
                        "$_tipPercentage%",
                        style: TextStyle(color: Colors.blue, fontSize: 25),
                      ),
                      Slider(
                          min: 0,
                          max: 100,
                          divisions: 10,
                          value: _tipPercentage.toDouble(),
                          onChanged: (double value) {
                            setState(() {
                              _tipPercentage = value.round();
                            });
                          }),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  dynamic calculateTotaltip(double totalBill, int slideValue) {
    double tipAns = 0.0;
    tipAns = (totalBill * slideValue) / 100;
    return tipAns;
  }

  dynamic calculateTotalBillPerPerson(double totalBill, int splitValue) {
    double billPerPersonAns;
    billPerPersonAns = totalBill / splitValue;
    billPerPersonAns =
        billPerPersonAns + (calculateTotaltip(totalBill, _tipPercentage))/splitValue;
    return billPerPersonAns.toStringAsFixed(2);
  }
}
