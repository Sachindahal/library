import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';
import './models/framework.dart';
import './screens/library.dart';
import 'screens/album.dart';
import 'screens/items.dart';

class App extends StatelessWidget {
  final Library myLib;
  const App({Key key, this.myLib}):super(key:key);
  @override
  Widget build(BuildContext context) {
    return ScopedModel<Library>(
      model:myLib,
      child: MaterialApp(
        title: 'Library1',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: LibraryPage(),
        routes: <String, WidgetBuilder>{
          '/library': (BuildContext context) => LibraryPage(),
          '/album': (BuildContext context) => AddAlbumPage(),
          '/items': (BuildContext context) => ItemsPage(),
        },
      ) ,
    );
  }
}