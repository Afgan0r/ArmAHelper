import 'package:arma_helper_nav_bar_ver/count_distance.dart';
import 'package:arma_helper_nav_bar_ver/wind_amendment.dart';
import 'package:flutter/material.dart';
import 'package:bottom_navy_bar/bottom_navy_bar.dart';

void main() => runApp(ArmaHelper());

class ArmaHelper extends StatefulWidget {
  createState() => _ArmaHelperState();
}

class _ArmaHelperState extends State<ArmaHelper> {
  var _selectedIndex = 0;

  PageController pageController = PageController(
    initialPage: 0,
    keepPage: true,
  );

  Widget buildPageView() {
    return PageView(
      controller: pageController,
      onPageChanged: (index) {
        pageChanged(index);
      },
      children: <Widget>[
        WindAmendment(),
        CountDistanceByBinocular(),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
          backgroundColor: Colors.blueGrey,
            body: buildPageView(),
            bottomNavigationBar: BottomNavyBar(
                selectedIndex: _selectedIndex,
                onItemSelected: _onItemSelected,
                showElevation: true,
                iconSize: 24,
                backgroundColor: Colors.black12,
                items: [
                  BottomNavyBarItem(
                      title: Text('Поправка'),
                      icon: Icon(Icons.compare_arrows),
                      activeColor: Colors.black),
                  BottomNavyBarItem(
                      title: Text('Дальность'),
                      icon: Icon(Icons.straighten),
                      activeColor: Colors.black),
                ])));
  }

  void pageChanged(int i) {
    setState(() => _selectedIndex = i);
  }

  void _onItemSelected(int index) {
    setState(() {
      _selectedIndex = index;
      pageController.animateToPage(index,
          duration: Duration(milliseconds: 750), curve: Curves.easeInOutQuart);
    });
  }
}
