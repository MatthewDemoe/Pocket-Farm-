//reference https://google.github.io/charts/flutter/example/axes/custom_font_size_and_color.html
//reference https://google.github.io/charts/flutter/example/bar_charts/simple

import 'package:charts_flutter/flutter.dart';
import 'package:flutter/material.dart';

class ChartScreen extends StatefulWidget {
  ChartScreen({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _ChartScreen createState() => _ChartScreen();
}

class _ChartScreen extends State<ChartScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Chart.seedData(),
    );
  }
}

class Foods {
  final String foodType;
  final int totalOfFood;

  Foods(this.foodType, this.totalOfFood);
}

class Chart extends StatelessWidget {
  final List<Series> foodList;
  final bool animateChart;

  Chart(this.foodList, {this.animateChart});

  factory Chart.seedData() {
    return new Chart(
      _createSeedData(),
      animateChart: false,
    );
  }

  @override
  Widget build(BuildContext context) {
    return new BarChart(foodList,
        animate: animateChart,
        domainAxis: OrdinalAxisSpec(
            renderSpec: SmallTickRendererSpec(
          labelStyle: new TextStyleSpec(
              fontSize: 18, // size in Pts.
              color: MaterialPalette.black),
        )),
        primaryMeasureAxis: NumericAxisSpec(
          renderSpec: new GridlineRendererSpec(

              // Tick and Label styling here.
              labelStyle: new TextStyleSpec(
                  fontSize: 18,
                  fontFamily: 'Roboto', // size in Pts.
                  color: MaterialPalette.black),

              // Change the line colors to match text color.
              lineStyle: new LineStyleSpec(
                  color: MaterialPalette.black))),
    );

        
  }

  static List<Series<Foods, String>> _createSeedData() {
    final data = [
      new Foods('Carrot', 2000),
      new Foods('Cabbage', 1),
      new Foods('Kale', 2),
    ];

    return [
      new Series<Foods, String>(
        id: 'Grown',
        colorFn: (_, __) => MaterialPalette.blue.shadeDefault,
        domainFn: (Foods food, _) => food.foodType,
        measureFn: (Foods food, _) => food.totalOfFood,
        data: data,
      )
    ];
  }
}