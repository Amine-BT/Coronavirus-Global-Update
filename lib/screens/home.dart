import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'firstScreen.dart';
import 'loading.dart';

const titleStyle = TextStyle(
  fontSize: 20,
  color: Colors.black,
  letterSpacing: 1,
);
const boldTitleStyle = TextStyle(
  fontSize: 20,
  color: Colors.black,
  fontWeight: FontWeight.bold,
  letterSpacing: 1,
);

class Home extends StatefulWidget {
  static String id = "Home";
  final virusData;
  final totalCases;
  final totalDeaths;
  final totalRecovered;
  final activeCases;
  final totalAffectedCountries;
  final criticalCases;
  final mildCases;

  final todayTotalCases;
  final todayTotalDeaths;
  final todayTotalRecovered;
  final todayActiveCases;
  final todayCriticalCases;
  final todayMildCases;

  const Home(
      {this.virusData,
      this.totalCases,
      this.totalDeaths,
      this.totalRecovered,
      this.activeCases,
      this.totalAffectedCountries,
      this.criticalCases,
      this.mildCases,
      this.todayTotalCases,
      this.todayTotalDeaths,
      this.todayTotalRecovered,
      this.todayActiveCases,
      this.todayCriticalCases,
      this.todayMildCases});

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int globalIndex = 0;
  AnimationController animationController;

  @override
  Widget build(BuildContext context) {
    var screenWidth = MediaQuery.of(context).size.width;
    var screenHeight = MediaQuery.of(context).size.height;

    List<Widget> bodies = [
      FirstScreen(
        title: "Coronavirus Total Cases:",
        deathTitle: "Total Deaths:",
        recTitle: "Total Recovered:",
        screenHeight: screenHeight,
        screenWidth: screenWidth,
        widget: widget,
        mildCases: widget.mildCases,
        criticalCases: widget.criticalCases,
        virusData: widget.virusData,
        totalAffectedCountries: widget.totalAffectedCountries,
        activeCases: widget.activeCases,
        totalCases: widget.totalCases,
        totalRecovered: widget.totalRecovered,
        totalDeaths: widget.totalDeaths,
      ),
      FirstScreen(
        title: "Coronavirus Today Cases:",
        deathTitle: "Today Deaths:",
        recTitle: "Today Recovered:",
        screenHeight: screenHeight,
        screenWidth: screenWidth,
        widget: widget,
        mildCases: widget.todayMildCases,
        criticalCases: widget.todayCriticalCases,
        virusData: widget.virusData,
        totalAffectedCountries: widget.totalAffectedCountries,
        totalCases: widget.todayTotalCases,
        activeCases: widget.todayActiveCases,
        totalRecovered: widget.todayTotalRecovered,
        totalDeaths: widget.todayTotalDeaths,
      ),
    ];

    void updateData() {
      Navigator.pushReplacementNamed(context, Loading.id);
    }

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.lightBlueAccent.withOpacity(0.6),
        title: Padding(
          padding: EdgeInsets.only(top: 10),
          child: Text(
            "Coronavirus : Global",
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
        ),
        elevation: 6,
        actions: <Widget>[
          Padding(
            padding: EdgeInsets.only(top: 10, right: 15),
            child: GestureDetector(
              onTap: () {
                updateData();
              },
              child: Icon(
                FontAwesomeIcons.syncAlt,
              ),
            ),
          ),
        ],
        bottom: PreferredSize(
          preferredSize: Size(double.infinity, 45),
          child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: Row(
              children: <Widget>[
                Expanded(
                  child: CupertinoSegmentedControl(
                    onValueChanged: (int value) {
                      setState(() {
                        globalIndex = value;
                      });
                    },
                    children: <int, Widget>{
                      0: Text("Total Cases"),
                      1: Text("Today Cases")
                    },
                    groupValue: globalIndex,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      body: Stack(
        children: <Widget>[
          bodies[globalIndex],
          Align(
            alignment: Alignment.bottomCenter,
            child: Card(
              margin: EdgeInsets.all(20),
              elevation: 6,
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: <Widget>[

                    Flexible(
                      child: Text(
                        "Total Affected Countries: ",
                        style: titleStyle,
                      ),
                    ),
                    Text(
                      widget.totalAffectedCountries,
                      style: boldTitleStyle.copyWith(color: Colors.redAccent),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  @override
  void initState() {
    super.initState();
  }
}
