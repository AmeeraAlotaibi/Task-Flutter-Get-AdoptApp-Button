import 'package:adopt_app/models/pet.dart';
import "package:dio/dio.dart";
import 'package:adopt_app/main.dart';

class PetService {
  final dioClient = Dio();

  Future<List<Pet>> getPets() async {
    List<Pet> pets = [];
    try {
      Response res =
          await dioClient.get("https://coded-pets-api-crud.herokuapp.com/pets");
      pets = (res.data as List).map((e) => Pet.fromJson(e)).toList();

      for (int i = 0; i < pets.length; i++) {
        if (pets[i].name == null && pets[i].image == null) {
          pets.add(pets[i]);
          continue;
        }
      }
    } on DioError catch (error) {
      print("Network Error");
    }

    return pets;
  }
}
