import 'package:calculator_app_17_apr/screen.dart';
import 'package:flutter/material.dart';
import 'package:calculator_app_17_apr/calculation.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      home: HomeScreen(),
    );
  }
}
class HomeScreen extends StatefulWidget {
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String input = "";
  String output = "0";
  @override
  Widget build(BuildContext context) {
    final Function wp = Screen(MediaQuery.of(context).size).wp;
    final Function hp = Screen(MediaQuery.of(context).size).hp;
    return Scaffold(
      backgroundColor: const Color(0xff2c282f) ,
      body: Column(
        children: [
          Container(
            height: hp(35),
            width: wp(95),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.end,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text(input,
                style: TextStyle(
                  color: Color(0xddffffff),
                  fontSize: 20,
                ),
                ),
                Text(output,
                  style: TextStyle(
                  color: Colors.white,
                  fontSize: 50,
                ),),
                SizedBox(
                  height: 20,
                ),
              ],
            ),
          ),
          Container(
            height: hp(65),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                topRight: Radius.circular(30),
                topLeft: Radius.circular(30),
              ),
              color: const Color(0xdd2C3339),
            ),
            child: Container(
              margin: EdgeInsets.symmetric(horizontal: wp(3),vertical: hp(3)),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      GestureDetector(
                          onTap: (){
                            setState(() {
                              input = "";
                              output= "0";
                            });
                            print(input);
                          },
                          child: CalculatorButton(wp: wp, hp: hp,label: "AC",textColor: Color(0xff69E1E9),)),
                      CalculatorButton(wp: wp, hp: hp,label: "+/-",textColor: Color(0xff69E1E9),),
                      CalculatorButton(wp: wp, hp: hp,label: "%",textColor: Color(0xff69E1E9),),
                      GestureDetector(
                          onTap: (){
                            setState(() {
                              input = input + " / ";

                            });
                            print(input);
                          },
                          child: CalculatorButton(wp: wp, hp: hp,label: "/",textColor: Color(0xffDF755E),)), //DF755E
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      buildTotalCalculatorButton(wp, hp,"7"),
                      buildTotalCalculatorButton(wp, hp,"8"),
                      buildTotalCalculatorButton(wp, hp,"9"),
                      GestureDetector(
                          onTap: (){
                            setState(() {
                              input = input+ " * ";
                            });
                            print(input);
                          },
                          child: CalculatorButton(wp: wp, hp: hp,label: "*",textColor: Color(0xffDF755E),)),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      // 4 5 6 -
                      GestureDetector(
                          onTap: (){
                            setState(() {
                              input = input+"4";
                            });
                            print(input);
                          },
                          child: CalculatorButton(wp: wp, hp: hp,label: "4",)),
                      GestureDetector(
                          onTap: (){
                            setState(() {
                              input = input+"5";
                            });
                            print(input);
                          },
                          child: CalculatorButton(wp: wp, hp: hp,label: "5",)),
                      GestureDetector(
                          onTap: (){
                            setState(() {
                              input = input+"6";
                            });
                            print(input);
                          },
                          child: CalculatorButton(wp: wp, hp: hp,label: "6",)),
                      GestureDetector(
                          onTap: (){
                            setState(() {
                              input = input+ " - ";
                            });
                            print(input);
                          },
                          child: CalculatorButton(wp: wp, hp: hp,label: "-",textColor: Color(0xffDF755E),)),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      // 1 2 3 +
                      GestureDetector(
                          onTap: (){
                            setState(() {
                              input = input+"1";
                            });
                            print(input);
                          },
                          child: CalculatorButton(wp: wp, hp: hp,label: "1",)),
                      GestureDetector(
                          onTap: (){
                            setState(() {
                              input = input+"2";
                            });
                            print(input);
                          },
                          child: CalculatorButton(wp: wp, hp: hp,label: "2",)),
                      GestureDetector(
                          onTap: (){
                            setState(() {
                              input = input+"3";
                            });
                            print(input);
                          },
                          child: CalculatorButton(wp: wp, hp: hp,label: "3",)),
                      GestureDetector(
                          onTap: (){
                            setState(() {
                              input = input+ " + ";
                            });
                            print(input);
                          },
                          child: CalculatorButton(wp: wp, hp: hp,label: "+",textColor: Color(0xffDF755E),)),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      CalculatorButton(wp: wp, hp: hp,label: " ",),
                      GestureDetector(
                        onTap: (){
                          setState(() {
                            input = input+ ".";
                          });
                          print(input);
                        },
                          child: CalculatorButton(wp: wp, hp: hp,label: ".",)),
                      GestureDetector(
                          onTap: (){
                            setState(() {
                              input = input+ "0";
                            });
                            print(input);
                          },
                          child: CalculatorButton(wp: wp, hp: hp,label: "0",)),
                      GestureDetector(
                          onTap: (){
                            setState(() {
                              output = calculate(input);
                            });
                          },
                          child: CalculatorButton(wp: wp, hp: hp,label: "=",textColor: Color(0xffDF755E),)),
                    ],
                  ),
                ],
              ),
            ),
          ),

        ],
      ),
    );
  }

  GestureDetector buildTotalCalculatorButton(Function wp, Function hp,String label) {
    return GestureDetector(
                        onTap: (){
                          setState(() {
                            input = input+label;
                          });
                          print(input);
                        },
                        child: CalculatorButton(wp: wp, hp: hp,label: label,));
  }
}

class CalculatorButton extends StatelessWidget {
  const CalculatorButton({
    Key key,
    @required this.wp,
    @required this.hp,
    @required this.label,
    this.textColor = Colors.white,
  }) : super(key: key);
  final String label;
  final Function wp;
  final Function hp;
  final Color textColor;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: wp(4),vertical: hp(1.5)),
      height: 55,
      width: 55,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Color (0xff383B3F),
      ),
      child: Center(
        child: Text(label,
        style: TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.bold,
          color: textColor,
        ),),
      ),
    );
  }
}



