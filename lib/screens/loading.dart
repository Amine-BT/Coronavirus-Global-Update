import 'package:coronavirus/services/myData.dart';
import 'package:coronavirus/services/operations.dart';
import 'package:flutter/material.dart';
import 'package:loading_indicator/loading_indicator.dart';

import 'home.dart';

class Loading extends StatefulWidget {
  static String id = "Loading";

  @override
  _LoadingState createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {
  int index = 0;

  void getData() async {
    MyData myData = MyData("https://corona.lmao.ninja/v2/all");
    MyData myData2 = MyData('https://corona.lmao.ninja/v2/countries');
    MyData myData3 = MyData('https://corona.lmao.ninja/v2/countries?yesterday=true');
    var generalData = await myData.getData();
    var allData = await myData2.getData();
    var yesterdayData = await myData3.getData();
    int _totalCases = 0;
    int _totalDeaths = 0;
    int _totalRecovered = 0;
    int _activeCases = 0;
    int _totalAffectedCountries = 0;
    int _criticalCases = 0;
    int _mildCases = 0;

    int _todayTotalCases = 0;
    int _todayTotalDeaths = 0;
    int _todayTotalRecovered = 0;
    int _todayActiveCases = 0;
    int _todayCriticalCases = 0;
    int _todayMildCases = 0;

    int _yesterdayTotalDeaths = 0;
    int _yesterdayTotalRecovered = 0;
    int _yesterdayActiveCases = 0;
    int _yesterdayCriticalCases = 0;
    int _yesterdayMildCases = 0;

    _totalCases = generalData["cases"];
    _totalDeaths = generalData["deaths"];
    _totalRecovered = generalData["recovered"];
    _totalAffectedCountries = generalData["affectedCountries"];

    for (int i = 0; i < _totalAffectedCountries-1; i++) {
      _criticalCases += allData[i]["critical"];
      _todayTotalCases += allData[i]["todayCases"];
      _activeCases += allData[i]["active"];
      _todayTotalDeaths += allData[i]["todayDeaths"];
    }
    for (int i = 0; i < _totalAffectedCountries-1; i++){
      _yesterdayTotalDeaths += yesterdayData[i]["todayDeaths"];
      _yesterdayTotalRecovered += yesterdayData[i]["recovered"];
      _yesterdayActiveCases += yesterdayData[i]["active"];
      _yesterdayCriticalCases += yesterdayData[i]["critical"];
    }

    _yesterdayMildCases = _yesterdayActiveCases - _yesterdayCriticalCases;

    _mildCases = _activeCases - _criticalCases;

    _todayTotalRecovered = _totalRecovered - _yesterdayTotalRecovered;
    _todayActiveCases = _activeCases - _yesterdayActiveCases;
    _todayCriticalCases = _criticalCases - _yesterdayCriticalCases;
    _todayMildCases = _todayActiveCases - _todayCriticalCases;

    Navigator.pushReplacement(
        context,
        MaterialPageRoute(
            builder: (BuildContext context) => Home(
                  virusData: generalData,
                  totalCases: Operations.addSpacing(_totalCases),
                  totalDeaths: Operations.addSpacing(_totalDeaths),
                  totalRecovered: Operations.addSpacing(_totalRecovered),
                  activeCases: Operations.addSpacing(_activeCases),
                  totalAffectedCountries:
                      Operations.addSpacing(_totalAffectedCountries),
                  criticalCases: Operations.addSpacing(_criticalCases),
                  mildCases: Operations.addSpacing(_mildCases),
                  todayTotalCases: Operations.addSpacing(_todayTotalCases),
                  todayTotalDeaths: Operations.addSpacing(_todayTotalDeaths),
                  todayTotalRecovered:
                      Operations.addSpacing(_todayTotalRecovered),
                  todayActiveCases: Operations.addSpacing(_todayActiveCases),
                  todayCriticalCases: Operations.addSpacing(_todayCriticalCases),
                  todayMildCases: Operations.addSpacing(_todayMildCases),
                )));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white30,
      body: Stack(
        children: <Widget>[
          Center(
            child: Container(
              height: MediaQuery.of(context).size.width / 2,
              width: MediaQuery.of(context).size.width / 2,
              child: LoadingIndicator(
                indicatorType: Indicator.ballClipRotateMultiple,
                color: Colors.blue,
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Icon(
                    Icons.home,
                    color: Colors.blue,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text(
                    "Stay Home, Stay Safe",
                    style: TextStyle(
                        color: Colors.blue, fontWeight: FontWeight.bold),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    getData();
  }
}
