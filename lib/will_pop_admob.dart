import 'package:flutter_native_admob/flutter_native_admob.dart';
import 'package:flutter_native_admob/native_admob_controller.dart';
import 'package:flutter/material.dart';

class WillPopAdmob extends StatelessWidget {
  final String adUnitID;

  final Widget title;
  final Widget child;
  final Widget exitTitle;
  final Widget cancelTitle;
  final NativeAdmobController _controller;

  WillPopAdmob({
    @required this.adUnitID,
    this.title,
    this.child,
    @required this.exitTitle,
    this.cancelTitle,
  })  : _controller = NativeAdmobController()..setAdUnitID(adUnitID),
        super();

  @override
  Widget build(BuildContext context) => WillPopScope(
        child: this.child,
        onWillPop: () => _buildShowDialog(context),
      );

  Future<bool> _buildShowDialog(BuildContext context) {
    return showDialog<bool>(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) => AlertDialog(
        title: title,
        content: SingleChildScrollView(
          child: ListBody(
            children: [
              SizedBox(
                width: MediaQuery.of(context).size.width,
                height: 200,
                child: NativeAdmob(
                  // Your ad unit id
                  adUnitID: adUnitID,
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
            child: exitTitle,
            onPressed: () {
              Navigator.of(context).pop(true);
            },
          ),
          FlatButton(
            child: cancelTitle,
            onPressed: () {
              Navigator.of(context).pop(false);
            },
          ),
        ],
      ),
    );
  }
}
