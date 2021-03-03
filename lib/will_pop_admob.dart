import 'package:flutter_native_admob/flutter_native_admob.dart';
import 'package:flutter_native_admob/native_admob_controller.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

export 'package:willpop_admob/will_pop_admob.dart';

class WillPopAdmob extends StatelessWidget {
  final String adUnitID;
  final String playStoreURL;
  final Widget title;
  final Widget child;
  final Widget exitTitle;
  final Widget cancelTitle;
  final Widget reviewTitle;
  final NativeAdmobController _controller;

  WillPopAdmob({
    @required this.adUnitID,
    @required this.playStoreURL,
    this.title,
    this.child,
    @required this.exitTitle,
    this.cancelTitle,
    this.reviewTitle,
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
          FlatButton(
            child: reviewTitle,
            onPressed: () {
              _launchURL();
            },
          ),
        ],

      ),
    );
  }
  _launchURL() async {
    var url;
    url = playStoreURL;
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }

}
