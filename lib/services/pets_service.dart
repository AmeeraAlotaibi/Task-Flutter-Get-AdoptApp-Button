import "package:dio/dio.dart";
import 'package:adopt_app/main.dart';

class PetService {
  final dioClient = Dio();

  void getPets() async {
    Response res =
        await dioClient.get("https://coded-pets-api-crud.herokuapp.com/pets");
    print(res.data);
  }
}
