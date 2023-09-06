import 'dart:io';
import 'package:favorite_places/models/place.dart';
import 'package:favorite_places/providers/user_places.dart';
import 'package:favorite_places/widgets/image_input.dart';
import 'package:favorite_places/widgets/location_input.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class AddPlaceScreen extends ConsumerStatefulWidget{
  const AddPlaceScreen({super.key});

  @override
  ConsumerState<AddPlaceScreen> createState() => _AddPlaceScreenState();
}

class _AddPlaceScreenState extends ConsumerState<AddPlaceScreen> {
  final _titleController = TextEditingController();
  File? _selectedImage;
  PlaceLocation? _selectedLoaction;

  void _savePlace() {
    final enteredTitle = _titleController.text;

    if( enteredTitle.isEmpty || _selectedImage == null || _selectedLoaction == null) {
//showDialog(context: context, builder: builder)
      return;
    }

    ref
    .read(userPlacesProvider.notifier)
    .addPlace(enteredTitle, _selectedImage!, _selectedLoaction!);

    Navigator.pop(context); 
  }

  @override
  void dispose() {
    _titleController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        title: Text('Add new place'),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(12),
        child: Column(
        children: [
          TextField(
            decoration: InputDecoration(labelText: 'Title'),
            controller: _titleController,
            style: Theme.of(context).textTheme.bodyMedium!.copyWith(
              color: Theme.of(context).colorScheme.onBackground,
            ),
            ),
            SizedBox(height: 10,),

            ImageInput(onPickImage: (image) {
              _selectedImage = image;
            },),
            SizedBox(height: 10,),
            LocationInput(onSelectLocation: (location) {
              _selectedLoaction = location; 
            },),

            SizedBox(height: 16,),
            ElevatedButton.icon(
              onPressed: _savePlace,
              icon: Icon(Icons.add),
              label: Text('Add place'),
              ),
        ],
      ),
      ),
    );
  }
}