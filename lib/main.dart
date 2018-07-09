import 'package:flutter/material.dart';

void main() => runApp(new MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Flutter Sliders App',
      theme: new ThemeData(
        primarySwatch: Colors.green,
      ),
      home: new MyHomePage(title: 'Sliders app'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => new _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<String> _dropdownValues;
  String _dropdownSelectedValue;
  var _value = 0.0;

  void _onSliderChange(double value) {
    setState(() {
      _value = value;
    });
  }

  @override
  void initState() {
    _dropdownValues = List();
    _dropdownValues.addAll(['Value 1', 'Value 2', 'Value 3', 'Value 4']);
    super.initState();
  }

  void _onDropdownValueChanged(String value) {
    setState(() {
      _dropdownSelectedValue = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        centerTitle: true,
        title: new Text(widget.title),
      ),
      body: new Center(
        child: new Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text('value is ${_value.round()}'),
            Slider(
              value: _value,
              min: 0.0,
              max: 100.0,
              onChanged: (var value) {
                _onSliderChange(value);
              },
            ),
            DropdownButton(
              hint: Text('Chose value'),
              value: _dropdownSelectedValue,
              items: _dropdownValues.map((String value) {
                int index = _dropdownValues.indexOf(value);
                return DropdownMenuItem(
                    child: Text(_dropdownValues[index]),
                    value: _dropdownValues[index]);
              }).toList(),
              onChanged: (String value) {
                _onDropdownValueChanged(value);
              },
            ),
          ],
        ),
      ),
    );
  }
}
