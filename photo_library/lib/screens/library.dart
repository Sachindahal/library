import 'package:flutter/material.dart';
import 'package:scoped_model/scoped_model.dart';
import '../models/framework.dart';

class LibraryPage extends StatefulWidget {
  // final String title;
  // LibraryPage({Key key, this.title}) : super(key: key);

  @override
  createState() => _LibraryPageState();
}

class _LibraryPageState extends State<LibraryPage> {
  //for navigating to add-album page
  addAlbumPage(BuildContext context) {
    Navigator.of(context).pushNamed('/album');
  }

  //for navigating to items page
  itemPage(BuildContext context) {
    Navigator.of(context).pushNamed('/items');
  }

  @override
  Widget build(BuildContext context) {
    return ScopedModelDescendant<Library>(
        builder: (context, child, model) => Scaffold(
              appBar: AppBar(
                title: Text('${model.libraryName}'),
              ),
              body: ListView(
                padding: EdgeInsets.all(20.0),
                children: <Widget>[
                  Wrap(
                    alignment: WrapAlignment.center,
                    spacing: 10.0,
                    runSpacing: 20.0,
                    children: model.albums != null
                        ? model.albums
                            .map((album) => GestureDetector(
                                onTap: () {
                                  itemPage(context);
                                },
                                //child: Text('${album.albumName}'),

                                child: Column(
                                  children: <Widget>[
                                    Image.file(
                                      album.albumIcon,
                                      height: 150.0,
                                      width: 150.0,
                                    ),
                                    Text('${album.albumName}')
                                  ],
                                )))
                            .toList()
                        : Text('Library is Empty'),
                  ),
                  SizedBox(
                    height: 15.0,
                  ),
                  FloatingActionButton(
                    child: Icon(Icons.add),
                    onPressed: () {
                      addAlbumPage(context);
                    },
                  ),
                ],
              ),
            ));
  }
}
