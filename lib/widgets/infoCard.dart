import 'package:flutter/material.dart';

class InfoCard extends StatelessWidget {
  const InfoCard({
    this.title,
    this.value,
    this.titleColor,
    this.valueColor,
    this.color,
    this.icon,
    this.iconColor,
  });

  final title;
  final value;
  final titleColor;
  final valueColor;
  final color;
  final icon;
  final iconColor;

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 6,
      margin: EdgeInsets.all(10),
      color: color ?? Colors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            FittedBox(
              fit: BoxFit.fitWidth,
              child: Text(
                title,
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 20,
                  color: titleColor ?? Colors.black,
                  wordSpacing: 2,
                ),
              ),
            ),
            SizedBox(
              height: 12,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                FittedBox(
                  fit: BoxFit.fitWidth,
                  child: Text(
                    value,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                      color: valueColor ?? Colors.black,
                      letterSpacing: 1,
                    ),
                  ),
                ),
                Flexible(
                  child: SizedBox(
                    width: 21,
                  ),
                ),
                Flexible(
                  child: Icon(
                    icon,
                    color: iconColor,
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
