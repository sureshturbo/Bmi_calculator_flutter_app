import 'package:flutter/material.dart';

class Bmi extends StatefulWidget {
  @override
  _BmiState createState() => _BmiState();
}

class _BmiState extends State<Bmi> {
  double _height = 175.0;
  double _weight = 75.0;
  int _bmi = 0;
  String _condition = 'select data';
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size; //different type of screen size

    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          //colum,row.stack multiple widget store pannum so children: [] use pannanum,
          children: <Widget>[
            Container(
              height: size.height * 0.50,
              width: double.infinity, //device voda full width yeduthukum.
              decoration: new BoxDecoration(color: Colors.green),
              //padding column thuku kuduka kudathu,container tha kudukanum
              padding: EdgeInsets.symmetric(vertical: 30, horizontal: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    "BMI",
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 60),
                  ),
                  Text(
                    "Calculator",
                    style: TextStyle(color: Colors.white, fontSize: 40),
                  ),
                  /* Text("25"), right la varanum so sizebox us pannanum*/
                  SizedBox(
                    width: double.infinity,
                    child: Container(
                      child: Text(
                        /*"25"*/
                        "$_bmi",
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 40.0),
                        textAlign: TextAlign.right,
                      ),
                    ),
                  ),
                  //Text("condition: Overweight") onu normal la innonu bold varanu na nama richtext use pannanum
                  RichText(
                      text: TextSpan(
                          text: 'Condition : ',
                          style: TextStyle(color: Colors.white, fontSize: 25),
                          children: <TextSpan>[
                        TextSpan(
                          text:
                              //'overweight ',
                              "$_condition",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 25,
                              fontWeight: FontWeight.bold),
                        )
                      ]))
                ],
              ),
            ),
            Container(
              padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
              width: double.infinity,
              child: Column(
                children: <Widget>[
                  //SizedBox(height: size.height * 0.3),
                  Text(
                    "Choose data",
                    style: TextStyle(
                        color: Colors.green,
                        fontSize: 30,
                        fontWeight: FontWeight.bold),
                  ),
                  //SizedBox(height: size.height * 0.3),
                  RichText(
                      text: TextSpan(
                          text: 'height : ',
                          style: TextStyle(color: Colors.black, fontSize: 25),
                          children: <TextSpan>[
                        TextSpan(
                          text: '$_height cm ',
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 25,
                              fontWeight: FontWeight.bold),
                        )
                      ])),
                  Slider(
                    value: _height,
                    min: 0,
                    max: 250,
                    onChanged: (height) {
                      //_height = height; direct ta epadi kuduka kudathu set State la kudukanum
                      setState(() {
                        _height = height;
                      });
                    },
                    divisions: 250, // division podatha label view aagum.
                    label: "$_height",
                    //chanage colors
                    activeColor: Colors.blue,
                    inactiveColor: Colors.grey,
                  ),
                  // SizedBox(height: size.height * 0.3),
                  RichText(
                      text: TextSpan(
                          text: 'weight : ',
                          style: TextStyle(color: Colors.black, fontSize: 25),
                          children: <TextSpan>[
                        TextSpan(
                          text: '$_weight kg',
                          style: TextStyle(
                              color: Colors.black,
                              fontSize: 25,
                              fontWeight: FontWeight.bold),
                        )
                      ])),
                  Slider(
                    value: _weight,
                    min: 0,
                    max: 300,
                    onChanged: (weight) {
                      //_height = height; direct ta epadi kuduka kudathu set State la kudukanum
                      setState(() {
                        _weight = weight;
                      });
                    },
                    divisions: 300, // division podatha label view aagum.
                    label: "$_weight",
                    //chanage colors
                    activeColor: Colors.blue,
                    inactiveColor: Colors.grey,
                  ),

                  Container(
                    width: size.width * 0.8, //but noview and color change
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(30),
                      child: FlatButton(
                        onPressed: () {
                          setState(() {
                            //18.5 - 25 healthy 25-30 overweight > 30 obesity
                            if (_bmi >= 18.5 && _bmi <= 25) {
                              _condition = "normal";
                            } else if (_bmi > 25 && _bmi <= 30) {
                              _condition = "overweight";
                            } else if (_bmi > 30) {
                              _condition = "";
                            } else {
                              _condition = "underweight";
                            }
                            //bmi calculate formula see in google
                            _bmi = (_weight /
                                    ((_height / 100) * (_height / 100)))
                                .round()
                                .toInt(); //round pannitu vara value double la varum so int convert panna using toint() method
                          });
                        },
                        child: Text(
                          'calculate',
                          style: TextStyle(color: Colors.white, fontSize: 20),
                        ),
                        color: Colors.green,
                        padding:
                            EdgeInsets.symmetric(vertical: 15, horizontal: 40),
                      ),
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
