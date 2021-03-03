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
  static const _adUnitID = "ca-app-pub-3940256099942544/8135179316";
  final _controller = NativeAdmobController()..setAdUnitID(_adUnitID);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('willpop_admob example'),
      ),
      body: WillPopScope(
        onWillPop: () async => _buildShowDialog(context),
        child: Center(
          child: Text('Press Back key to show willpop_admob and exit app.'),
        ),
      ),
    );
  }

  Future<bool> _buildShowDialog(BuildContext context) {
    return showDialog<bool>(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Exit app?'),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                SizedBox(
                  width: MediaQuery.of(context).size.width,
                  height: 200,
                  child: NativeAdmob(
                    // Your ad unit id
                    adUnitID: _adUnitID,
                    numberAds: 2,
                    controller: _controller,
                    type: NativeAdmobType.full,
                  ),
                )
              ],
            ),
          ),
          actions: <Widget>[
            FlatButton(
              child: Text('Exit'),
              onPressed: () {
                Navigator.of(context).pop(true);
              },
            ),
            FlatButton(
              child: Text('Cancel'),
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
