import 'package:adopt_app/models/pet.dart';
import 'package:flutter/material.dart';
import 'package:adopt_app/services/pets_service.dart';

class PetsProvider extends ChangeNotifier {
  List<Pet> pets = [];

  void getPets() async {
    pets = await PetService().getPets();
    notifyListeners();
  }
}
