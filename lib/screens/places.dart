import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:favorite_places/providers/user_places.dart';
import 'package:favorite_places/screens/add_place.dart';
import 'package:favorite_places/widgets/places_list.dart';

class PlacesScreen extends ConsumerWidget{
  const PlacesScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
  final userPlaces = ref.watch(userPlacesProvider); 

    return Scaffold(
      appBar: AppBar(
        title: Text('Your places'),
        actions: [
          IconButton(onPressed: () {
            Navigator.push(context, MaterialPageRoute(builder: (ctx) => AddPlaceScreen()),);
          },
          icon: Icon(Icons.add),),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: PlacesList(places: userPlaces),
      ),
    );
  }
}