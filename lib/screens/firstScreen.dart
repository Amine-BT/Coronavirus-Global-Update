import 'package:coronavirus/widgets/infoCard.dart';
import 'package:coronavirus/widgets/treeLines.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'home.dart';

class FirstScreen extends StatelessWidget {
  const FirstScreen({
    Key key,
    @required this.screenHeight,
    @required this.screenWidth,
    @required this.widget,
    @required this.virusData,
    @required this.totalCases,
    @required this.totalDeaths,
    @required this.totalRecovered,
    @required this.activeCases,
    @required this.totalAffectedCountries,
    @required this.criticalCases,
    @required this.mildCases,
    @required this.title,
    @required this.deathTitle,
    @required this.recTitle,
  }) : super(key: key);

  final double screenHeight;
  final double screenWidth;
  final Home widget;
  final virusData;
  final totalCases;
  final totalDeaths;
  final totalRecovered;
  final activeCases;
  final totalAffectedCountries;
  final criticalCases;
  final mildCases;
  final title;
  final deathTitle;
  final recTitle;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white.withOpacity(0.9),
      height: screenHeight,
      width: screenWidth,
      child: ListView(
        children: <Widget>[
          SizedBox(
            height: 10,
          ),
          InfoCard(
            title: title,
            value: totalCases,
            icon: FontAwesomeIcons.viruses,
            iconColor: Colors.black,
          ),
          Row(
            children: <Widget>[
              Expanded(
                child: InfoCard(
                  title: recTitle,
                  value: totalRecovered,
                  color: Colors.green,
                  valueColor: Colors.white,
                  titleColor: Colors.amberAccent,
                  icon: Icons.directions_walk,
                  iconColor: Colors.white,
                ),
              ),
              Expanded(
                child: InfoCard(
                  title: deathTitle,
                  value: totalDeaths,
                  color: Colors.red.withOpacity(0.8),
                  valueColor: Colors.white,
                  titleColor: Colors.amberAccent,
                  icon: FontAwesomeIcons.bookDead,
                  iconColor: Colors.white,
                ),
              ),
            ],
          ),
          Container(
            margin: EdgeInsets.all(40),
            height: 2,
            color: Colors.black38,
            width: screenWidth / 1.5,
          ),
          Card(
            color: Colors.white,
            margin: EdgeInsets.only(bottom: 15, right: 15, left: 15),
            elevation: 7,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            child: Padding(
              padding: EdgeInsets.all(8.0),
              child: Column(
                mainAxisSize: MainAxisSize.max,
                children: <Widget>[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      Text(
                        "Avtive Cases : ",
                        style: titleStyle,
                      ),
                      Text(
                        activeCases,
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 20,
                          color: Colors.redAccent,
                          letterSpacing: 1,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 8,
                  ),
                  TreeLines(screenWidth: screenWidth),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: <Widget>[
                      Expanded(
                          child: InfoCard(
                        title: "Critical Condition:",
                        value: criticalCases,
                        titleColor: Colors.red,
                        icon: FontAwesomeIcons.procedures,
                        iconColor: Colors.red,
                      )),
                      Expanded(
                          child: InfoCard(
                        title: "Stable Condition:",
                        value: mildCases,
                        titleColor: Colors.amber.withOpacity(0.9),
                        icon: FontAwesomeIcons.stethoscope,
                        iconColor: Colors.amber,
                      )),
                    ],
                  ),
                ],
              ),
            ),
          ),
          SizedBox(
            height: 90,
          ),
        ],
      ),
    );
  }
}
