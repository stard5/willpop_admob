import 'package:flutter/material.dart';
import 'package:flutter_native_admob/flutter_native_admob.dart';
import 'package:flutter_native_admob/native_admob_controller.dart';

void main() {
  runApp(App());
}

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyHome(),
    );
  }
}

class MyHome extends StatefulWidget {
  @override
  _MyHomeState createState() => _MyHomeState();
}

class _MyHomeState extends State<MyHome> {

  final _controller = NativeAdmobController();
  static const _adUnitID = "ca-app-pub-3940256099942544/8135179316";

  @override
  Widget build(BuildContext context) {
    return _buildScaffold();
  }

  Scaffold _buildScaffold() {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Plugin example app'),
      ),
      body: WillPopScope(
        onWillPop: () async => _buildShowDialog(context),
        child: Center(
          child: NativeAdmob(
            adUnitID: _adUnitID,
            controller: _controller,
          ),
        ),
      ),
    );
  }

  Future<bool> _buildShowDialog(BuildContext context) {
    return showDialog<bool>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Rewind and remember'),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                Text('나갈꺼야?'),
                Text('광고 한번 누르고 가'),
                NativeAdmob(
                  // Your ad unit id
                  adUnitID: _adUnitID,
                  numberAds: 3,
                  controller: _controller,
                  type: NativeAdmobType.full,
                )
              ],
            ),
          ),
          actions: <Widget>[
            FlatButton(
              child: Text('종료'),
              onPressed: () {
                Navigator.of(context).pop(true);
              },
            ),
            FlatButton(
              child: Text('종료 안함'),
              onPressed: () {
                Navigator.of(context).pop(false);
              },
            ),
          ],
        );
      },
    );
  }
}
