import 'package:flutter/material.dart';
import 'package:greate_places/providers/great_places.dart';
import 'package:greate_places/screens/add_place_screen.dart';
import 'package:provider/provider.dart';

class PlacesScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Places'),
        actions: [
          IconButton(
              icon: Icon(Icons.add),
              onPressed: () {
                Navigator.of(context).pushNamed(AddPlaceScreen.routeName);
              })
        ],
      ),
      body: FutureBuilder(
        future:
            Provider.of<GreatPlaces>(context, listen: false).fetchAndSetData(),
        builder: (ctx, snapshot) => snapshot.connectionState ==
                ConnectionState.waiting
            ? Center(
                child: CircularProgressIndicator(),
              )
            : Consumer<GreatPlaces>(
                child: Center(
                  child: Text(
                    'you have no places go and add some ',
                    style: TextStyle(color: Colors.black),
                  ),
                ),
                builder: (ctx, data, child) => data.items.length <= 0
                    ? child
                    : ListView.builder(
                        itemBuilder: (ctx, i) => Card(
                          margin: EdgeInsets.all(5),


                          elevation: 5,
                          child: ListTile(
                            leading: CircleAvatar(
                              backgroundImage: FileImage(data.items[i].image),
                            ),
                            title: Text(data.items[i].title),
                          ),
                        ),
                        itemCount: data.items.length,
                      ),
              ),
      ),
    );
  }
}
