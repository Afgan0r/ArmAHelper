import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class WindAmendment extends StatefulWidget {
  createState() => _WindAmendmentState();
}

class _WindAmendmentState extends State<WindAmendment> {
  double amendment05 = 0;
  double amendment1 = 0;
  TextEditingController windSpeedController = TextEditingController();
  TextEditingController fourMpsWindController = TextEditingController();
  double windSpeed;
  double fourMpsWind;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: <Widget>[
        Container(
            margin: EdgeInsets.only(top: 25.0, bottom: 75.0),
            alignment: Alignment.bottomLeft,
            child: Text(
              'Автор Afgan0r \n(vk.com/afgan0r)',
              style: TextStyle(color: Colors.black26),
            )),
        Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Container(
              width: 175,
              margin: EdgeInsets.all(8.0),
              child: TextField(
                decoration: InputDecoration(labelText: 'Скорость ветра'),
                onChanged: (v) => setState(() {
                  windSpeed = double.parse(v);
                  if (fourMpsWindController.text != '') {
                    amendment05 = windSpeed / 4 * fourMpsWind * 0.5;
                    amendment1 = windSpeed / 4 * fourMpsWind * 1;
                    amendment05 = roundAmendment(amendment05);
                    amendment1 = roundAmendment(amendment1);
                  }
                }),
                controller: windSpeedController,
                keyboardType: TextInputType.number,
              ),
            ),
            Container(
              width: 175,
              margin: EdgeInsets.all(8.0),
              child: TextField(
                decoration: InputDecoration(labelText: '4mps wind(MRADs)'),
                onChanged: (v) => setState(() {
                  fourMpsWind = double.parse(v);
                  if (windSpeedController.text != '') {
                    amendment05 = windSpeed / 4 * fourMpsWind * 0.5;
                    amendment1 = windSpeed / 4 * fourMpsWind * 1;
                    amendment05 = roundAmendment(amendment05);
                    amendment1 = roundAmendment(amendment1);
                  }
                }),
                controller: fourMpsWindController,
                keyboardType: TextInputType.number,
              ),
            ),
          ],
        ),
        Container(
            margin: EdgeInsets.all(8.0),
            child: new Text(
                'Поправка на ветер при коэффициенте 0.5 - $amendment05')),
        Container(
            margin: EdgeInsets.all(8.0),
            child:
                new Text('Поправка на ветер при коэффициенте 1 - $amendment1')),
        Container(
          margin: EdgeInsets.all(8.0),
          child: Center(
            child: RaisedButton(
              color: Colors.blueGrey[400],
              child: Text('Сбросить'),
              onPressed: () {
                setState(() {
                  amendment05 = 0;
                  amendment1 = 0;
                  windSpeedController.clear();
                  fourMpsWindController.clear();
                });
              },
            ),
          ),
        )
      ],
    );
  }

  double roundAmendment(double num) {
    double result;
    String numString = num.toString();
    int desirePrecision = numString.indexOf('.') + 1;
    int length = numString.length;
    if (desirePrecision != length && desirePrecision < length) {
      result = double.parse(num.toStringAsFixed(desirePrecision));
    } else {
      result = num;
    }
    return result;
  }
}
