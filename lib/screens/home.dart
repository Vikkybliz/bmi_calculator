import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:bmi_calculator/constants/constants.dart';
import 'package:bmi_calculator/widgets/leftbar.dart';
import 'package:bmi_calculator/widgets/rightbar.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {

  TextEditingController _heightController = TextEditingController();
  TextEditingController _weightController = TextEditingController();
  double _bmiResult = 0;
  String _textResult = "";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'BMI CALCULATOR',
              style: GoogleFonts.lato(
                  textStyle: TextStyle(color: accentHexColor, fontWeight: FontWeight.w300),
              ),
        ),
        backgroundColor: Colors.transparent,
        centerTitle: true,
        elevation: 0,
      ),
      backgroundColor: mainHexColor,
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height:20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                  width: 130,
                  child: TextField(
                    controller: _heightController,
                    style: TextStyle(
                      fontSize: 42,
                      fontWeight: FontWeight.w300,
                      color: accentHexColor
                    ),
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      hintText: "Height",
                      hintStyle: TextStyle(
                        fontSize: 42,
                        fontWeight: FontWeight.w300,
                        color: Colors.white.withOpacity(.8)
                      )
                    ),
                  ),
                ),
                Container(
                  width: 130,
                  child: TextField(
                    controller: _weightController,
                    style: TextStyle(
                        fontSize: 42,
                        fontWeight: FontWeight.w300,
                        color: accentHexColor
                    ),
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: "Weight",
                        hintStyle: TextStyle(
                            fontSize: 42,
                            fontWeight: FontWeight.w300,
                            color: Colors.white.withOpacity(.8)
                        )
                    ),
                  ),
                )
              ],
            ),
            SizedBox(height: 30,),
            GestureDetector(
              onTap: () {
                double _h = double.parse(_heightController.text);
                double _w = double.parse(_weightController.text);
                setState(() {
                  _bmiResult = _w/(_h * _h);

                  if(_bmiResult > 25){
                    _textResult = "You\'re overweight";
                  } else if(_bmiResult >= 18.5 && _bmiResult <= 25){
                    _textResult = "You have normal Weight";
                  } else{
                    _textResult = "You\'re underweight";
                  }
                });
              },
              child: Container(
                child: Text(
                    "Calculate",
                        style: TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                          color: accentHexColor
                        ),
                ),
              ),
            ),
            SizedBox(height: 50,),
            Container(
              child: Text(
                _bmiResult.toStringAsFixed(2),
                style: TextStyle(
                  fontSize: 90,
                  color: accentHexColor,
                ),
              ),
            ),
            SizedBox(height: 30,),
           Visibility(
             visible: _textResult.isNotEmpty,
             child:  Container(
             child: Text(
               _textResult,
               style: TextStyle(
                 fontSize: 32,
                 fontWeight: FontWeight.w400,
                 color: accentHexColor,
               ),
             ),
           ),),
            SizedBox(height: 10,),
            RightBar(barWidth: 40,),
            SizedBox(height: 20,),
            RightBar(barWidth: 70),
            SizedBox(height: 20,),
            RightBar(barWidth: 40,),
            SizedBox(height: 20,),
            LeftBar(barWidth: 70),
            SizedBox(height: 50,),
            LeftBar(barWidth: 70),
          ],
        ),
      ),
    );
  }
}
