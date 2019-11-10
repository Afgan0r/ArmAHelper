/*
Copyright 2019 Afgan0r

Licensed under the Apache License, Version 2.0 (the "License");
you may not use this file except in compliance with the License.
You may obtain a copy of the License at

http://www.apache.org/licenses/LICENSE-2.0

Unless required by applicable law or agreed to in writing, software
distributed under the License is distributed on an "AS IS" BASIS,
WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
See the License for the specific language governing permissions and
limitations under the License.
*/

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CountDistanceByBinocular extends StatefulWidget {
  createState() => _CountDistanceByBinocular();
}

class _CountDistanceByBinocular extends State<CountDistanceByBinocular> {
  TextEditingController controller = TextEditingController();

  int distance = 0;

  var dropdownValue = 'Пехотинец в позе стоя';
  var dropdownItems = [
    'Пехотинец в позе стоя',
    'Пехотинец в позе сидя',
    'Дверь',
    'Abrams',
    'Bradley',
    'Т-90',
    'Т-72',
    'БТР-70',
    'БТР-90',
    'БМП-2',
  ];

  Map<String, int> heightMaps = {
    'Пехотинец в позе стоя': 1820,
    'Пехотинец в позе сидя': 1300,
    'Дверь': 2100,
    'Abrams': 2700,
    'Bradley': 3000,
    'Т-90': 2600,
    'Т-72': 2100,
    'БТР-70': 2300,
    'БТР-90': 2550,
    'БМП-2': 2200,
  };

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
            width: 225,
            margin: EdgeInsets.all(8.0),
            child: TextField(
              decoration:
                  InputDecoration(labelText: 'Делений бинокля или милы'),
              onChanged: (v) => setState(() {
                var height = heightMaps[dropdownValue];
                var divisions = double.parse(controller.text);
                distance = (height / divisions).round();
              }),
              controller: controller,
              keyboardType: TextInputType.number,
            ),
          ),
          Container(
            margin: EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text('Объект - '),
                DropdownButton<String>(
                  value: dropdownValue,
                  elevation: 16,
                  style: TextStyle(color: Colors.black),
                  underline: Container(
                    height: 2,
                    color: Colors.black,
                  ),
                  onChanged: (String newValue) {
                    setState(() {
                      dropdownValue = newValue;
                      if (controller.text != '') {
                        var height = heightMaps[dropdownValue];
                        var divisions = double.parse(controller.text);
                        distance = (height / divisions).round();
                      }
                    });
                  },
                  items: dropdownItems
                      .map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem<String>(
                      value: value,
                      child: Text(value),
                    );
                  }).toList(),
                ),
              ],
            ),
          ),
          Container(
              margin: EdgeInsets.all(8.0),
              child: new Text('Дальность до цели - $distance')),
          Container(
            margin: EdgeInsets.all(8.0),
            child: Center(
              child: RaisedButton(
                child: Text('Сбросить'),
                color: Colors.blueGrey[400],
                onPressed: () => setState(() {
                  controller.clear();
                  distance = 0;
                }),
              ),
            ),
          )
        ]),
      ],
    );
  }
}
