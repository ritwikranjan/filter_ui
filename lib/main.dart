import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

const kHeaderTextStyle = TextStyle(
  fontSize: 20.0,
  fontFamily: 'NotoSans',
  color: Color(0xFFA2A5B0),
);

const kListTextStyle = TextStyle(
  fontSize: 15.0,
  fontFamily: 'NotoSans',
  color: Color(0xFFA2A5B0),
);

const sliderThemeData = SliderThemeData(
  rangeThumbShape: RoundRangeSliderThumbShape(
    enabledThumbRadius: 5.0,
  ),
  rangeTrackShape: RoundedRectRangeSliderTrackShape(),
  trackHeight: 5.0,
  inactiveTrackColor: Color(0xFF275819),
  activeTrackColor: Color(0xFF00B1F4),
  showValueIndicator: ShowValueIndicator.always,
);

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          leading: Icon(Icons.arrow_back),
          title: Text('Filter'),
        ),
        body: FilterPage(),
      ),
    );
  }
}

class FilterPage extends StatefulWidget {
  @override
  _FilterPageState createState() => _FilterPageState();
}

class _FilterPageState extends State<FilterPage> {
  RangeValues priceRange = RangeValues(100, 5000),
      experienceRange = RangeValues(1, 3);
  bool nearest = false, today = false, tomorrow = false, dayAfter = false;
  RangeLabels priceLabels = RangeLabels('Rs. 100', 'Rs. 5000'),
      experienceLabels = RangeLabels('1 Year', '3 Years');

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Column(
          children: <Widget>[
            Row(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.fromLTRB(16, 8, 16, 8),
                  child: Text(
                    'Price Range',
                    style: kHeaderTextStyle,
                  ),
                ),
                Expanded(
                  child: Center(
                    child: Container(
                      margin: EdgeInsets.only(right: 25),
                      width: double.maxFinite,
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: Colors.grey,
                          width: 0.5,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            SliderTheme(
              data: sliderThemeData,
              child: RangeSlider(
                values: priceRange,
                labels: priceLabels,
                divisions: 1000,
                onChanged: (RangeValues value) {
                  setState(() {
                    priceRange = value;
                    priceLabels = RangeLabels('Rs. ${priceRange.start.floor()}',
                        'Rs. ${priceRange.end.floor()}');
                  });
                },
                min: 0,
                max: 10000,
              ),
            ),
            Row(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.fromLTRB(16, 8, 16, 8),
                  child: Text(
                    'Availability',
                    style: kHeaderTextStyle,
                  ),
                ),
                Expanded(
                  child: Container(
                    margin: EdgeInsets.fromLTRB(10, 25, 25, 25),
                    width: double.maxFinite,
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: Colors.grey,
                        width: 0.5,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            ListView(
              padding: EdgeInsets.all(0),
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              children: <Widget>[
                CheckboxListTile(
                  title: Text(
                    'Nearest',
                    style: kListTextStyle,
                  ),
                  value: nearest,
                  onChanged: (bool value) {
                    setState(() {
                      nearest = value;
                    });
                  },
                ),
                CheckboxListTile(
                  title: Text(
                    'Today',
                    style: kListTextStyle,
                  ),
                  value: today,
                  onChanged: (bool value) {
                    setState(() {
                      today = value;
                    });
                  },
                ),
                CheckboxListTile(
                  title: Text(
                    'Tomorrow',
                    style: kListTextStyle,
                  ),
                  value: tomorrow,
                  onChanged: (bool value) {
                    setState(() {
                      tomorrow = value;
                    });
                  },
                ),
                CheckboxListTile(
                  title: Text(
                    'Day after Tomorrow',
                    style: kListTextStyle,
                  ),
                  value: dayAfter,
                  onChanged: (bool value) {
                    setState(() {
                      dayAfter = value;
                    });
                  },
                ),
              ],
            ),
            Row(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.fromLTRB(16, 8, 16, 8),
                  child: Text(
                    'Experience',
                    style: kHeaderTextStyle,
                  ),
                ),
                Expanded(
                  child: Container(
                    margin: EdgeInsets.fromLTRB(10, 25, 25, 25),
                    width: double.maxFinite,
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: Colors.grey,
                        width: 0.5,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            SliderTheme(
              data: sliderThemeData,
              child: RangeSlider(
                values: experienceRange,
                labels: experienceLabels,
                divisions: 10,
                onChanged: (RangeValues value) {
                  setState(() {
                    experienceRange = value;
                    experienceLabels = RangeLabels(
                        '${experienceRange.start.floor()} Years',
                        '${experienceRange.end.ceil()} Years');
                  });
                },
                min: 0,
                max: 10,
              ),
            ),
          ],
        ),
        Container(
          margin: EdgeInsets.only(bottom: 30, left: 10.0, right: 10.0),
          child: RaisedButton(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(8.0),
            ),
            padding: EdgeInsets.all(8),
            color: Color(0xFF00B1F4),
            child: Text(
              'Apply',
              style: TextStyle(
                fontSize: 20.0,
                fontFamily: 'NotoSans',
                fontWeight: FontWeight.bold,
              ),
            ),
            textColor: Colors.white,
            onPressed: () {},
          ),
        )
      ],
    );
  }
}
