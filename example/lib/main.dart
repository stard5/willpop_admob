import 'package:flutter/material.dart';
import 'package:willpop_admob_example/will_pop_admob.dart';

void main() {
  runApp(App());
}

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) => MaterialApp(
        home: Scaffold(
          appBar: AppBar(
            title: const Text('willpop_admob example'),
          ),
          body: WillPopAdmob(
              adUnitID: 'ca-app-pub-3940256099942544/8135179316',
              title: Text('Exit app?'),
              child: Center(
                child:
                    Text('Press Back key to show willpop_admob and exit app.'),
              ),
              exitTitle: Text('Exit'),
              cancelTitle: Text('Cancel')),
        ),
      );
}
